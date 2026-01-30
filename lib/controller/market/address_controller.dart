import 'dart:collection';

import 'package:primecustomer/controller/base/base_controller.dart';
import 'package:primecustomer/data/model/local/delivery_address_model.dart';
import 'package:primecustomer/data/model/remote/coordinates.dart';
import 'package:primecustomer/data/model/remote/suggestion.dart';
import 'package:primecustomer/main.dart';
import 'package:primecustomer/res/api/geo_location_api.dart';
import 'package:primecustomer/res/api/navigation_api.dart';
import 'package:primecustomer/res/ui_helpers/places_picker_api.dart';
import 'package:primecustomer/utils/number_utils.dart';
import 'package:primecustomer/utils/validation_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/remote/address_model.dart';

class AddressController extends BaseController {
  RxBool isSavingAddress = false.obs;
  RxBool isValidForm = false.obs;
  Rx<Suggestion> deliveryAddress = const Suggestion().obs;
  Rx<DeliveryAddressModel> selectedAddress = DeliveryAddressModel().obs;
  RxBool isDoneLoading = false.obs;

  RxBool isDoneLoadingAddress = false.obs;
  RxBool isLoadingMoreAddress = false.obs;

  TextEditingController nameTxt = TextEditingController();
  TextEditingController locationTxt = TextEditingController();
  TextEditingController phoneTxt = TextEditingController();

  ///Scroll controller
  ScrollController scrollController = ScrollController();
  bool hasStartedApiCall = false;
  int page = 1;
  RxList<AddressModel> deliveryAddressList = RxList<AddressModel>();

  @override
  void onInit() {
    super.onInit();
    listenToScroll();
  }

  void listenToScroll() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!hasStartedApiCall) {
          page++;
          fetchAllDeliveryAddress(page: page);
        }
      }
    });
  }

  Future<void> fetchAllDeliveryAddress({
    int page = 1,
    Coordinates? shopCoordinates,
  }) async {
    this.page = page;
    fetchListOfDeliveryAddress(
      page: page,
      addressList: deliveryAddressList,
      isDoneLoading: isDoneLoadingAddress,
      isLoadingMore: isLoadingMoreAddress,
      shopCoordinates: shopCoordinates,
    );
  }

  void onAddressSelected(AddressModel address) {
    int index = deliveryAddressList.indexWhere((e) => e.id == address.id);

    deliveryAddressList.value =
        deliveryAddressList.map((e) => e.copyWith(isSelected: false)).toList();

    address = address.copyWith(isSelected: !address.isSelected);
    if (index != -1) {
      deliveryAddressList.removeAt(index);
      deliveryAddressList.insert(index, address);
    }
    //isAddressSelected.value = address.isSelected;

    // if (address.isSelected) {
    //   selectedDeliveryAddress.value = address;
    // } else {
    //   selectedDeliveryAddress.value = const AddressModel();
    // }
  }

  ///Should be Initialised when the screen usage of this controller is called
  Future<void> onInitData() async {
    await clearFields();
    await prePopulateAddressWithData();
    await fetchAllDeliveryAddress();
  }

  ///Fetch all the delivery addresses from the api
  Future<void> fetchListOfDeliveryAddress({
    int page = 1,
    RxBool? isDoneLoading,
    RxBool? isLoadingMore,
    RxList<AddressModel>? addressList,
    Coordinates? shopCoordinates,
  }) async {
    if (page == 1) {
      addressList?.clear();
      isDoneLoading?.value = false;
    } else {
      isLoadingMore?.value = true;
    }

    await webService?.fetchDeliveryAddress(page, (response) async {
      if (page == 1) {
        isDoneLoading?.value = true;
      } else {
        isLoadingMore?.value = false;
      }

      await handleAddress(
          response.data?.addresses ?? [], shopCoordinates, addressList);
      await sortByWithinRange(addressList);
    });
  }

  ///Sort all addresses that are within range and show above whiles those not in range below
  Future<void> sortByWithinRange(RxList<AddressModel>? addressList) async {
    addressList?.sort((a, b) =>
        b.isWithinRange.toString().compareTo(a.isWithinRange.toString()));
  }

  ///Handle the address response
  Future<void> handleAddress(
    List<AddressModel> list,
    Coordinates? shopCoordinates,
    RxList<AddressModel>? addressList,
  ) async {
    addressList?.addAll(list.map((info) => GeoLocationApi.updateAddressModel(
        info,
        shopCoordinates: shopCoordinates)));
  }

  ///Pre-Populate the name and phone number with client's details
  Future<void> prePopulateAddressWithData() async {
    nameTxt.text = prefUtils.getFullName();
    phoneTxt.text = prefUtils.getPhoneNumber();
  }

  Future<void> clearFields() async {
    nameTxt.clear();
    locationTxt.clear();
    phoneTxt.clear();
    isValidForm.value = false;
    isSavingAddress.value = false;
    isDoneLoadingAddress.value = false;
    deliveryAddressList.clear();
  }

  ///Save the entered address to the api
  void onSaveAddressOnClick({Function(AddressModel)? call}) {
    if (!isValidForm.value) {
      return;
    }

    HashMap<String, Object> params = HashMap();

    params.putIfAbsent("residential_address",
        () => deliveryAddress.value.description); //repeat same here
    params.putIfAbsent("full_name", () => getStringData(nameTxt));
    params.putIfAbsent("phone_number",
        () => NumberUtils.cleanPhoneNumber(getStringData(phoneTxt)));
    // Coordinates cord = Coordinates(
    //   address: deliveryAddress.value.description,
    //   longitude: "${deliveryAddress.value.longitude}",
    //   latitude: "${deliveryAddress.value.latitude}",
    // );
    params.putIfAbsent("address", () => deliveryAddress.value.description);
    params.putIfAbsent("latitude", () => deliveryAddress.value.latitude);
    params.putIfAbsent("longitude", () => deliveryAddress.value.longitude);

    isSavingAddress.value = true;
    webService?.createAddress(params, (response) {
      // isSavingAddress.value = false;
      clearFields();

      NavApi.fireBack();
      if (call != null) {
        Coordinates coordinate = Coordinates(
          address: deliveryAddress.value.description,
          latitude: deliveryAddress.value.latitude.toString(),
          longitude: deliveryAddress.value.longitude.toString(),
        );

        AddressModel model = AddressModel(
          name: getStringData(nameTxt),
          residentialAddress: coordinate.address,
          phone: NumberUtils.cleanPhoneNumber(getStringData(phoneTxt)),
          coordinate: coordinate,
        );

        call(GeoLocationApi.updateAddressModel(model));
      }
    });
  }

  void validateForm() {
    isValidForm.value = getStringData(nameTxt).isNotEmpty;
    // isValidForm.value = getStringData(addressTxt).isNotEmpty;

    if (!isValidForm.value) {
      return;
    }

    isValidForm.value = getStringData(locationTxt).isNotEmpty;

    if (!isValidForm.value) {
      return;
    }

    isValidForm.value = ValidationUtils.isValidPhone(
        NumberUtils.cleanPhoneNumber(getStringData(phoneTxt)));

    print("Onchanged == ${isValidForm.value}");
  }

  void pickLocation() {
    PlacesPickerApi.searchLocation((address) async {
      locationTxt.text = address.address;
      deliveryAddress.value = address;
      validateForm();
      dismissKeyboard(context: mContext);
    });
    // MapPlacesPickerApi.pickLocation((sug) {
    //   locationTxt.text = sug.address;
    //   deliveryAddress.value = sug;
    //   validateForm();
    //   print("Address here == ${sug}");
    // });
  }

  void onAddressChecked(AddressModel mod, bool isChanged) {
    // for (AddressModel mod in addressList) {
    //   mod.isSelected?.value = false;
    // }
    // mod.isSelected?.value = isChanged;
    // selectedAddress.value = mod;
  }
}
