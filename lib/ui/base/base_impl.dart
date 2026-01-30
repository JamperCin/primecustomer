import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseImpl extends Widget {
  const BaseImpl({Key? key}) : super(key: key);

  List<Widget> listView();

  ///This sets the counter set on the abb bar.
  ///Default value is set to 0
  RxInt counter();

  ///Set a new model to this current Page
  void setModel(BaseObject baseObject);

  ///Get the current Model of this page
  BaseObject getModel();

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
