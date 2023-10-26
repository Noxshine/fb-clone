

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../widgets/ButtonWidget.dart';

class MenuPage extends StatelessWidget{
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {

    return  Column(
        children: [
          ButtonWidget(buttonText: 'Confirm', paddingTop: 10.0, textColor: WHITE,
          backgroundColor: CYAN,
          onPressed: (){}),
          ButtonWidget(buttonText: 'Confirm', paddingTop: 10.0, textColor: WHITE,
              backgroundColor: CYAN,
              onPressed: (){}),
          ButtonWidget(buttonText: 'Confirm', paddingTop: 10.0, textColor: WHITE,
              backgroundColor: CYAN,
              onPressed: (){}),
          ]
    );
  }
  
  
}


