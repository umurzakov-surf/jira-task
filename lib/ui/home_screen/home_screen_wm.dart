import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:jira_task/main.dart';
import 'package:jira_task/product.dart';
import 'package:jira_task/product_model.dart';
import 'package:jira_task/ui/home_screen/home_screen.dart';
import 'package:jira_task/ui/home_screen/home_screen_model.dart';
import 'package:jira_task/ui/home_screen/widgets/new_dialog.dart';

HomeScreenWM homeScreenWMFactory(BuildContext context) {
  return HomeScreenWM(HomeScreenModel(getIt<ProductModel>()));
}

class HomeScreenWM extends WidgetModel<HomeScreen, HomeScreenModel> {
  final TextEditingController stringController = TextEditingController();
  final TextEditingController intController = TextEditingController();

  ValueNotifier<Product> get product => model.product;

  HomeScreenWM(HomeScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    stringController.addListener(onInputsChange);
    intController.addListener(onInputsChange);
  }

  void onInputsChange() {
    model.onChangeProduct(Product(
      string: stringController.text,
      integer: intController.text.isEmpty ? 0 : int.parse(intController.text),
    ));
  }

  Future<void> toSecondScreen() async {
    await Navigator.of(context)
        .pushNamed('/second')
        .then((value) {
      model.updateProduct();
    });
  }

  Future<void> showNewDialog() async {
    var newProduct = await showDialog<Product?>(
      context: context,
      builder: (_) {
        return NewDialog(
          stringController: stringController,
          intController: intController,
        );
      },
    );
    if(newProduct != null) model.onChangeProduct(newProduct);
  }
}
