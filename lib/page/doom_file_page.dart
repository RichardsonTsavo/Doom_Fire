import 'package:doom_fire/page/doom_fire_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class DoomFirePage extends StatefulWidget {
  const DoomFirePage({Key? key}) : super(key: key);

  @override
  State<DoomFirePage> createState() => _DoomFirePageState();
}

class _DoomFirePageState extends State<DoomFirePage> {
  DoomFireStore store = DoomFireStore();

  @override
  void initState() {
    store.setCanvaSize(value: 35);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Doom Fire Page",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Column(
                  children: [
                    const Text("Resolução dos pixels"),
                    Observer(
                      builder: (_) {
                        return Slider(
                          value: store.canvaSize.toDouble(),
                          min: 0,
                          max: 40,
                          label: store.canvaSize.round().toString(),
                          divisions: 40,
                          onChanged: (value) {
                            store.setCanvaSize(value: value.toInt());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Column(
                  children: [
                    const Text("Força da chama"),
                    Observer(
                      builder: (_) {
                        return Slider(
                          value: store.fireForce.toDouble(),
                          min: 3,
                          max: 8,
                          label: store.fireForce.round().toString(),
                          divisions: 7,
                          onChanged: (value) {
                            store.setFireForce(value: value.toInt());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * 0.8,
                child: Column(
                  children: [
                    const Text("Controle do fps"),
                    Observer(
                      builder: (_) {
                        return Slider(
                          value: store.fireSpeed.toDouble(),
                          min: 50,
                          max: 200,
                          label: store.fireSpeed.round().toString(),
                          divisions: 150,
                          onChanged: (value) {
                            store.setFireSpeed(value: value.toInt());
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Observer(
                builder:
                    (context) => Row(
                      children: [
                        for (int i = 0; i < store.canvaSize; i++)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int j = 0; j < store.canvaSize; j++)
                                Container(
                                  height:
                                      constraints.maxWidth / store.canvaSize,
                                  width: constraints.maxWidth / store.canvaSize,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    color:
                                        store.palette[store.listFirePixel[j *
                                                store.canvaSize +
                                            i]],
                                  ),
                                  alignment: Alignment.center,
                                  // child: Text(
                                  //   "${store.listFirePixel[j * store.canvaSize + i]}",
                                  // ),
                                ),
                            ],
                          ),
                      ],
                    ),
              ),
              Observer(
                builder:
                    (context) => ElevatedButton(
                      onPressed: () {
                        store.setStartFire();
                      },
                      child: Text(!store.startFire ? "Start" : "Stop"),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
