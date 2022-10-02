import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jop_task/bloc/task_bloc.dart';
import 'package:jop_task/models/menu_item.dart';

class MenuList extends StatefulWidget {
  final List<DetailsListItem> items;

  const MenuList({ required this.items});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  @override
  Widget build(BuildContext context) {
    final itemList = widget.items;
    final bloc = BlocProvider.of<TaskBloc>(context);
    return Container(
      margin: const EdgeInsets.all(22),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < itemList.length; i++)
            Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(i == 0 ? 5 : 0),
                topRight: const Radius.circular(5),
                bottomLeft: const Radius.circular(5),
                bottomRight: Radius.circular(i == itemList.length - 1 ? 5 : 0),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        itemList[i].isExpanded = !itemList[i].isExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 10,
                            child: Center(
                              child: Text(
                                itemList[i].title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 69, 159),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              itemList[i].isExpanded
                                  ? Icons.keyboard_arrow_down
                                  : Icons.keyboard_arrow_left,
                              color: const Color.fromARGB(255, 0, 110, 255),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (itemList[i].isExpanded &&
                      itemList[i].supTitle != null &&
                      itemList[i].supTitle!.isNotEmpty)
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int j = 0; j < itemList[i].supTitle!.length; j++)
                            MaterialButton(
                              onPressed: () {
                                bloc.add(
                                  ChangeSupMenuItem(
                                    index: j,
                                  ),
                                );
                              },
                              padding: EdgeInsets.zero,
                              child: Container(
                                width: double.infinity,
                                height: 30,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                decoration: BoxDecoration(
                                  color: j == bloc.index
                                      ? const Color.fromARGB(255, 0, 192, 156)
                                      : Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    itemList[i].supTitle![j].title,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: j == bloc.index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ]),
                  if (i != itemList.length - 1 && !itemList[i].isExpanded)
                    const Divider(
                      height: 1,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
