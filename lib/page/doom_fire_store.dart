import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'doom_fire_store.g.dart';

class DoomFireStore = _DoomFireStoreBase with _$DoomFireStore;

abstract class _DoomFireStoreBase with Store {
  @observable
  int canvaSize = 30;
  @observable
  int fireForce = 7;
  @observable
  int fireSpeed = 80;
  @observable
  bool startFire = false;

  void start() {
    setCanvaSize(value: 40);
    calculateFirePropagation();
    calculateFirePropagation();
  }

  @action
  void setStartFire() {
    startFire = !startFire;
  }

  @action
  void setFireForce({required int value}) {
    fireForce = value;
  }

  @action
  void setFireSpeed({required int value}) {
    fireSpeed = value;
  }

  @action
  void setCanvaSize({required int value}) {
    canvaSize = value;
    createFireDataStructure();
  }

  ObservableList<int> listFirePixel = ObservableList();

  @action
  void createFireDataStructure() {
    listFirePixel.clear();
    int numberOfPixels = canvaSize * canvaSize;
    for (int i = 0; i < numberOfPixels; i++) {
      listFirePixel.add(0);
    }
    createFireSource();
  }

  @action
  void createFireSource() {
    for (int column = 0; column < canvaSize; column++) {
      int overflowPixelIndex = canvaSize * canvaSize;
      int pixelIndex = overflowPixelIndex - canvaSize + column;
      listFirePixel[pixelIndex] = 36;
    }
  }

  Future<void> calculateFirePropagation() async {
    for (int column = 0; column < canvaSize; column++) {
      for (int row = 0; row < canvaSize; row++) {
        int pixelIndex = column + canvaSize * row;
        calculateFireIntensityOfPixel(pixelIndex);
      }
    }
    await Future.delayed(Duration(milliseconds: fireSpeed));
    calculateFirePropagation();
  }

  @action
  void calculateFireIntensityOfPixel(currentPixelIndex) {
    int blowPixelIndex = currentPixelIndex + canvaSize;
    if (blowPixelIndex >= canvaSize * canvaSize) {
      return;
    }

    int decay = Random().nextInt(10 - fireForce);
    int blowPixelFireIntensity = listFirePixel[blowPixelIndex];
    int newFireIntensity = blowPixelFireIntensity - decay;
    newFireIntensity = newFireIntensity < 0 ? 0 : newFireIntensity;

    if ((currentPixelIndex - decay) > 0) {
      listFirePixel[currentPixelIndex - decay] =
          startFire ? newFireIntensity : 0;
    } else {
      listFirePixel[currentPixelIndex] = startFire ? newFireIntensity : 0;
    }
  }

  List palette = [
    const Color.fromARGB(255, 7, 7, 7),
    const Color.fromARGB(255, 31, 7, 7),
    const Color.fromARGB(255, 47, 15, 7),
    const Color.fromARGB(255, 71, 15, 7),
    const Color.fromARGB(255, 87, 23, 7),
    const Color.fromARGB(255, 103, 31, 7),
    const Color.fromARGB(255, 119, 31, 7),
    const Color.fromARGB(255, 143, 39, 7),
    const Color.fromARGB(255, 159, 47, 7),
    const Color.fromARGB(255, 175, 63, 7),
    const Color.fromARGB(255, 191, 71, 7),
    const Color.fromARGB(255, 199, 71, 7),
    const Color.fromARGB(255, 223, 79, 7),
    const Color.fromARGB(255, 223, 87, 7),
    const Color.fromARGB(255, 223, 87, 7),
    const Color.fromARGB(255, 215, 95, 7),
    const Color.fromARGB(255, 215, 95, 7),
    const Color.fromARGB(255, 215, 103, 15),
    const Color.fromARGB(255, 207, 111, 15),
    const Color.fromARGB(255, 207, 119, 15),
    const Color.fromARGB(255, 207, 127, 15),
    const Color.fromARGB(255, 207, 135, 23),
    const Color.fromARGB(255, 199, 135, 23),
    const Color.fromARGB(255, 199, 143, 23),
    const Color.fromARGB(255, 199, 151, 31),
    const Color.fromARGB(255, 191, 159, 31),
    const Color.fromARGB(255, 191, 159, 31),
    const Color.fromARGB(255, 191, 167, 39),
    const Color.fromARGB(255, 191, 167, 39),
    const Color.fromARGB(255, 191, 175, 47),
    const Color.fromARGB(255, 183, 175, 47),
    const Color.fromARGB(255, 183, 183, 47),
    const Color.fromARGB(255, 183, 183, 55),
    const Color.fromARGB(255, 207, 207, 111),
    const Color.fromARGB(255, 223, 223, 159),
    const Color.fromARGB(255, 239, 239, 199),
    const Color.fromARGB(255, 255, 255, 255),
  ];
}
