// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../../data/models/custom_card_model.dart';
import '../../../views/home_main_item.dart';
import '../Finals/finals_screen.dart';
import '../add_note/add.dart';
import '../events/events_screen.dart';
import '../lectures/lectures_screen.dart';
import '../midterms/mid_terms_screen.dart';
import '../notes/note.dart';
import '../notes/notes_screen.dart';
import '../sections/sections.dart';

class HomeGrid extends StatelessWidget {
  HomeGrid({Key? key}) : super(key: key);
  List<CustomCardModel> customCardModelDummyDataList = [
    CustomCardModel(
        title: 'Lectures', icon: Icons.book, screen:  LecturesScreen()),
    CustomCardModel(
        title: 'Sections', icon: Icons.people, screen:  SectionsScreen()),
    CustomCardModel(
        title: 'Mid Terms',
        icon: Icons.text_snippet,
        screen:  MidTermsScreen()),
    CustomCardModel(
        title: 'Finals', icon: Icons.event_sharp, screen: const FinalsScreen()),
    CustomCardModel(
        title: 'Events', icon: Icons.event_note, screen: const EventsScreen()),
    CustomCardModel(
        title: 'Notes', icon: Icons.note_alt, screen:  const NotesScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: RichText(
                  text: const TextSpan(
                      text: "Orange",
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                      children: <TextSpan>[
                    TextSpan(
                      text: ' Digital Center',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ])),
            ),
          ),
          Expanded(
            flex: 6,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
              ),
              itemCount: customCardModelDummyDataList.length,
              itemBuilder: (context, index) => HomeCardItem(
                homeCardModel: customCardModelDummyDataList[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
