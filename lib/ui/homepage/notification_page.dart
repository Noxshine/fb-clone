import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/ButtonWidget.dart';
import '../../widgets/TextWidget.dart';


class NotificationPage extends StatelessWidget{
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
            children: [
              ButtonWidget(buttonText: 'Confirm', paddingTop: 10.0, textColor: WHITE,
                  backgroundColor: CYAN,
                  onPressed: (){}),
            ]
    );
  }



}