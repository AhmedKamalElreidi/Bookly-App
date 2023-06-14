// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(16) ,
      child: AspectRatio(
        aspectRatio: 2.6 / 4, //   width/height
         child:CachedNetworkImage(

          fit: BoxFit.fill,
          imageUrl: imgUrl,
          errorWidget: (context, url, error) => const Icon(Icons.error),
         ),
        // Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(7),
        //     image:  DecorationImage(
        //         image: NetworkImage(imgUrl), fit: BoxFit.fill),
        //   ),
        // ),
      ),
    );
  }
}
