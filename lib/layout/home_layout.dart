import 'package:conditional_builder/conditional_builder.dart';
import 'package:ezz3/shared/cubit/cubit.dart';
import 'package:ezz3/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    print("home");
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..FetchData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if(state is AppChangePageState)
          {
            // Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: ConditionalBuilder(
              condition: state is! AppChangeBottomSheetState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {
            //     cubit.changeIndex(0);
            //   },
            //   child: Icon(Icons.add,
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
