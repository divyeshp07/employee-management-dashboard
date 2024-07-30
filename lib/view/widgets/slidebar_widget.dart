import 'package:flutter/material.dart';

class SlideBarWidget extends StatelessWidget {
  final String item1;
  final String item2;
  final String item3;
  final Function() ontap1;
  final Function() ontap2;
  final Function() ontap3;

  const SlideBarWidget({
    super.key,
    required this.item1,
    required this.item2,
    required this.item3,
    required this.ontap1,
    required this.ontap2,
    required this.ontap3,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Sidebar',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ListTile(
          title: Text(item1),
          onTap: ontap1,
        ),
        ListTile(
          title: Text(item2),
          onTap: ontap2,
        ),
        ListTile(
          title: Text(item3),
          onTap: ontap3,
        ),
      ],
    );
  }
}
