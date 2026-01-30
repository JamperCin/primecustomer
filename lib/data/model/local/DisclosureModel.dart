import 'package:primecustomer/data/model/local/base_object.dart';
import 'package:primecustomer/data/model/local/rich_text_model.dart';

class DisclosureModel extends BaseObject {
  String title;
  String message;
  String asset;
  String appBarTitle;
  List<RichTextModel>? richText;
  Function(bool)? onAccepted;

  DisclosureModel({
    this.title = "",
    this.message = "",
    this.asset = "",
    this.onAccepted,
    this.appBarTitle = "",
    this.richText,
  });
}
