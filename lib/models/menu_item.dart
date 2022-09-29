import 'package:jop_task/models/menu_sub_item.dart';

class DetailsListItem {
  final String title;
  final List<DetailsSubListItem>? supTitle;
  bool isExpanded;
 
  DetailsListItem({
    required this.title,
    this.supTitle,
    this.isExpanded = false,
  });
}
