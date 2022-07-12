import 'package:flutter/material.dart';

class ItemComponent extends StatefulWidget {
  final int index;

  const ItemComponent({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemComponent> createState() => _ItemComponentState();
}

class _ItemComponentState extends State<ItemComponent> {
  double expansion = 0;
  double rotation = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expansion = expansion == 1 ? 0 : 1;
          rotation = rotation == 0.5 ? 0 : 0.5;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text("My expansion tile ${widget.index + 1}"),
            trailing: AnimatedRotation(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              turns: rotation,
              child: const Icon(Icons.keyboard_arrow_down)
            ),
          ),
          ClipRect(
            child: AnimatedAlign(
              alignment: Alignment.center,
              heightFactor: expansion,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              child: Column(
                children: const [
                  FlutterLogo(
                    size: 50,
                  ),
                  Text(
                    "Lorem Ipsum is simply dummy text of the printing and "
                    "typesetting industry. Lorem Ipsum has been the "
                    "industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and "
                    "scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, "
                    "but also the leap into electronic typesetting, "
                    "remaining essentially unchanged. "
                    "It was popularised in the 1960s with the release of "
                    "Letraset sheets containing Lorem Ipsum passages, "
                    "and more recently with desktop publishing software "
                    "like Aldus PageMaker including versions of "
                    "Lorem Ipsum.",
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
