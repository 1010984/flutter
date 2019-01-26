import 'package:flutter/material.dart';
import './position.dart';
import './card.dart';

class CardManager extends StatefulWidget {
  final List<int> total = [4, 8, 12];

  final int option;

  CardManager(this.option);

  State<StatefulWidget> createState() {
    int value = total[option] ~/ 2;
    return CardManagerState(value, value, shuffleNumbers(value));
  }

  List<int> shuffleNumbers(int value) {
    List<int> cards = [];
    int numbers = (value * value) ~/ 2;
    for (int i = 1; i <= numbers; i++) {
      cards.add(i);
      cards.add(i);
    }
    cards.shuffle();
    return cards;
  }
}

class CardManagerState extends State<CardManager> {
  List<int> numbers;
  List<Position> positions = [];
  List<Deck> deck = [];
  int linhas;
  int colunas;

  CardManagerState(this.linhas, this.colunas, this.numbers);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(CardManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return giveCards();
  }

  checkCards() {
    List<Deck> blocks = [];
    for (Deck block in deck) {
      if (block.card.isOpen() && !block.card.isResolved()) {
        blocks.add(block);
      }
    }
    print(blocks.length);
    if (blocks.length == 2) {
      print(blocks[0].card.getValue());
      print(blocks[1].card.getValue());
      if (blocks[0].card.getValue() == blocks[1].card.getValue()) {
        blocks[0].card.setResolve(true);
        blocks[1].card.setResolve(true);
      } else {
        blocks[0].card.setState(() {
          blocks[0].card.setStatus(false);
        });
        blocks[1].card.setState(() {
          blocks[1].card.setStatus(false);
        });
      }
    }
  }

  bool checkOnlyTwo() {
    List<Deck> blocks = [];
    for (Deck block in deck) {
      if (block.card.isOpen() && !block.card.isResolved()) {
        blocks.add(block);
      }
    }
    if (blocks.length < 2) {
      return true;
    }
    return false;
  }

  buildDeck() {
    for (int number in numbers) {
      String imageUrl = "./images/icons/" + number.toString() + ".jpg";
      Position position = new Position(imageUrl, number);
      positions.add(position);
    }
  }

  Column giveCards() {
    buildDeck();
    List<Expanded> expandedLines = [];
    int pos = 0;
    for (int i = 0; i < linhas; i++) {
      List<Expanded> expandedColumns = [];
      for (int i = 0; i < colunas; i++) {
        Position position = positions[pos];
        Block block = new Block(this, position.getImage(), position.getValue());
        Deck op = Deck(block);
        deck.add(op);
        expandedColumns.add(new Expanded(child: op));
        pos++;
      }
      expandedLines.add(new Expanded(
          child: Row(
              children: expandedColumns,
              crossAxisAlignment: CrossAxisAlignment.stretch)));
    }
    return Column(children: expandedLines);
  }
}
