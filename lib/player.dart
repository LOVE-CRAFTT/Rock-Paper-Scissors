import 'package:flutter/material.dart';
import 'package:rock_paper_scissors/gamepage.dart';

class Player extends StatelessWidget {
  const Player({
    super.key,
    required this.state,
    required this.image,
    required this.position,
  });

  final int position;
  final PlayerState state;
  final String image;

  @override
  Widget build(BuildContext context) {
    late Color containerColor;
    late String containerString;

    if (state == PlayerState.standby) {
      containerColor = Colors.yellow;
      containerString = "STANDBY";
    } else if (state == PlayerState.win) {
      containerColor = Colors.green;
      containerString = "WIN";
    } else if (state == PlayerState.lose) {
      containerColor = Colors.red;
      containerString = "LOSE";
    } else if (state == PlayerState.draw) {
      containerColor = Colors.blue;
      containerString = "DRAW";
    } else if (state == PlayerState.winner) {
      containerColor = Colors.deepOrange;
      containerString = "WINNER";
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.brown,
              width: 5.0,
            ),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Center(
                      child: Text(
                        containerString,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Colors.amber,
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: AssetImage(image),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
