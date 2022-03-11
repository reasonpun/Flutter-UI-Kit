import 'package:flutter/material.dart';

import '../../../widgets/label_below_icon.dart';

class DashboardMenuRowTwo extends StatelessWidget {
  final firstLabel;
  final IconData firstIcon;
  final secondLabel;
  final IconData secondIcon;
  final thirdLabel;
  final IconData thirdIcon;

  const DashboardMenuRowTwo({
    Key? key,
    this.firstLabel,
    required this.firstIcon,
    this.secondLabel,
    required this.secondIcon,
    this.thirdLabel,
    required this.thirdIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox.fromSize(
            size: Size.square(deviceSize.width / 3.3),
            child: Card(
              color: Colors.grey.shade300,
              child: LabelBelowIcon(
                betweenHeight: 15.0,
                icon: firstIcon,
                label: firstLabel,
                iconColor: Colors.indigo.shade800,
                isCircleEnabled: false,
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size.square(deviceSize.width / 3.3),
            child: Card(
              color: Colors.grey.shade300,
              child: LabelBelowIcon(
                betweenHeight: 15.0,
                icon: secondIcon,
                label: secondLabel,
                iconColor: Colors.indigo.shade800,
                isCircleEnabled: false,
              ),
            ),
          ),
          SizedBox.fromSize(
            size: Size.square(deviceSize.width / 3.3),
            child: Card(
              color: Colors.grey.shade300,
              child: LabelBelowIcon(
                betweenHeight: 15.0,
                icon: thirdIcon,
                label: thirdLabel,
                iconColor: Colors.indigo.shade800,
                isCircleEnabled: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
