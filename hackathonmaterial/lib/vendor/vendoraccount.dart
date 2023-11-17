import 'package:flutter/material.dart';
import 'package:hackathonmaterial/widgets/minAppBar.dart';

class Vendoraccount extends StatelessWidget {
  const Vendoraccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60), child: MinTeachAppBar()),
      body: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: []),
          ),
        ),
      ),
    );
  }
}
