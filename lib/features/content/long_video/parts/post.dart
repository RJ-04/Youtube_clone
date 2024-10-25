import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.tLotgCDtzgTdwJcTiXWRCwHaEK%26pid%3DApi&f=1&ipt=f8cbf36a65a1cdc3ac862fa00dfdea55f0fc9f310d520ff153692c4851b0ccd1&ipo=images',
          ),

          //--------------------------------------------------------------------
        ],
      ),
    );
  }
}
