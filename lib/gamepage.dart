import 'dart:math';
import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/player.dart';

enum PlayerState { standby, win, lose, draw, winner }

class GamePage extends StatefulWidget {
  const GamePage({super.key, required this.playerCount});

  final int playerCount;

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late int playerCount;
  Random random = Random();
  var imageName = ["rock.png", "paper.png", "scissors.png"];
  int maxRowNumber = 5;
  List<Player> firstRow = [];
  List<Player> secondRow = [];
  List<Player> activePlayers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playerCount = widget.playerCount;
    createPlayers(playerCount);
  }

  void createPlayers(int playerCount) {
    firstRow.clear();
    secondRow.clear();
    if (playerCount <= maxRowNumber) {
      if (playerCount == 1) {
        playerCount = 2;
      }
      for (var i = 1; i <= playerCount; i++) {
        firstRow.add(Player(
          state: PlayerState.standby,
          image: imageName[0],
          position: i,
        ));
      }
    } else {
      for (var i = 1; i <= maxRowNumber; i++) {
        firstRow.add(Player(
          state: PlayerState.standby,
          image: imageName[0],
          position: i,
        ));
      }
      for (var i = 1; i <= playerCount - maxRowNumber; i++) {
        secondRow.add(Player(
          state: PlayerState.standby,
          image: imageName[0],
          position: i + maxRowNumber,
        ));
      }
    }
  }

  void changeHand() {
    for (int i = 0; i < firstRow.length; i++) {
      var newImage = imageName[random.nextInt(3)];
      firstRow[i] = Player(
        state: firstRow[i].state,
        image: firstRow[i].state == PlayerState.win ||
                firstRow[i].state == PlayerState.draw
            ? newImage
            : firstRow[i].image,
        position: firstRow[i].position,
      );
    }
    for (int i = 0; i < secondRow.length; i++) {
      var newImage = imageName[random.nextInt(3)];
      secondRow[i] = Player(
        state: secondRow[i].state,
        image: secondRow[i].state == PlayerState.win ||
                secondRow[i].state == PlayerState.draw
            ? newImage
            : secondRow[i].image,
        position: secondRow[i].position,
      );
    }
    setState(() {});
  }

  void updateState() {
    activePlayers.clear();
    for (int i = 0; i < firstRow.length; i++) {
      if (firstRow[i].state != PlayerState.lose) {
        activePlayers.add(firstRow[i]);
      }
    }
    for (int i = 0; i < secondRow.length; i++) {
      if (secondRow[i].state != PlayerState.lose) {
        activePlayers.add(secondRow[i]);
      }
    }

    if (activePlayers.length == 1) {
      for (int i = 0; i < activePlayers.length; i++) {
        if (activePlayers[i].position <= maxRowNumber) {
          firstRow[activePlayers[i].position - 1] = Player(
              state: PlayerState.winner,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
          setState(() {});
        } else {
          secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
              state: PlayerState.winner,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
          setState(() {});
        }
      }
      return;
    }
    //
    List<String> images =
        activePlayers.map((element) => element.image).toList();
    //
    if (activePlayers.every((element) =>
        element.image == 'rock.png' ||
        element.image == 'paper.png' ||
        element.image == 'scissors.png')) {
      for (int i = 0; i < activePlayers.length; i++) {
        if (activePlayers[i].position <= maxRowNumber) {
          firstRow[activePlayers[i].position - 1] = Player(
              state: PlayerState.draw,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
        } else {
          secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
              state: PlayerState.draw,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
        }
      }
    }
    //
    if (Set.from(images).length == 2) {
      if (images.contains('rock.png') && images.contains('paper.png')) {
        for (int i = 0; i < activePlayers.length; i++) {
          if (activePlayers[i].image == 'paper.png') {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          } else {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          }
        }
      } else if (images.contains('rock.png') &&
          images.contains('scissors.png')) {
        for (int i = 0; i < activePlayers.length; i++) {
          if (activePlayers[i].image == 'rock.png') {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          } else {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          }
        }
      } else if (images.contains('paper.png') &&
          images.contains('scissors.png')) {
        for (int i = 0; i < activePlayers.length; i++) {
          if (activePlayers[i].image == 'scissors.png') {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.win,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          } else {
            if (activePlayers[i].position <= maxRowNumber) {
              firstRow[activePlayers[i].position - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            } else {
              secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
                  state: PlayerState.lose,
                  image: activePlayers[i].image,
                  position: activePlayers[i].position);
            }
          }
        }
      }
    } else if (Set.from(images).length == 1) {
      for (int i = 0; i < activePlayers.length; i++) {
        if (activePlayers[i].position <= maxRowNumber) {
          firstRow[activePlayers[i].position - 1] = Player(
              state: PlayerState.draw,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
        } else {
          secondRow[activePlayers[i].position - maxRowNumber - 1] = Player(
              state: PlayerState.draw,
              image: activePlayers[i].image,
              position: activePlayers[i].position);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: firstRow,
              ),
            ),
            Expanded(
              child: Row(
                children: secondRow,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeHand();
          updateState();
        },
        child: const Text('RUN'),
      ),
    );
  }
}
