import 'package:flutter/material.dart';

class CustomTable extends StatelessWidget {
  final List<String> headers;
  final List<List<dynamic>> rows;

  const CustomTable({
    required this.headers,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    const columnWidth = {
      0: FlexColumnWidth(1.5),
      1: FlexColumnWidth(1.5),
      2: FlexColumnWidth(1.5),
      3: FlexColumnWidth(3),
      4: FlexColumnWidth(2.5),
      5: FlexColumnWidth(1.5),
    };
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          //header table
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: columnWidth,
            children: [
              TableRow(
                children: headers
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: columnWidth,
              children: rows
                  .map(
                    (e) => TableRow(
                      children: e
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: e.runtimeType != String
                                  ? e as Widget
                                  : Text(
                                      e,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 69, 159),
                                      ),
                                    ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
