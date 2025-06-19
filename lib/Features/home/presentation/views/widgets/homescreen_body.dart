import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/services_bloc.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/banner.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/home_header.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/home_text.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/promo_code.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/services_section.dart';
import 'package:nawel_application/Features/home/presentation/views/widgets/shortcut.dart';
import 'package:nawel_application/core/utils/app_sizes.dart';

class HomescreenBody extends StatelessWidget {
  const HomescreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          HomeHeader(),
          HomeText(text: 'Services', fontSize: 23),
          BlocBuilder<ServicesBloc, ServicesState>(
            builder: (context, state) {
              if (state is ServicesLoading) {
                return const CircularProgressIndicator();
              } else if (state is ServicesLoaded) {
                return ServicesSection(services: state.services);
              } else if (state is ServicesError) {
                return Text('Error: ${state.message}');
              } else {
                return const SizedBox.shrink();
              }
            },
          ),

          PromoCodeCard(),
          HomeText(text: 'Shortcuts :', fontSize: 23),
          const ShortcutSection(),
          const BannerCarousel(),
        ],
      ),
    );
  }
}
