import 'package:flutter/material.dart';

import 'components/item_component.dart';

class ImplicitExpansionTilePage extends StatefulWidget {
  const ImplicitExpansionTilePage({Key? key}) : super(key: key);

  @override
  State<ImplicitExpansionTilePage> createState() =>
      _ImplicitExpansionTilePageState();
}

class _ImplicitExpansionTilePageState extends State<ImplicitExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Tile Implícito"),
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return ItemComponent(index: index);
        },
      ),
    );
  }
}
