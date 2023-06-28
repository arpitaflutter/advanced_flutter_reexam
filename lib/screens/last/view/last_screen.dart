import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({Key? key}) : super(key: key);

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/json/congratulations.json"),
              Text(
                "Congratulation!!",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.green.shade900),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You win the quiz...",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue.shade900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
