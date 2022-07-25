import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Data extends Equatable {
  late String text;
  late int count;
  late Color color;
  late String svgAsset;

  Data(String text, int count) {
    this.text = text;
    this.count = count;
    if (text == 'food') {
      this.color = Color(0xff0293ee);
      this.svgAsset = 'lib/assets/statistics-icons/food.svg';
    } else if (text == 'activity') {
      this.color = Color(0xfff8b250);
      this.svgAsset = 'lib/assets/statistics-icons/activity.svg';
    } else if (text == 'the vegetarian') {
      this.color = Color(0xff13d38e);
      this.svgAsset = 'lib/assets/statistics-icons/the-vegetarian.svg';
    } else if (text == 'the western palate') {
      this.color = Color(0xfff8b250);
      this.svgAsset = 'lib/assets/statistics-icons/the-western-palate.svg';
    } else if (text == 'the sweet tooth') {
      this.color = Color(0xff845bef);
      this.svgAsset = 'lib/assets/statistics-icons/the-sweet-tooth.svg';
    } else if (text == 'the cafe hopper') {
      this.color = Color(0xff0293ee);
      this.svgAsset = 'lib/assets/statistics-icons/the-cafe-hopper.svg';
    } else if (text == 'the asian palate') {
      this.color = Color(0xffED6A5E);
      this.svgAsset = 'lib/assets/statistics-icons/the-asian-palate.svg';
    } else if (text == 'the partier') {
      this.color = Color(0xff845bef);
      this.svgAsset = 'lib/assets/statistics-icons/the-partier.svg';
    } else if (text == 'the cultured one') {
      this.color = Color(0xffC8FFBE);
      this.svgAsset = 'lib/assets/statistics-icons/the-cultured-one.svg';
    } else if (text == 'the local "tourist"') {
      this.color = Color(0xfff8b250);
      this.svgAsset = 'lib/assets/statistics-icons/the-local-tourist.svg';
    } else if (text == 'the thrill seeker') {
      this.color = Color(0xffED6A5E);
      this.svgAsset = 'lib/assets/statistics-icons/the-thrill-seeker.svg';
    } else if (text == 'the animal lover') {
      this.color = Color(0xff0293ee);
      this.svgAsset = 'lib/assets/statistics-icons/the-animal-lover.svg';
    } else if (text == 'the nature lover') {
      this.color = Color(0xff13d38e);
      this.svgAsset = 'lib/assets/statistics-icons/the-nature-lover.svg';
    } else if (text == 'the shopping fanatic') {
      this.color = Color(0xffF8BDC4);
      this.svgAsset = 'lib/assets/statistics-icons/the-shopping-fanatic.svg';
    }
  }

  @override
  List<Object?> get props => [text, count, color, svgAsset];
}
