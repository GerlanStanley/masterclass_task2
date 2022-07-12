import 'package:flutter/material.dart';

class ImplicitFloatButtonPage extends StatefulWidget {
  const ImplicitFloatButtonPage({Key? key}) : super(key: key);

  @override
  State<ImplicitFloatButtonPage> createState() => _ImplicitFloatButtonPageState();
}

class _ImplicitFloatButtonPageState extends State<ImplicitFloatButtonPage> {
  double width = 50;
  double radius = 25;
  Alignment alignment = Alignment.bottomRight;

  bool isInitial = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botão Flutuante Implícito"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            AnimatedAlign(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn,
              alignment: alignment,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                width: width,
                height: 50,
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(radius),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isInitial = !isInitial;
                      width = isInitial ? 50 : 100;
                      radius = isInitial ? 25 : 0;
                      alignment =
                          isInitial ? Alignment.bottomRight : Alignment.topCenter;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
