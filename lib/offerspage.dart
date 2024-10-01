import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Offer(title: 'Offer 1', description: 'Description 1');
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;
  const Offer({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        Text(description),
      ],
    );
  }
}
