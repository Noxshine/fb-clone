
import 'dart:io';

import 'package:anti_fb/widgets/TextWidget.dart';
import 'package:anti_fb/widgets/icon/IconMessageWidget.dart';
import 'package:anti_fb/widgets/icon/IconSearchWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants.dart';
import '../../../widgets/profile_avatar.dart';
import 'appbar.dart';
import 'createpostbar.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key, required this.coin, required this.email});

  String coin ;
  String email;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: HomeAppBarTitle(coin),
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
            backgroundColor: WHITE,
            title: const CreatePostButton(),
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: const Icon(Icons.image, color: GREEN),
              )
            ]
            // snap: true,
          ),

          SliverList( delegate: SliverChildListDelegate( [const ListPostWidget()])),
        ]
    );
  }
}



// List of posts
class ListPostWidget extends StatefulWidget {

  const ListPostWidget({super.key});

  @override
  State<ListPostWidget> createState() => _ListPostWidgetState();
}

class _ListPostWidgetState extends State<ListPostWidget> {
  late List<Widget> listPosts = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      listPosts.add(const PostWidget('abc@123.com','10h37', 'ssssssssssiiiiiiiiiiiiiiiiiiiiiiiiiiuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu'
          'uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu',[]));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GREY,
      child: Column( children: listPosts,)
    );
  }
}

// post
class PostWidget extends StatefulWidget {
  final String useremail;
  final String timestamp;
  final String content;
  final List<XFile> images;

  const PostWidget(this.useremail, this.timestamp, this.content, this.images, {super.key});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget>{
  late String useremail;
  late String timestamp;
  late String content;
  late List<XFile> images;

  late String imageUrl;

  late double height;
  late bool kudosChoose;
  late bool disChoose;
  @override
  void initState() {
    super.initState();
    timestamp = widget.timestamp;
    useremail = widget.useremail;
    content = widget.content;
    images = widget.images;

    imageUrl = 'assets/images/messi-world-cup.png';

    height = 30;
    kudosChoose = false;
    disChoose = false;
  }
  @override
  Widget build(BuildContext context) {
    return Container (
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          padding: const EdgeInsets.all(5),
          color: WHITE,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.only(left:15),
                  child: Row(
                    children: [
                      const ProfileAvatar(imageUrl: 'assets/images/messi-world-cup.png'),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              useremail,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                Text( timestamp, style: TextStyle(color: GREY[600],  fontSize: 12.0,),),
                                Icon( Icons.public, color: GREY[600], size: 12.0, )
                              ],
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: (){},
                      )
                    ],
                  ),
                ),
                ReadMoreText(
                  content,
                  trimLines: 2,
                  colorClickableText: Colors.grey,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: '   Show more',
                  trimExpandedText: '',
                  moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color:Colors.grey),
                ),
                imageUrl != null ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: imageUrl),
                ) :const SizedBox.shrink(),

                // Container(
                //   height : 100,
                //   padding: const EdgeInsets.only(top: 5),
                //   child: ImageDisplay(images: images,),
                // ),

                Container(
                  height: 30,
                  padding: const EdgeInsets.only(left: 10),
                  child: const Row(
                    children: [
                      Row (
                        children: [
                          Icon( Icons.sentiment_satisfied_alt, color: CYAN ,),
                          TextWidget(text: '10', textColor: GREY ,fontSize: 10, paddingLeft: 5, width: 30,)
                        ],
                      ),
                      Row (
                        children: [
                          Icon( Icons.sentiment_dissatisfied_sharp, color: CYAN ,),
                          TextWidget(text: '10', textColor: GREY ,fontSize: 10, paddingLeft: 5, width: 30,)
                        ],
                      )
                    ]
                  )
                ),
                const Divider( thickness: 0.1, color: GREY, ),
                SizedBox(
                  height : 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        child : GestureDetector(
                          onTap: (){ setState(() {
                            if(!disChoose){ kudosChoose = !kudosChoose;}
                          });},
                          child: Row (
                            children: [
                              Icon( Icons.sentiment_satisfied_alt, color: kudosChoose ? CYAN : GREY ,),
                              TextWidget(text: 'Kudos', textColor: kudosChoose ? CYAN : GREY,fontSize: 12, paddingLeft: 5, width: 50,)
                            ],
                          ),
                        )
                      ),
                      GestureDetector(
                        onTap: (){ setState(() {
                          if(!kudosChoose){ disChoose = !disChoose;}
                        });},
                        child: Row (
                          children: [
                            Icon( Icons.sentiment_dissatisfied_sharp, color: disChoose ? CYAN : GREY ,),
                            TextWidget(text: 'Dissapoint', textColor: disChoose ? CYAN : GREY,fontSize: 12, paddingLeft: 5, width: 70,)
                          ],
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 10),
                          child : GestureDetector(
                            onTap: (){
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => PostScreen(),
                              //   ),
                              // );
                            },
                            child: const Row (
                              children: [
                                Icon( Icons.comment, color: GREY,),
                                TextWidget(text: 'Mark', textColor: GREY,fontSize: 12, paddingLeft: 5, width: 40,)
                              ],
                            ),
                          )
                      ),
                    ],
                  )
                )
              ],
            )
          )
        )
      );
  }

}

class ImageDisplay extends StatelessWidget{
  const ImageDisplay({super.key, required this.images});
  final List<XFile> images ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of images per row as needed
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.file(File(images[index].path));
            },
            // AssetImage('assets/images/messi-world-cup.png')
          ),
        ),
      ]
    );
  }

}





