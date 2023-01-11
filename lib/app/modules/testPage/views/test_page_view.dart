import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/test_page_controller.dart';

class TestPageView extends GetView<TestPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestPageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TestPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
