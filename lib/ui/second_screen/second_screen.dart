import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:jira_task/ui/second_screen/second_screen_wm.dart';

class SecondScreen extends ElementaryWidget<SecondScreenWM> {
  const SecondScreen({Key? key}) : super(secondScreenWMFactory, key: key);

  @override
  Widget build(SecondScreenWM wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second screen'),
      ),
      body: Column(children: [
        const Text('enter string'),
        TextField(
          controller: wm.stringController,
        ),
        const SizedBox(height: 20),
        const Text('enter int'),
        TextField(
          controller: wm.intController,
          keyboardType: TextInputType.number,
        ),
      ],),
    );
  }
}
