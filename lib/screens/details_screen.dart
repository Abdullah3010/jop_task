import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:jop_task/constant/image_base64.dart';
import 'package:jop_task/widgets/custom_botton.dart';
import 'package:jop_task/widgets/custom_table.dart';
import 'package:jop_task/widgets/vehicle_dropdown.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: const [
              Text(
                'نوع البيان',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                'بيان إستيراد',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 69, 159),
                ),
              ),
              Spacer(),
              Text(
                'رقم البيان',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '123',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 69, 159),
                ),
              ),
              Spacer(),
              Text(
                'تاريخ البيان',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 10),
              Text(
                '12/12/2021',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 69, 159),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: const [
              Text(
                'حركه السيارات للبيان الجمركي',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 69, 159),
                ),
              ),
            ],
          ),
        ),
        CustomTable(
          headers: const [
            'رقم الحركه',
            'تاريخ الحركه',
            'رقم السياره',
            'اسم السائق',
            'dropOffLocation',
            'عرض الاشعه',
          ],
          rows: [
            [
              '2060330',
              '04-05-1441',
              '58117',
              'محمد شاهد اقبال محمد رمضان',
              VehicleDropDown(),
              TextButton(
                child: const Text(
                  'عرض الاشعه',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 69, 159),
                  ),
                ),
                onPressed: () {
                  showImage(base64Image1);
                },
              ),
            ],
            [
              '2060330',
              '04-05-1441',
              '58117',
              'محمد شاهد اقبال محمد رمضان',
              VehicleDropDown(),
              TextButton(
                child: const Text(
                  'عرض الاشعه',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 69, 159),
                  ),
                ),
                onPressed: () {
                  showImage(base64Image2);
                },
              ),
            ],
            [
              '2060330',
              '04-05-1441',
              '58117',
              'محمد شاهد اقبال محمد رمضان',
              VehicleDropDown(),
              TextButton(
                child: const Text(
                  'عرض الاشعه',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 69, 159),
                  ),
                ),
                onPressed: () {
                  showImage(base64Image2);
                },
              ),
            ],
          ],
        ),
        CustomBotton(
          title: 'ارسال',
          onTap: () {},
        )
      ],
    );
  }

  void showImage(String base64Image) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        const Base64Codec base64 = Base64Codec();
        Uint8List bytes = base64.decode(base64Image).buffer.asUint8List();
        return Container(
          padding: const EdgeInsets.all(50),
          child: Image.memory(
            bytes,
            fit: BoxFit.fitHeight,
          ),
        );
      },
    );
  }
}
