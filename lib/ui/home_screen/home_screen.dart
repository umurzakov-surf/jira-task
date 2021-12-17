import 'package:flutter/material.dart';
import 'package:elementary/elementary.dart';
import 'package:jira_task/product.dart';
import 'package:jira_task/ui/home_screen/home_screen_wm.dart';

class HomeScreen extends ElementaryWidget<HomeScreenWM> {
  const HomeScreen({Key? key}) : super(homeScreenWMFactory, key: key);

  @override
  Widget build(HomeScreenWM wm) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('test app'),
          actions: [
            IconButton(
              icon: const Icon(Icons.keyboard_arrow_right_sharp),
              onPressed: wm.toSecondScreen,
            ),
          ]
        ),
        body: ValueListenableBuilder(
          valueListenable: wm.product,
          builder: (_, Product data, __) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('string: ${data.string}'),
                  Text('int: ${data.integer}'),
                  TextButton(
                    onPressed: wm.showNewDialog,
                    child: const Text('show dialog'),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      primary: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }
}
