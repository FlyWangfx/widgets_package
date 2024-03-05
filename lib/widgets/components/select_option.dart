import 'package:flutter/material.dart';

class SelectOption extends StatelessWidget {
  final String title;
  final double? width;
  final int? selectIndex;
  final List<String> options;
  final ValueChanged<int?>? onChanged;

  const SelectOption({
    Key? key,
    required this.title,
    this.width = 150,
    this.selectIndex,
    required this.options,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xff323737);
    return SizedBox(
      width: width,
      child: Row(
        children: [
          Text(
            '$title：',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: DropdownButton<int>(
                padding: const EdgeInsets.only(left: 4),
                onChanged: onChanged,
                value: selectIndex,
                items: <DropdownMenuItem<int>>[
                  for (int index = 0; index < options.length; index++)
                    DropdownMenuItem(
                      value: index,
                      child: Text(
                        options[index],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                dropdownColor: bgColor,
                underline: Container(),
                isExpanded: true,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
