import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'feature_books_state.dart';

class FeatureBooksCubit extends Cubit<FeatureBooksState> {
  FeatureBooksCubit(this.homeRepo) : super(FeatureBooksInitial());
  
  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks()async{
    emit(FeatureBooksLoading());

    var result = await homeRepo.fetchFeaturedBooks();

    result.fold((failure) => {

      emit(FeatureBooksFailure(failure.errMessage))

    }, (books) => {
      emit(FeatureBooksSuccess(books))
    });
  }
}
