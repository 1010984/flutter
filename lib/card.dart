import 'package:flutter/material.dart';
import './card_manager.dart';
import 'dart:async';

class Deck extends StatefulWidget {
  final Block card;

  Deck(this.card);

  State<StatefulWidget> createState() {
    return card;
  }
}

class Block extends State<Deck> {
  String imageUrl;
  String image = "./images/carta.jpg";
  String defaultImage = "./images/carta.jpg";
  bool status;
  bool resolve;
  int value;
  CardManagerState cardManager;
  Container container;

  Block(this.cardManager, this.imageUrl, this.value,
      {this.status = false, this.resolve = false});

  @override
  void initState() {
    status = false;
    super.initState();
  }

  @override
  void didUpdateWidget(Deck oldWidget) {
    setImage();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(1.0),
      child: new Container(
        child: FlatButton(
          color: Colors.white,
          onPressed: () {
            setState(() {
              if (cardManager.checkOnlyTwo()) {
                setStatus(!status);
              }
              callCheck();
            });
          },
          child: Text(status.toString()),
        ),
        foregroundDecoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  callCheck() {
    const twentyMillis = const Duration(milliseconds: 3000);
    new Timer(twentyMillis, () => cardManager.checkCards());
  }

  Container getCard() {
    return this.container;
  }

  setStatus(bool status) {
    if (!resolve) {
      this.status = status;
      setImage();
    }
  }

  setImage() {
    this.image = !status ? defaultImage : imageUrl;
  }

  /*  Future<void> setStatus(bool status) async {
    return new Future.delayed(
        const Duration(seconds: 1), () => setCondition(status));
  } */

  bool isOpen() {
    return status;
  }

  setImageUrl(String image) {
    this.imageUrl = image;
  }

  setValue(int value) {
    this.value = value;
  }

  int getValue() {
    return value;
  }

  bool isResolved() {
    return resolve;
  }

  setResolve(bool resolve) {
    this.resolve = resolve;
  }
}
