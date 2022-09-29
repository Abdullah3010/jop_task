import 'package:jop_task/models/menu_item.dart';
import 'package:jop_task/models/menu_sub_item.dart';

const Map<String, String> dropdownItems = {
  '1': 'سليمه-يمكن فسحها',
  '3': 'سليمه-سحب عينات',
  '4': 'لم يتم الفحص-تعاد للاشعه',
  '5': 'حجز المركبه ومنع فسحها',
};

List<DetailsListItem> menuItems = [
  DetailsListItem(
    title: 'التفاصيل',
  ),
  DetailsListItem(
    title: 'معاينه الشاحنات',
    supTitle: [
      DetailsSubListItem(
        title: 'بيانات الشاحنات',
      ),
      DetailsSubListItem(
        title: 'تسجيل نوع طبالي الشاحنات',
      ),
      DetailsSubListItem(
        title: 'استعراض سجلات الفحص بالاشعه للسيارات',
      ),
    ],
    isExpanded: true,
  ),
  DetailsListItem(
    title: 'معاينه المركبات',
  ),
  DetailsListItem(
    title: 'الاصناف و الفواتير',
  ),
  DetailsListItem(
    title: 'النتيجه والتحويلات',
  ),
];
