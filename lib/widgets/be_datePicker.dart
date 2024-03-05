import 'package:be_widgets/utils/extension/date_time_extension.dart';
import 'package:flutter/material.dart';

class BEDatePicker extends StatelessWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChangeDate;

  const BEDatePicker({
    Key? key,
    required this.date,
    required this.onChangeDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        date.toFormatDateString(),
        style: const TextStyle(fontSize: 13),
      ),
      trailing: const Icon(
        Icons.arrow_drop_down,
        size: 30,
      ),
      onTap: () => onChangeDate(date),
    );
  }
}
