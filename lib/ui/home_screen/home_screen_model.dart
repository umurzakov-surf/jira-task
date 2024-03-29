import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:jira_task/product.dart';
import 'package:jira_task/product_model.dart';

class HomeScreenModel extends ElementaryModel {
  final ProductModel _productModel;
  final ValueNotifier<Product> product = ValueNotifier(Product(string: '', integer: 0));

  HomeScreenModel(this._productModel);

  void onChangeProduct(Product newProduct) {
    _productModel.product = newProduct;
    updateProduct();
  }

  void updateProduct() {
    product.value = _productModel.product;
  }
}