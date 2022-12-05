import 'package:castify/bloc/home_bloc.dart';
import 'package:castify/bloc/home_event.dart';
import 'package:castify/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.oragneColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 10,
              child: Image.asset('images/dots.png'),
            ),
            PageView.builder(
              controller: _pageController,
              itemBuilder: ((context, index) {
                return _getContentItems(context, index);
              }),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Image.asset('images/dots.png'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContentItems(BuildContext context, int index) {
    var subTitle = [
      'every-situation',
      'every-where',
      'every-moment',
    ];
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/castify-white.png'),
        const SizedBox(
          height: 16,
        ),
        Image.asset('images/${subTitle[index]}.png'),
        const SizedBox(
          height: 45,
        ),
        SizedBox(
          height: 349,
          width: 349,
          child: Image.asset('images/image$index.png'),
        ),
        const SizedBox(
          height: 45,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: const ScrollingDotsEffect(
            dotColor: AppColors.dotsColor,
            activeDotColor: AppColors.whiteColor,
            dotHeight: 10,
            dotWidth: 10,
          ),
        ),
        const SizedBox(
          height: 33,
        ),
        InkWell(
          onTap: () {
            // _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.ease);
            context.read<HomeBloc>().add(StartPressed());
          },
          child: Container(
            height: 48,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'شروع کنید',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 47,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: Image.asset('images/icon_arrow_circle_right.png'),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
