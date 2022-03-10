import 'dart:convert';

import 'package:ezz3/shared/cubit/cubit.dart';
import 'package:ezz3/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:quran/quran.dart' as quran;



class FetchDataScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    List word = ["رَبِّ","ٱلَّذِينَ","صِرَٰطَ","وَمِمَّا","ٱهْدِنَا","بِٱلْغَيْبِ","ٱلدِّينِ","ٱلْكِتَٰبُ",
      "رَبِّ"];

    Map<String, HighlightedWord> words = {
      for(var i =0 ;i<word.length ;i++)...{
        word[i]: HighlightedWord(
          onTap: () {
            showAlertDialog(context,word[i]);
            print(word[i]);
          },
          textStyle: TextStyle(color: Colors.pink),
        ),
      }
    };



    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text("Fetch"),),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      cubit.data[0],
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(color: Colors.pink, fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  for(var i = 1; i < cubit.data.length; i++)...{
                    Padding(
                      padding: const EdgeInsets.all(22.0),
                      child: TextHighlight(
                        text: cubit.data[i]+cubit.verse_list[i],
                        words: words,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ),

                  },
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print(cubit.data.toString());
              //cubit.readJson();
              //print(cubit.data.getRange(5, 9).toString());
            },
            child: Icon(Icons.add,
            ),
          ),
        );
      },
    );
  }
  showAlertDialog(BuildContext context,String text) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(text),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
