import 'dart:ui';
import 'package:castify/constants/app_colors.dart';
import 'package:castify/widgets/electronic_book_item.dart';
import 'package:castify/widgets/lessons_bottom_sheet.dart';
import 'package:flutter/material.dart';

class SinglePodcastScreen extends StatelessWidget {
  const SinglePodcastScreen({super.key, this.index});
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: _getAppbar(context),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getImageContainer(),
                const SizedBox(
                  height: 32,
                ),
                _getProgressSection(),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(
                      'images/icon-timer.png',
                    ),
                    Image.asset(
                      'images/icon-forwards-10.png',
                    ),
                    Image.asset(
                      'images/play.png',
                    ),
                    Image.asset(
                      'images/icon-backwards-10.png',
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: ((context) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.6,
                            minChildSize: 0.3,
                            maxChildSize: 0.9,
                            builder: ((context, scrollController) {
                              return ShowLessonsBottomSheet(
                                controller: scrollController,
                              );
                            }),
                          );
                        }),
                      ),
                      child: Image.asset(
                        'images/icon-play-list.png',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    'کتاب الکترونیکی',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: 'sb',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const ElectronicBook(),
                const SizedBox(
                  height: 22,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24),
                  child: Text(
                    'توضیحات',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: 'sb',
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
                  child: Text(
                    'سعی کردم صفر تا صـد تجربـیـاتـم در این چند سـال فعالیتم رو با شمـا به اشتراک بذارم ، قطـعـا خـیـلی میتونه براتون مـفـید بـاشه پـس ریز به ریزشو با تمرکز و با دقت گوش کنید.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: AppColors.darkGreyColor,
                      fontFamily: 'sb',
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getProgressSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: 380,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.ease,
                  width: 120,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppColors.oragneColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -2,
                bottom: -2,
                left: 110,
                child: Image.asset(
                  'images/Indicator.png',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                '44:00',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontFamily: 'sb',
                  fontSize: 12,
                ),
              ),
              Text(
                '13:36',
                style: TextStyle(
                  color: AppColors.darkGreyColor,
                  fontFamily: 'sb',
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget getImageContainer() {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 460,
          color: AppColors.darkGreyColor,
          child: Image.asset(
            'images/post_$index.png',
            fit: BoxFit.cover,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 45),
            height: 279,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'images/post_$index.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          top: 32,
          child: Container(
            height: 26,
            width: 77,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/icon-token.png'),
                const Text(
                  'پرطرفدار',
                  style: TextStyle(
                    color: AppColors.oragneColor,
                    fontFamily: 'sb',
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Positioned(
          bottom: 30,
          child: Text(
            'رویای کارآموزی',
            style: TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'sb',
              fontSize: 24,
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Text(
            'اثر: امیر احمد ادیبی  قسمت: 1',
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontFamily: 'sb',
              fontSize: 16,
            ),
          ),
        )
      ],
    );
  }

  PreferredSizeWidget _getAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.lightGreyColor,
      elevation: 0,
      leadingWidth: 74,
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 16,
          ),
          Image.asset('images/icon-add.png'),
          const SizedBox(
            width: 8,
          ),
          Image.asset('images/icon-heart.png'),
        ],
      ),
      title: Image.asset('images/podcast.png'),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Image.asset('images/icon-arrow-right.png'),
        ),
      ],
    );
  }
}
