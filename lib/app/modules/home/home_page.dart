import 'package:doom_fire/app/modules/home/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {

  @override
  void initState() {
    store.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Scaffold(
        appBar: AppBar(
          title: const Text('Doom Fire'),
          centerTitle: true,
        ),
        body: Observer(
          builder: (context) => Column(
            children: store.fireTableArray,
          ),
        ),
      ),
    );
  }
}