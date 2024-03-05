import 'package:flutter/material.dart';

class BEBreadcrumb extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int>? onPressed;

  const BEBreadcrumb({
    super.key,
    required this.items,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              '/',
              style: TextStyle(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          bool isLast = index == items.length - 1;
          return TextButton(
            onPressed: () {
              onPressed?.call(index);
            },
            child: Text(
              items[index],
              style: TextStyle(
                fontSize: 14,
                color: isLast ? Colors.black : const Color(0xff4599e6),
              ),
            ),
          );
        },
      ),
    );
  }
}
