import 'package:flutter/material.dart';

import 'components/item_component.dart';

class ControlledExpansionTilePage extends StatefulWidget {
  const ControlledExpansionTilePage({Key? key}) : super(key: key);

  @override
  State<ControlledExpansionTilePage> createState() =>
      _ControlledExpansionTilePageState();
}

class _ControlledExpansionTilePageState
    extends State<ControlledExpansionTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expansion Tile Controlado"),
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

