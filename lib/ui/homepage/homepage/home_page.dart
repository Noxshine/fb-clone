
import 'dart:io';

import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:anti_fb/widgets/icon/IconMessageWidget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../widgets/ElevatedButtonWidget.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key, required this.coin, required this.email});

  final String coin;
  final String email;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: HomeAppBarTitle(coin: coin,),
            backgroundColor: WHITE,
            floating: true,
            actions: const [
              Align(
                  alignment: Alignment.centerRight,
                  child: Row( children: [ IconSearchWidget(), IconMessageWidget() ],)
              ),
            ],
          ),

          SliverAppBar(
            backgroundColor: GREEN,
            title: const PostButton(),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.image),
              )
            ]
            // snap: true,
          ),

          SliverList( delegate: SliverChildListDelegate( [const HomePageContent()])),
        ]
    );
  }
}

class HomeAppBarTitle extends StatelessWidget {
  const HomeAppBarTitle({super.key, required this.coin});
  final String coin;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Text( 'Anti fb', style: TextStyle(color: CYAN, fontSize: 20, fontWeight: FontWeight.bold,),),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 10), //
            child: Container(
              // padding: const EdgeInsets.only(left: 100),
                width: 100,
                decoration: BoxDecoration(
                  color : GREY,
                  border: Border.all( color: TRANSPARENT,),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // child : TextWidget(text: 'Coin : $coin', fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
                child: TextWidget(text: "Coin : $coin", fontSize: 16, textColor: YELLOW,paddingLeft: 5,)
            )
        ),
      ]
    );
  }
}

class PostButton extends StatelessWidget{
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 20, height: 20,
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


// class ListPostWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//
//     return
//   }
// }

class PostWidget extends StatelessWidget {
  final String id;
  final String useremail;
  final String content;
  final List<XFile> images;

  const PostWidget(this.id, this.useremail, this.content, this.images, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              TextWidget(text: useremail, fontSize: 10, paddingLeft: 5, width: 20,),
              TextWidget(text: useremail, fontSize: 10, paddingLeft: 5,),
            ],
          ),
          TextWidget(text: content, fontSize: 12,),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: ImageDisplay(images: images,),
          )
        ],
      )
    );
  }

}

class ImageDisplay extends StatelessWidget{
  const ImageDisplay({super.key, required this.images});
  final List<XFile> images ;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Adjust the number of images per row as needed
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.file(File(images[index].path));
        },
        // AssetImage('assets/images/messi-world-cup.png')
      ),
    );
  }
}



class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
        ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),ElevatedButtonWidget(buttonText: 'I already have an account',
            paddingTop: 10.0,
            textColor: CYAN,
            backgroundColor: WHITE,
            onPressed: () {}),
      ],
    );
  }
}
