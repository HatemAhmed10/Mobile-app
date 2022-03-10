import 'dart:convert';

import 'package:ezz3/modules/Fetch_data/Feetch_data.dart';
import 'package:ezz3/modules/get_data/Get_page.dart';
import 'package:ezz3/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/quran.dart' as quran;
import 'package:backdrop/backdrop.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List data =[];
  List verse_list =[];
  void FetchData(){
     for(var i = 1 ;i<=7 ; i++){
      String str = quran.getVerse(2, i, verseEndSymbol: false);
      data.add(str);
      String verse = quran.getVerseEndSymbol(i);
      verse_list.add(verse);
     }
    emit(AppFetchDataState());
  }



  //
  // void GetData(){
  //   // String str =quran.getVerse(1, 2, verseEndSymbol: false) ;
  //   // print(str);
  //
  //   String arabicText = quran.getVerse(1, 2, verseEndSymbol: false) ;
  //   String arabicFind="رَبِّ";
  //   RegExp arabicExp = new RegExp("(?:^|[^a-zA-Z0-9_\\u06F0-\\u06F9\\u0622\\u0627\\u0628\\u067E\\u062A-\\u062C\\u0686\\u062D-\\u0632\\u0698\\u0633-\\u063A\\u0641\\u0642\\u06A9\\u06AF\\u0644-\\u0648\\u06CC\\u202C\\u064B\\u064C\\u064E-\\u0652])"
  //       "$arabicFind(?![a-zA-Z0-9_\\u06F0-\\u06F9\\u0622\\u0627\\u0628\\u067E\\u062A-\\u062C\\u0686\\u062D-\\u0632\\u0698\\u0633-\\u063A\\u0641\\u0642\\u06A9\\u06AF\\u0644-\\u0648\\u06CC\\u202C\\u064B\\u064C\\u064E-\\u0652])", unicode:true);
  //   bool arabicResult = arabicExp.hasMatch(arabicText);//does not match
  //   if(arabicResult ==true){
  //     List<String> coded = ["رَبِّ", "HOT", "YAH"]; //ABV list
  //     List<String> decoded = ["Gmail", "Hotmail", "Yahoo"];
  //     String result = arabicText.replaceAll(coded[0], decoded[0]); //Replace with Gmail
  //     print(result);
  //   }else{
  //     print(arabicResult); // => true
  //   }
  //   emit(AppGetDataState());
  // }
  //
  //
  //
  // void GetData2(){
  //   List<String> coded = ["GM", "HOT", "YAH"]; //ABV list
  //   List<String> decoded = ['"GM"', "[Hotmail]", "[Yahoo]"]; //corresponding list
  //   String txt = "HOT was the best until GM took over";
  //
  //   if ((txt.contains(coded[0]))) { //GM
  //     String result = txt.replaceAll(coded[0], decoded[0]); //Replace with Gmail
  //     print(result);
  //   }
  //   else if ((txt.contains(coded[0])) && (txt.contains(coded[1]))) {
  //     String result = (txt.replaceAll(coded[0], decoded[0]));
  //     (txt.replaceAll(coded[1], decoded[1]));
  //     print(result);
  //   }
  //   else if ((txt.contains(coded[0])) && (txt.contains(coded[1])) && (txt.contains(coded[2]))) {
  //     String result = txt.replaceAll(coded[0], decoded[0]);
  //     txt.replaceAll(coded[1], decoded[1]);
  //     txt.replaceAll(coded[2], decoded[2]);
  //     print(result);
  //   }
  //   else {
  //     print(txt);
  //   }
  //   emit(AppGetDataState());
  // }



  Future<void> readJson() async {
    print("da");
    List items = [];
    final String response = await rootBundle.loadString('assets/surah.json');
    final data =  json.decode(response);
    //items = data["chapters"];
    print(data.toString());
  }










  int currentIndex = 0;
  List<Widget> screens = [
    FetchDataScreen(),
    Get_page_Screen(),

  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangePageState());
  }

}
