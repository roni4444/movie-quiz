import 'dart:html';

import 'package:flutter/material.dart';

import 'QuestionsPage.dart';

class Rules extends StatefulWidget {
  const Rules({Key key}) : super(key: key);

  @override
  _RulesState createState() => _RulesState();
}

class _RulesState extends State<Rules> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text("Rules to follow:"),
              Row(
                children: [
                  Text("Rule 1: "),
                  Text(
                      "When you go to answering page you cannot return to view the question again but while in Question page you can vie it as many times you want."),
                ],
              ),
              Row(
                children: [
                  Text("Rule 1: "),
                  Text(
                      "When you go to answering page you cannot return to view the question again but while in Question page you can vie it as many times you want."),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsPage(),
                      ),
                    );
                  },
                  child: Text("Start Quiz"))
            ],
          ),
        ),
      ),
    );
  }
}
