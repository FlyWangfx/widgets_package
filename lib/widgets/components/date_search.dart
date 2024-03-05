import 'package:be_widgets/utils/other/sx_date.dart';
import 'package:be_widgets/widgets/be_datePicker.dart';
import 'package:be_widgets/widgets/button/be_button.dart';
import 'package:flutter/material.dart';

typedef SearchCallBack<T, V> = void Function(T, V);

class DateSearch extends StatefulWidget {
  final SearchCallBack<DateTime, DateTime> onSearch;

  const DateSearch({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  State<DateSearch> createState() => _DateSearchState();
}

class _DateSearchState extends State<DateSearch> {
  DateTime _sDate = DateTime.now();
  DateTime _eDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Text(
          '时间:',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              flex: 2,
              child: BEDatePicker(
                date: _sDate,
                onChangeDate: (DateTime date) async {
                  DateTime val = await SXDate.datePicker(context, date);
                  setState(() {
                    _sDate = val;
                  });
                },
              ),
            ),
            const Expanded(
              flex: 1,
              child: Center(
                child: Text('~'),
              ),
            ),
            Expanded(
              flex: 2,
              child: BEDatePicker(
                date: _eDate,
                onChangeDate: (DateTime date) async {
                  DateTime val = await SXDate.datePicker(context, date);
                  setState(() {
                    _eDate = val;
                  });
                },
              ),
            ),
          ],
        ),
        trailing: BEButton(
          height: 40,
          constraints: const BoxConstraints(minWidth: 60),
          borderRadius: BorderRadius.circular(10),
          text: '查询',
          onPressed: () => widget.onSearch(_sDate, _eDate),
        ));
  }
}
