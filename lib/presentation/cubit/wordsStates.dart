

sealed class WordsStates {}



class InitState extends WordsStates {}

class NewWord extends WordsStates {
  final current ;
   NewWord(this.current);
}

class ProcessNewWord extends WordsStates {}