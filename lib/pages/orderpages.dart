import 'package:flutter/material.dart';
import '../datamanager.dart';

class OrderPages extends StatelessWidget {
  final DataManager dataManager;
  const OrderPages({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Order'),
      ),
    );
  }
}
