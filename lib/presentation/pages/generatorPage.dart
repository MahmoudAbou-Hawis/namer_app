import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/presentation/cubit/FavoriteCubiit.dart';
import 'package:namer_app/presentation/cubit/FavoriteStates.dart';
import 'package:namer_app/presentation/cubit/wordsCubit.dart';
import 'package:namer_app/presentation/cubit/wordsStates.dart';
import 'package:namer_app/presentation/widgets/wordCard.dart';

class GeneratorPage extends StatelessWidget {

   const GeneratorPage({super.key});
  @override
  Widget build(BuildContext context) {
    late WordPair pair ;
    return BlocProvider<WordsCubit>(
      create: (context) => WordsCubit()..isNeededToCreateNewWord(),
      child: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<WordsCubit, WordsStates>(
                  builder: (context, state) {
                    if (state is NewWord) {
                      pair = state.current;
                      context.read<FavoriteCubit>().isMarkedAsFavorite(pair);
                      return WordCard(state.current);
                    }  else {
                      return Center(child: Text('No word available'));
                    }
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(onPressed: (){
                      context.read<FavoriteCubit>().toggleFavorite(pair);
                    },
                        child: Row(
                          children: [
                            BlocBuilder<FavoriteCubit,FavoriteSates>(
                                builder: (context,state){
                                  if(state is MarkAsFavorite)
                                    {
                                      return Icon(Icons.favorite);
                                    }
                                  else
                                    {
                                      return Icon(Icons.favorite_border);
                                    }
                            
                            }),
                            Text(" Like")
                          ],
                        )
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton(onPressed: (){
                      context.read<WordsCubit>().createNewWord();
                    }, child: Text("Next"))
                  ],
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
