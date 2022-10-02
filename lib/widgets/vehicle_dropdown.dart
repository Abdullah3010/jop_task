import 'package:flutter/material.dart';
import 'package:jop_task/widgets/dropdown.dart';

import '../constant/constants.dart';

class VehicleDropDown extends StatefulWidget {
  final ValueNotifier<String> _selectedVehicle =
      ValueNotifier(dropdownItems.keys.first);

  VehicleDropDown();

  @override
  State<VehicleDropDown> createState() => _VehicleDropDownState();
}

class _VehicleDropDownState extends State<VehicleDropDown> {
  @override
  Widget build(BuildContext context) {
    return MiraiDropdownWidget(
      valueNotifier: widget._selectedVehicle,
      itemWidgetBuilder: (int index, String item) {
        return MiraiItemWidget(item: item);
      },
      children: dropdownItems.keys.toList(),
      onChanged: (String value) {
        setState(() {
          widget._selectedVehicle.value = value;
        });
      },
    );
  }
}
