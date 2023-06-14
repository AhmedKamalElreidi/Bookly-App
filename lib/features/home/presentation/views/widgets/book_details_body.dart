import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rate.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_button_action.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody(
      {super.key, required this.booksModel, required this.books});
  final BooksModel booksModel;
  final BooksModel books;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false, //عشان الودجيت اللى بره بتعمل اسكرول مش شرط كلو
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                  child:  CustomBookImage(
                      imgUrl: books.volumeInfo.imageLinks.thumbnail),
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  books.volumeInfo.title!,
                  style:
                      Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  
                  books.volumeInfo.authors![0],
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                 BookingRate(
                  rating: books.volumeInfo.averageRating??0,
                  count: books.volumeInfo.ratingsCount??0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 35,
                ),
                 BooksButtonAction(booksModel: books,

                 ),
                const Expanded(
                  child: SizedBox(
                    height: 45,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
