



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namer_app/presentation/cubit/FavoriteCubiit.dart';

class FavoritePage extends StatelessWidget {


  @override
  Widget build(BuildContext context)
  {
    var favorites = context.watch<FavoriteCubit>().favoriteWords;
    if(favorites.isEmpty)
      {
        return Center(child: Text('No favorites yet.'));
      }
      else
        {
          return ListView.builder(
            itemCount: favorites.length +1,
              itemBuilder: (context, idx)
                  {
                    if(idx == 0)
                      {
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            'You have '
                                '${favorites.length} favorites:',
                          ),
                        );
                      }
                    else
                      {
                        return ListTile(
                          title: Text(favorites[idx -1].asLowerCase),
                          leading: Icon(Icons.favorite),
                        );
                      }
                  }

          );
        }

  }
}