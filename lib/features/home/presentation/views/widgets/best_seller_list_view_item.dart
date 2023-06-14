// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors

import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly_app/constants.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({
    Key? key,
    required this.booksModel,
  }) : super(key: key);
  final BooksModel booksModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/BookDetailsView',extra: booksModel,);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomBookImage(imgUrl:booksModel.volumeInfo.imageLinks.thumbnail ),
            // AspectRatio(
            //   aspectRatio: 2.5 / 4, //   width/height
            //   child: Container(
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(7),
            //       color: Colors.red,
            //       image: const DecorationImage(
            //           image: AssetImage(AssetsData.tesImage), fit: BoxFit.fill),
            //     ),
            //   ),
            // ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child: Text(
                        booksModel.volumeInfo.title!,
                        style: Styles.textStyle20
                            .copyWith(fontFamily: kGtSectraFine),
                        maxLines: 2,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text(booksModel.volumeInfo.authors![0], style: Styles.textStyle14),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text("Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold)),
                      Spacer(),
                      BookingRate(
                        rating:booksModel.volumeInfo.averageRating??0,
                        count: booksModel.volumeInfo.ratingsCount??0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
