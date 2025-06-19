import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/main_layout_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/main_layout_event.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/main_layout_state.dart';
import 'package:nawel_application/Features/cart/presentation/views/cart_screen.dart';
import 'package:nawel_application/Features/categories/presentation/views/categories_screen.dart';
import 'package:nawel_application/Features/deliver/presentation/views/deliver_screen.dart';
import 'package:nawel_application/Features/home/presentation/views/homescreen.dart';
import 'package:nawel_application/Features/profile/presentation/views/profile_screen.dart';
import 'package:nawel_application/core/utils/assets.dart';

class MainLayout extends StatelessWidget {
  MainLayout({super.key});

  final List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    DeliverScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  final List<String> labels = [
    'Home',
    'categories',
    'deliver',
    'cart',
    'Profile',
  ];
  final List<String> icons = [
    AssetsData.logo,
    AssetsData.categories,
    AssetsData.deliver,
    AssetsData.cart,
    AssetsData.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeNavBloc(),
      child: BlocBuilder<HomeNavBloc, HomeNavState>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state.currentIndex,
                  onTap:
                      (index) => context.read<HomeNavBloc>().add(
                        ChangeTabEvent(index),
                      ),
                  showUnselectedLabels: true,
                  selectedItemColor: const Color(0xFF8900FE),
                  unselectedItemColor: Colors.black54,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  items: List.generate(5, (i) {
                    final isSelected = i == state.currentIndex;
                    return BottomNavigationBarItem(
                      icon: Column(
                        children: [
                          if (isSelected)
                            Container(
                              height: 7,
                              width: 50,
                              margin: const EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                color: const Color(0xFF8900FE),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                            ),
                          Image.asset(icons[i], height: 35),
                        ],
                      ),
                      label: labels[i],
                    );
                  }),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
