import 'package:flutter/material.dart';
import 'package:jop_task/constant/constants.dart';
import 'package:mirai_dropdown_menu/mirai_dropdown_menu.dart';

class MiraiDropdownWidget<String> extends StatelessWidget {
  MiraiDropdownWidget({
    Key? key,
    required this.valueNotifier,
    required this.itemWidgetBuilder,
    required this.children,
    required this.onChanged,
    this.focused = false,
    this.showSeparator = true,
    this.exit = MiraiExit.fromAll,
    this.chevronDownColor,
    this.showMode = MiraiShowMode.bottom,
    this.maxHeight,
    this.showSearchTextField = false,
    this.showOtherAndItsTextField = false,
    this.other,
  }) : super(key: key);

  final ValueNotifier<String> valueNotifier;
  final MiraiDropdownBuilder<String> itemWidgetBuilder;
  final List<String> children;
  final ValueChanged<String> onChanged;
  bool? focused;
  final bool showSeparator;
  final MiraiExit exit;
  final Color? chevronDownColor;
  final MiraiShowMode showMode;
  final double? maxHeight;
  final bool showSearchTextField;
  final bool showOtherAndItsTextField;
  final Widget? other;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: MiraiPopupMenu<String>(
        key: UniqueKey(),
        enable: true,
        space: 0,
        showMode: showMode,
        exit: exit,
        showSeparator: showSeparator,
        children: children,
        itemWidgetBuilder: itemWidgetBuilder,
        onChanged: (value) {
          onChanged(value);
        },
        maxHeight: maxHeight,
        showOtherAndItsTextField: showOtherAndItsTextField,
        showSearchTextField: showSearchTextField,
        other: other,
        child: Container(
          key: GlobalKey(),
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 192, 156),
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: ValueListenableBuilder<String>(
                  valueListenable: valueNotifier,
                  builder: (_, String chosenTitle, __) {
                    return AnimatedSwitcher(
                      duration: const Duration(milliseconds: 100),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(
                              left: 7,
                            ),
                            child: Text(
                              '${dropdownItems[chosenTitle]}',
                              key: ValueKey<String>(chosenTitle),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MiraiItemWidget extends StatelessWidget {
  const MiraiItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final String item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Text(
            dropdownItems[item]!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
