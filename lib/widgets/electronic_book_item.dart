import 'package:castify/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ElectronicBook extends StatelessWidget {
  const ElectronicBook({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
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
              'images/asset7.png',
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'قسمت 1',
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
                'رویای کارآموزی',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: 'sb',
                  fontSize: 10,
                ),
              ),
            ],
          ),
          const Spacer(),
          const Text(
            '16 صفحه',
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontFamily: 'sb',
              fontSize: 12,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.oragneColor,
            ),
            child: Center(
              child: Image.asset(
                'images/book.png',
              ),
            ),
          )
        ],
      ),
    );
  }
}
