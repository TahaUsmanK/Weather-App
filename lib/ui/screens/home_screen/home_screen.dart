import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_nav_bar/bottom_navigator_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/floating_action_button/floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset(
            'assets/big/background.png',
            fit: BoxFit.cover,
          ),
          
              
          Positioned(
            top: 110,
            bottom: 0,
            child: Image.asset(
              'assets/big/house.png',
              width: 390,
              height: 390,
            ),
          ),
          DraggebleBottomSheet(),
          
        ],
      ),
      floatingActionButton: FAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomNavBar(
        
      ),
    );
  }
}
