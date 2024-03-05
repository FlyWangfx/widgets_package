import 'package:flutter/material.dart';

class TableRowModel {
  List<String>? id;
  String value;

  TableRowModel({
    this.id,
    required this.value,
  });
}

class BETable extends StatelessWidget {
  final List<String> heads;
  final List<List<TableRowModel>> rows;
  final Map<int, TableColumnWidth>? columnWidths;
  final Map<int, TextAlign>? rowColumnTextAligns;

  const BETable({
    super.key,
    required this.heads,
    required this.rows,
    this.columnWidths,
    this.rowColumnTextAligns,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Table(
        border: TableBorder.all(),
        defaultColumnWidth: const IntrinsicColumnWidth(),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: columnWidths,
        children: <TableRow>[
          TableRow(
            children: [
              for (String head in heads)
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      head,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          for (List<TableRowModel> row in rows)
            TableRow(
              children: [
                for (int index = 0; index < row.length; index++)
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        row[index].value,
                        textAlign: (rowColumnTextAligns != null && rowColumnTextAligns!.containsKey(index))
                            ? rowColumnTextAligns![index]
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
