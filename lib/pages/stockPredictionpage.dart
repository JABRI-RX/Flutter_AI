import 'package:flutter/material.dart';

class Stockpredictionpage extends StatelessWidget {
  const Stockpredictionpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stock prediction Model"),
      ),
      body: const Center(
        child: Column(
          children: [
            const Text("The Stock market Is down for the moment Try Again "),
          ],
        ),
      ),
    );
  }
}
