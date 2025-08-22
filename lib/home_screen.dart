import 'dart:math';

import 'package:flutter/material.dart';
import 'package:motivate_me/quotes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color bgColor = Colors.white;
  Color textColor = Colors.black;
  int quoteIndex = 0;

  void changeQuote() {
    final Random random = Random();
    quoteIndex = random.nextInt(quotes.length);
    // setState(() {});
    changeBgColor();
  }

  void changeBgColor() {
    final Random random = Random();
    bgColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    textColor = bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    changeQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                quotes[quoteIndex]['text'] ?? "",
                // "Better an oops than a what if.",
                style: TextStyle(
                  fontSize: 24,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                // "- Unknown Author",
                "- ${quotes[quoteIndex]['author'] != '' ? quotes[quoteIndex]['author'] : 'unknown'}",
                style: TextStyle(
                  fontSize: 12,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: textColor),
                onPressed: () {
                  changeQuote();
                },
                child: Text(
                  "New Quote",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: bgColor,
                    fontWeight: FontWeight.w600,
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
