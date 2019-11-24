import 'package:flutter/material.dart';

void main() => runApp(null);

mixin Fluttering {
  void flutter() {
    print('fluttering');
  }
}

abstract class Insect {
  void crawl() {
    print('crawling');
  }
}

abstract class AirborneInsect extends Insect with Fluttering {
  void flutter() {
    print('fluttering');
  }

  void buzz() {
    print('buzzing annoyingly');
  }
}

class Mosquito extends AirborneInsect {
  void doMosquitoThing() {
    crawl();
    flutter();
    buzz();
    print('sucking blood');
  }
}

abstract class Bird with Fluttering {
  void chirp() {
    print('chirp chirp');
  }
}

mixin Pecking on Bird {
  void peck() {
    print('pecking');
    chirp();
  }
}

class Sparrow extends Bird with Pecking {}

class BlueJay extends Bird with Pecking {}