import 'package:castify/constants/app_colors.dart';
import 'package:castify/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: 3,
        selectedItemColor: AppColors.oragneColor,
        selectedLabelStyle: const TextStyle(
          fontFamily: 'sb',
          fontSize: 10,
        ),
        unselectedItemColor: AppColors.darkGreyColor,
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'sb',
          fontSize: 10,
        ),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('images/icon-profile.png'), label: 'پروفایل'),
          BottomNavigationBarItem(
              icon: Image.asset('images/icon-headphone.png'),
              label: 'لیست پخش'),
          BottomNavigationBarItem(
              icon: Image.asset('images/icon-airdrop.png'), label: 'زنده'),
          BottomNavigationBarItem(
              icon: Image.asset('images/icon-home-red.png'), label: 'خانه')
        ],
      ),
      body: const HomeScreen(),
    );
  }
}
