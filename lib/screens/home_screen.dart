import 'package:castify/constants/app_colors.dart';
import 'package:castify/entities/custom_entities.dart';
import 'package:castify/screens/single_podcast_screen.dart';
import 'package:castify/widgets/podcast_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightGreyColor,
        elevation: 0,
        leading: Image.asset('images/icon-notification.png'),
        title: Image.asset('images/castify.png'),
        centerTitle: true,
        actions: [
          Image.asset('images/icon-search.png'),
        ],
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: _getScrollContent(),
        ),
      ),
    );
  }

  Widget _getScrollContent() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(right: 24),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      child: _getCategoryContainer(index),
                    )),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: 2,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'images/frame_$index.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 22),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'دسته بندی',
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
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(right: 24),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemBuilder: ((context, index) {
                  return _getPodcastsCategory(index);
                }),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 31, bottom: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'پرطرفدارهای هفته',
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
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 279,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: ((context, index) {
                return getPostItem(index, context);
              }),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'پادکست های روزانه',
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: 'sb',
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            ((context, index) {
              return PodcastItem(
                index: index,
              );
            }),
            childCount: 3,
          ),
        )
      ],
    );
  }

  Widget getPostItem(int index, BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: ((context) {
            return SinglePodcastScreen(
              index: index,
            );
          }),
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          //Expanded(child: Container()),
          Container(
            margin: const EdgeInsets.only(right: 24, left: 20, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            height: 279,
            width: 279,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
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
          Positioned(
            right: 36,
            top: 16,
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
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 36,
            top: 16,
            child: Image.asset(
              'images/icon-heart-red.png',
            ),
          ),
          Positioned(
            left: 30,
            bottom: 26,
            child: Image.asset(
              'images/play.png',
            ),
          )
        ],
      ),
    );
  }

  Widget _getPodcastsCategory(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.oragneColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.whiteColor,
                width: 4,
              ),
            ),
            child: Center(
              child: Image.asset(
                'images/${getPodcastCategoryIcon()[index]}.png',
                width: 20,
                height: 20,
              ),
            ),
          ),
          Text(
            getPodcastCategoryList()[index],
            style: const TextStyle(
              color: AppColors.blackColor,
              fontFamily: 'sb',
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget _getCategoryContainer(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 14, bottom: 20),
      height: 46,
      width: 96,
      decoration: BoxDecoration(
        color: _selectedCategoryIndex == index
            ? AppColors.oragneColor
            : AppColors.lightGreyColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Center(
        child: Text(
          getCategoryList()[index],
          style: TextStyle(
            color: _selectedCategoryIndex == index
                ? AppColors.whiteColor
                : AppColors.darkGreyColor,
            fontFamily: 'sb',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
