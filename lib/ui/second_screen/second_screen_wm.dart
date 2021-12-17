import 'package:flutter/cupertino.dart';
import 'package:jira_task/product.dart';
import 'package:elementary/elementary.dart';
import 'package:jira_task/product_model.dart';
import 'package:jira_task/ui/second_screen/second_screen.dart';
import 'package:jira_task/ui/second_screen/second_screen_model.dart';

import '../../main.dart';

SecondScreenWM secondScreenWMFactory(BuildContext context) => SecondScreenWM(
      SecondScreenModel(getIt<ProductModel>()),
    );

class SecondScreenWM extends WidgetModel<SecondScreen, SecondScreenModel> {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController intController = TextEditingController();

  SecondScreenWM(SecondScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    stringController.addListener(onInputsChange);
    intController.addListener(onInputsChange);
    _loadProduct();
  }

  void onInputsChange() {
    model.onChangeProduct(Product(
      string: stringController.text,
      integer: intController.text.isEmpty ? 0 : int.parse(intController.text),
    ));
  }

  void _loadProduct() {
    Product product = model.loadProduct();
    stringController.text = product.string;
    intController.text = '${product.integer}';
  }
}
