import 'package:flutter/material.dart';
import 'package:jira_task/product.dart';

class ProductModel extends ChangeNotifier {
  Product product = Product(string: '', integer: 0);
}