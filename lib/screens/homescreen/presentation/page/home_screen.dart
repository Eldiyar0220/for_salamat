import 'package:dimplom/components/carousel_hero.dart';
import 'package:dimplom/components/category_card.dart';
import 'package:dimplom/components/logo.dart';
import 'package:dimplom/screens/homescreen/presentation/cubit/home_cubit.dart';
import 'package:dimplom/screens/homescreen/presentation/page/child_page/detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getDataCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Logo(),
      ),
      body: RefreshIndicator(
        onRefresh: context.read<HomeCubit>().getDataCubit,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CarouselHero(),
            const SizedBox(height: 8),
            const Text(
              'Explore Categories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const Row(
              children: [
                Text(
                  'Lesson',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Category',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                if (state is HomeLoading) {
                  EasyLoading.show();
                }
              },
              builder: (context, state) {
                if (state is HomeSuccess) {
                  EasyLoading.dismiss();
                  return Expanded(
                    child: ListView.separated(
                      itemCount: state.topics.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 10,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final topJopa = state.topics[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => DetailPage(topJopa),
                              ),
                            );
                          },
                          child: CategoryCard(
                            img:
                                'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20200114192751/How-to-Learn-Programming.png',
                            title: topJopa.title,
                            desc: topJopa.content,
                          ),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
