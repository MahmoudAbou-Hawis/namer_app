


import 'package:english_words/english_words.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'FavoriteStates.dart';

class FavoriteCubit extends Cubit<FavoriteSates>
{
  FavoriteCubit(): super(InitState());
  List<WordPair> favoriteWords =  [];

  void toggleFavorite(WordPair pair)
  {
    if(favoriteWords.any((test) => test==pair))
      {
        favoriteWords.remove(pair);
        emit(UnMarkAsFavorite());
      }
    else
      {
        favoriteWords.add(pair);
        emit(MarkAsFavorite());

      }
  }

  void isMarkedAsFavorite(WordPair pair)
  {
    if (favoriteWords.any((test) => test==pair))
      {
        emit(MarkAsFavorite());
      }
    else
      {
        emit(UnMarkAsFavorite());
      }
  }

  void getAllFavorites()
  {
    emit(LoadFavoritesDone(favoriteWords));
  }
}