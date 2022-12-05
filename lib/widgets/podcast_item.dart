import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:castify/constants/app_colors.dart';
import 'package:flutter/material.dart';

class PodcastItem extends StatelessWidget {
  const PodcastItem({Key? key, this.index}) : super(key: key);
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
      height: 73,
      width: 380,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.darkGreyColor,
            blurRadius: 15,
            spreadRadius: -12,
            offset: Offset(0.0, 16),
          )
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 7, bottom: 7, right: 6, left: 14),
            child: Image.asset(
              'images/asset$index.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'پرونده',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: 'sb',
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'اثر: مارتین یانوزای',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: 'sb',
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: 120,
            child: ProgressBar(
              total: const Duration(minutes: 1, seconds: 30),
              progress: const Duration(minutes: 0, seconds: 60),
              progressBarColor: AppColors.oragneColor,
              baseBarColor: AppColors.darkGreyColor.withOpacity(0.24),
              bufferedBarColor: AppColors.lightGreyColor.withOpacity(0.24),
              thumbColor: AppColors.oragneColor,
              thumbGlowColor: AppColors.lightGreyColor.withOpacity(0.24),
              barHeight: 3.0,
              thumbRadius: 5.0,
              timeLabelPadding: 2,
              timeLabelTextStyle: const TextStyle(
                color: AppColors.darkGreyColor,
                fontSize: 12,
                fontFamily: 'sb',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Image.asset(
              'images/play.png',
            ),
          )
        ],
      ),
    );
  }
}
