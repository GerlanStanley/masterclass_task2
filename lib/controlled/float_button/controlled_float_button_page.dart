import 'package:flutter/material.dart';

class ControlledFloatButtonPage extends StatefulWidget {
  const ControlledFloatButtonPage({Key? key}) : super(key: key);

  @override
  State<ControlledFloatButtonPage> createState() => _ControlledFloatButtonPageState();
}

class _ControlledFloatButtonPageState extends State<ControlledFloatButtonPage>
    with TickerProviderStateMixin {
  late final AnimationController animationController;

  late final Animation roundAnimation;
  late final Animation widthAnimation;
  late final Animation<AlignmentGeometry> alignAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    roundAnimation = Tween<double>(
      begin: 25,
      end: 0,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    widthAnimation = Tween<double>(
      begin: 50,
      end: 100,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    ));

    alignAnimation = Tween<AlignmentGeometry>(
      begin: Alignment.bottomRight,
      end: Alignment.topCenter,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botão Flutuante Controlado"),
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, widget) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: alignAnimation.value,
              child: Container(
                width: widthAnimation.value,
                height: 50,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(roundAnimation.value),
                ),
                child: GestureDetector(
                  onTap: () {
                    if (animationController.value == 1) {
                      animationController.reverse();
                    } else {
                      animationController.forward();
                    }
                  },
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}