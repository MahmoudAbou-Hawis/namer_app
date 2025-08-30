


import 'package:english_words/english_words.dart';

sealed class FavoriteSates{}

class MarkAsFavorite extends FavoriteSates {}

class UnMarkAsFavorite extends FavoriteSates {}

class InitState extends FavoriteSates {}

class LoadFavoritesDone extends FavoriteSates{
  final List<WordPair> pair;
  LoadFavoritesDone(this.pair);
}