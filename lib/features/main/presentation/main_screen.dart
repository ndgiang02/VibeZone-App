import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/configs/constants/icons.dart';
import 'package:vibezone/features/home/presentation/home_screen.dart';
import 'package:vibezone/features/main/presentation/widget/custom_bottombar.dart';
import 'package:vibezone/features/miniplayer/presentation/miniplayer_page.dart';
import 'package:vibezone/features/profile/presentation/profile_screen.dart';
import 'package:vibezone/features/search/presentation/search_page.dart';
import 'package:vibezone/features/trending/presentation/trending_screen.dart';

import 'bloc/main_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: context.read<MainBloc>().state.index,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      builder: (cts, state) {
        return Scaffold(
          extendBody: true,
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              HomeScreen(),
              TrendingScreen(),
              SearchScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const MiniPlayer(),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                  child: CustomBottomBar(
                    currentIndex: state.index,
                    onTap: (index) {
                      context.read<MainBloc>().add(
                        MainEvent.onChangePage(index),
                      );
                    },
                    items: [
                      SalomonBottomBarItem(
                        icon: icHome,
                        activeIcon: icSelectedHome,
                        title: Text(S.of(context).tab_home),
                      ),
                      SalomonBottomBarItem(
                        icon: icExplore,
                        activeIcon: icSelectedExplore,
                        title: Text(S.of(context).tab_trending),
                      ),
                      SalomonBottomBarItem(
                        icon: icSearch,
                        activeIcon: icSearch,
                        title: Text(S.of(context).tab_search),
                      ),
                      SalomonBottomBarItem(
                        icon: icProfile,
                        activeIcon: icSelectedProfile,
                        title: Text(S.of(context).tab_profile),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
      listenWhen: (previous, current) => previous.index != current.index,
      listener: (ctx, state) {
        FocusScope.of(ctx).unfocus();
        _pageController.animateToPage(
          state.index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
