import 'package:elementary/elementary.dart';
import 'package:jira_task/product.dart';
import 'package:jira_task/product_model.dart';

class SecondScreenModel extends ElementaryModel {
  final ProductModel _productModel;

  SecondScreenModel(this._productModel);

  void onChangeProduct(Product product) {
    _productModel.product = product;
  }

  Product loadProduct() {
    return _productModel.product;
  }
}