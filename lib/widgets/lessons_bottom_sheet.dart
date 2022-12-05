import 'package:castify/constants/app_colors.dart';
import 'package:castify/widgets/electronic_book_item.dart';
import 'package:flutter/material.dart';

class ShowLessonsBottomSheet extends StatelessWidget {
  const ShowLessonsBottomSheet({Key? key, this.controller}) : super(key: key);
  final ScrollController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
      decoration: const BoxDecoration(
        color: AppColors.lightGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.whiteColor,
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'فصل اول',
                        style: TextStyle(
                          color: AppColors.blackColor,
                          fontFamily: 'sb',
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'مشاهده بیشتر',
                        style: TextStyle(
                          color: AppColors.oragneColor,
                          fontFamily: 'sb',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(top: 32),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    return const ElectronicBook();
                  }),
                  childCount: 6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
