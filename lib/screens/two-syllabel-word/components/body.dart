// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:goodalph/components/draggable.dart';
import 'package:goodalph/components/space-letter.dart';
import 'package:goodalph/constants.dart';
import 'package:goodalph/models/multiple-choice.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    MultipleChoice champ1;
    MultipleChoice champ2;

    void removeAll(MultipleChoice toRemove) {
      multipleChoices.removeWhere((element) => element.choice == toRemove.choice);
    }

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10.0,
        ),
        child: Container(
          height: height(0.8, context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SpaceLetter(
                    chaine: 'b', 
                    context: context, 
                    acceptChaine: 'champ1',
                    onAccept: (data) => setState(() {
                      removeAll(data);
                      champ1 = data;
                    }),
                  ),
                  signe('+'),
                  SpaceLetter(
                    chaine: 'a', 
                    context: context, 
                    acceptChaine: 'champ2',
                    onAccept: (data) => setState(() {
                      champ2 = data;
                    }),
                  ),
                  signe('='),
                  SpaceLetter(
                    chaine: 'ba', 
                    context: context, 
                    acceptChaine: 'non',
                    onAccept: (data) => {},
                  ),
                ],
              ), 
              Container(
                child: GridView.builder(
                  itemCount: multipleChoices.length,
                  itemBuilder: (BuildContext context, int index) {
                    //return Image.asset(images[index], fit: BoxFit.cover);
                    // return choice(multipleChoices[index].choice);
                    return DraggableWidget(chaine: multipleChoices[index]);
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF4A3298),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
