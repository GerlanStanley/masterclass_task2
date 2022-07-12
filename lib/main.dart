import 'package:flutter/material.dart';

import 'controlled/expansion_tile/controlled_expansion_tile_page.dart';
import 'home/home_page.dart';

import 'controlled/float_button/controlled_float_button_page.dart';
import 'implicit/expansion_tile/implicit_expansion_tile_page.dart';
import 'implicit/float_button/implicit_float_button_page.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const HomePage(),
      '/implicit_float_button': (context) => const ImplicitFloatButtonPage(),
      '/implicit_expansion_tile': (context) =>
          const ImplicitExpansionTilePage(),
      '/controlled_float_button': (context) =>
          const ControlledFloatButtonPage(),
      '/controlled_expansion_tile': (context) =>
          const ControlledExpansionTilePage(),
    },
  ));
}
