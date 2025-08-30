


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:english_words/english_words.dart';
import 'wordsStates.dart';

class WordsCubit extends Cubit<WordsStates> {
  WordsCubit() : super(InitState());

  static WordPair? word; // static → shared across all instances

  createNewWord() {
    emit(ProcessNewWord());
    word = WordPair.random();
    emit(NewWord(word));
  }

  isNeededToCreateNewWord() {
    if (word == null) {
      word = WordPair.random();
      emit(NewWord(word));
    } else {
      emit(NewWord(word));
    }
  }
}
