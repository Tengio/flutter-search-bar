import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() {
  runApp(new SearchBarDemoApp());
}

class SearchBarDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Search Bar Demo', theme: new ThemeData(primarySwatch: Colors.blue), home: new SearchBarDemoHome());
  }
}

class SearchBarDemoHome extends StatefulWidget {
  @override
  _SearchBarDemoHomeState createState() => new _SearchBarDemoHomeState();
}

class _SearchBarDemoHomeState extends State<SearchBarDemoHome> {
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text('Search Bar Demo'),
      actions: [searchBar.getSearchAction(context)],
      bottom: buildBottom(context),
    );
  }

  void onSubmitted(String value) {
    setState(() => _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text('You wrote $value!'))));
  }

  _SearchBarDemoHomeState() {
    searchBar = new SearchBar(
      inBar: false,
      buildDefaultAppBar: buildAppBar,
      setState: setState,
      onSubmitted: onSubmitted,
      onSearchOpen: () => print("SearchOpen"),
      onSearchClose: () => print("SearchClose"),
      bottomBuilder: buildBottom,
    );
  }

  Widget buildBottom(BuildContext context) => new BottomExampleWidget();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: new Center(child: new Text("Don't look at me! Press the search button!")),
    );
  }
}

class BottomExampleWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) => new Container();

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
