import 'package:flutter/material.dart';

import '../widget/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
   TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

@override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Meal Categories'},
    {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
  ];
    super.initState();
  }


  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      
      ),
      drawer: MainDrawer(),
      //The first Element is the First Tab, The second Element is the Second Tab and so on...
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedPageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              title: Text('Favorites'),
            ),
          ]),
    );
  }
}

//This is another method for showing tabs

//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//             title: Text('Meals'),
//             bottom: TabBar(
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.category),
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   icon: Icon(Icons.favorite, ),
//                   text: 'Favorites',
//                 )
//               ],
//             )
//             ),
//             //The first Element is the First Tab, The second Element is the Second Tab and so on...
//             body: TabBarView(children: <Widget>[
//               CategoriesScreen(),
//               FavoritesScreen(),
//             ],),
//       ),
//     );
//   }
// }
