import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
const BottomNavBar({
super.key
  }) ;

  @override
  _BottomNavBar createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
    currentIndex: 0,
    
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.list),
            label: '',
            
            
          ),
          
        ],
    );
  }
}
