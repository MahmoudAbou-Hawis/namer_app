import 'package:flutter/material.dart';
import 'package:namer_app/presentation/pages/FavoritePage.dart';
import 'package:namer_app/presentation/pages/generatorPage.dart';


class HomePage extends StatefulWidget {
  int selected = 0;
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget page = (widget.selected > 0) ? FavoritePage() : GeneratorPage();
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
          body: Row(
            children: [
              NavigationRail(
                extended: constrains.maxWidth > 900,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text("Favorite"),
                  ),
                ],
                selectedIndex: widget.selected,
                onDestinationSelected: (idx) {
                  setState(() {
                    widget.selected = idx;
                  });
                },
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: page,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
