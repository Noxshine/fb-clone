
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
import 'listpost.dart';

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
            centerTitle: false,
            backgroundColor: WHITE,
            floating: true,
            actions: const [
              Align(
                  alignment: Alignment.centerRight,
                  child: Row( children: [ IconSearchWidget(), IconMessageWidget() ],)
              ),
            ],
          ),

          const SliverToBoxAdapter( child: CreatePostButton()),

          SliverList( delegate: SliverChildListDelegate( [const ListPostWidget()])),

        ]
    );
  }
}








