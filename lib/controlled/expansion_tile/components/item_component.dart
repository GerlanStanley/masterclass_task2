import 'package:flutter/material.dart';

class ItemComponent extends StatefulWidget {
  final int index;

  const ItemComponent({Key? key, required this.index}) : super(key: key);

  @override
  State<ItemComponent> createState() => _ItemComponentState();
}

class _ItemComponentState extends State<ItemComponent>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation rotationIconAnimation;
  late final Animation expansionAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    rotationIconAnimation = Tween<double>(
      begin: 0,
      end: 3.14,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    expansionAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (animationController.value == 1) {
              animationController.reverse();
            } else {
              animationController.forward();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("My expansion tile ${widget.index + 1}"),
                trailing: Transform.rotate(
                  angle: rotationIconAnimation.value,
                  child: const Icon(Icons.keyboard_arrow_down),
                ),
              ),
              ClipRect(
                child: Align(
                  alignment: Alignment.center,
                  heightFactor: expansionAnimation.value,
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
      },
    );
  }
}
