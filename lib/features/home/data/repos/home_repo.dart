import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

 Future<Either<Failure,List<BooksModel>>> fetchNewsetBooks();
 Future<Either<Failure,List<BooksModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BooksModel>>> fetchSimilarBooks({required String category});


}