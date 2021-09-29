import 'dart:math';

import 'package:doom_fire/app/modules/home/components/pixel.dart';
import 'package:doom_fire/app/modules/shared/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ConstStyle constStyle = ConstStyle();
  List firePixelArray = [];
  ObservableList<Row> fireTableArray = ObservableList();
  int fireWidth = 40;
  int fireHeight = 40;

  Future<void> start() async {
    createFireDataStructure();
    renderFire();
    createFireSource();
    calculateFirePropagation();
  }


  void createFireDataStructure(){
    int numberOfPixels = fireWidth * fireHeight;
    for(int i = 0; i < numberOfPixels;i++){
      firePixelArray.add(0);
    }
  }

  @action
  Future<void> calculateFirePropagation() async {
    for(int column = 0; column < fireWidth;column++){
      for(int row = 0; row < fireHeight;row++){
        int pixelIndex = column + fireWidth * row;
        calculateFireIntensityOfPixel(pixelIndex);
      }
    }
    await Future.delayed(const Duration(milliseconds: 50));
    calculateFirePropagation();
    renderFire();
  }

  void calculateFireIntensityOfPixel(currentPixelIndex){
    int blowPixelIndex = currentPixelIndex + fireWidth;
    if(blowPixelIndex >= fireWidth * fireHeight){
      return;
    }

    int decay = Random().nextInt(3);
    int blowPixelFireIntensity = firePixelArray[blowPixelIndex];
    int newFireIntensity = blowPixelFireIntensity - decay;
    newFireIntensity = newFireIntensity < 0?0:newFireIntensity;

    if((currentPixelIndex - decay) > 0){
      firePixelArray[currentPixelIndex - decay] = newFireIntensity;
    }else{
      firePixelArray[currentPixelIndex] = newFireIntensity;
    }

  }

  @action
  void renderFire(){
    fireTableArray.clear();
    for(int row = 0; row < fireHeight;row++){
      List<Widget> pixels = [];
      for(int column = 0; column < fireWidth;column++){
        int pixelIndex = column + fireWidth * row;
        int pixelIntensityOfFire = firePixelArray[pixelIndex];
        pixels.add(Pixel(value: pixelIntensityOfFire));
      }
      fireTableArray.add(Row(children: pixels));
    }
  }

  void createFireSource(){
    for(int column = 0; column < fireWidth;column++){
      int overflowPixelIndex = fireWidth * fireHeight;
      int pixelIndex = overflowPixelIndex - fireWidth + column;
      firePixelArray[pixelIndex] = 36;
      fireTableArray[fireTableArray.length-1].children[column] = Pixel(value: 36);
    }
  }

}