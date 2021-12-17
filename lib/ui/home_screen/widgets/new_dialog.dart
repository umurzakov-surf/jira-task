import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jira_task/product.dart';

class NewDialog extends StatelessWidget {
  final TextEditingController stringController;
  final TextEditingController intController;

  const NewDialog({
    Key? key,
    required this.stringController,
    required this.intController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        children: [
          const Text('enter string'),
          TextField(
            controller: stringController,
          ),
          const SizedBox(height: 20),
          const Text('enter int'),
          TextField(
            controller: intController,
            keyboardType: TextInputType.number,
          ),
          TextButton(
            onPressed: () {
              Product product = Product(
                string: stringController.text,
                integer: int.parse(intController.text),
              );
              Navigator.of(context).pop<Product>(product);
            },
            child: const Text('back'),
          ),
        ],
      ),
    );
  }
}
