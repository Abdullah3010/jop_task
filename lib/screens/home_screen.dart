import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/bloc/task_bloc.dart';
import 'package:jop_task/constant/constants.dart';
import 'package:jop_task/screens/details_screen.dart';
import 'package:jop_task/test_screen.dart';
import 'package:jop_task/widgets/menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const screens = [
      DetailsScreen(),
      TestScreen(),
      TestScreen(),
    ];
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    '(47)0.0.47',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            toolbarHeight: 130, // Set this height
            flexibleSpace: Container(
              color: const Color.fromARGB(255, 9, 4, 98),
            ),
          ),
          body: BlocProvider(
            create: (context) => TaskBloc(),
            child: BlocBuilder<TaskBloc, TaskState>(
              builder: (context, state) {
                final bloc = BlocProvider.of<TaskBloc>(context);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MenuList(items: menuItems),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: screens[bloc.index],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
