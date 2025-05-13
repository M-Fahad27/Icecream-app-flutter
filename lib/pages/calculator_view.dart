// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  int x = 0;
  int y = 0;
  num z = 0;

  final displayonecontroller = TextEditingController();
  final displaytwocontroller = TextEditingController();

  @override
  void initState() {
    displayonecontroller.text = x.toString();
    displayonecontroller.text = x.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          calculator_display(
            hint: "Enter First Number",
            controller: displayonecontroller,
          ),
          SizedBox(height: 30.0),
          calculator_display(
            hint: "Enter Second Number",
            controller: displaytwocontroller,
          ),
          SizedBox(height: 40.0),
          Text(
            z.toString(),
            style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z =
                        num.tryParse(displayonecontroller.text)! +
                        num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z =
                        num.tryParse(displayonecontroller.text)! -
                        num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: Icon(CupertinoIcons.minus),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z =
                        num.tryParse(displayonecontroller.text)! *
                        num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z =
                        num.tryParse(displayonecontroller.text)! /
                        num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {
              setState(() {
                x = 0;
                y = 0;
                z = 0;
                displayonecontroller.clear();
                displaytwocontroller.clear();
              });
            },
            label: Text("Clear"),
          ),
        ],
      ),
    );
  }
}

class calculator_display extends StatelessWidget {
  calculator_display({
    super.key,
    this.hint = "Enter A Number",
    required this.controller,
  });
  final String? hint;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      controller: controller,
      keyboardType: TextInputType.number,
      autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 3.0),
          borderRadius: BorderRadius.circular(17.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(17.0),
        ),

        hintText: (hint),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
