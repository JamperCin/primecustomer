import 'package:primecustomer/data/model/local/base_object.dart';

class WebModel extends BaseObject {
  final String? url;
  final String? title;
  final Function? onDoneOnclick;
  final bool controlPage;

  WebModel(
      {this.url, this.title, this.onDoneOnclick, this.controlPage = false});
}
