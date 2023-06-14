import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/books_model/books_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewsetBooks()async{
    emit(NewsetBooksLoading());

    var result = await homeRepo.fetchNewsetBooks();

    result.fold((failure) => {

      emit(NewsetBooksFailure(failure.errMessage))

    }, (books) => {
      emit(NewsetBooksSuccess(books))
    });
  }
  
}
