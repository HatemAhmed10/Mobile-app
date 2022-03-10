
import 'dart:convert';

import 'package:ezz3/shared/cubit/cubit.dart';
import 'package:ezz3/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;



class Get_page_Screen extends StatefulWidget
{
  @override
  _Get_page_ScreenState createState() => _Get_page_ScreenState();
}

class _Get_page_ScreenState extends State<Get_page_Screen> {

  @override
  Widget build(BuildContext context) {
    print("Get_page_Screen");
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        AppCubit cubit = AppCubit.get(context);
        final int index = 1;
        int count = quran.getVerseCount(index + 1);
        return Scaffold(
          appBar: AppBar(title: Text("Get"),),
          body: Container(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 26.0,
                ),
                SafeArea(
                  minimum: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                      child: RichText(
                        textDirection: TextDirection.rtl,
                        text: TextSpan(
                          text: '',
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            for (var i = 1; i <= count; i++) ...{
                              TextSpan(
                                text: quran.getVerse(index + 1, 10, verseEndSymbol: false),
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'kitab'),
                              ),
                              TextSpan(
                                text: quran.getVerseEndSymbol(i),
                                style: TextStyle(
                                  color: Colors.cyanAccent,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'kitab',
                                ),
                              ),
                            }
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
            },
            child: Icon(Icons.add,
            ),
          ),
        );
      },
    );
  }
}