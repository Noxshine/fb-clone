// create post bar
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CreatePostButton extends StatelessWidget{
  const CreatePostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 25, height: 25,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/images/messi-world-cup.png'), // Specify the asset path
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(5),
            child:  ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WHITE, // Set the background color to transparent
                elevation: 0,
                alignment: AlignmentDirectional.centerStart, // Align the button to the left side of the container
                padding: EdgeInsets.zero,
              ),
              onPressed: () { Navigator.pushNamed(context, '/post');},
              child: const Text( "What's on your mind?", style: TextStyle( color: BLACK,  fontSize: 14,),),
            ),
          ),
        ),

      ],
    );
  }

}