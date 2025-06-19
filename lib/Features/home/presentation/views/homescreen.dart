import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nawel_application/Features/home/data/datasources/service_uploader.dart';
import 'package:nawel_application/Features/home/domain/usecase/banner_usecase.dart';
import 'package:nawel_application/Features/home/domain/usecase/get_service_usecase.dart';

import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_bloc.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/baneer_event.dart';
import 'package:nawel_application/Features/home/presentation/controllers/bloc/services_bloc.dart';

import 'package:nawel_application/Features/home/presentation/views/widgets/homescreen_body.dart';
import 'package:nawel_application/core/di/injection.dart';
import 'package:nawel_application/core/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _uploadServicesOnce();
  }

  void _uploadServicesOnce() async {
    final uploader = SeedServicesUploader(FirebaseFirestore.instance);
    await uploader.upload();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create:
                (_) =>
                    ServicesBloc(sl<GetServicesUseCase>())
                      ..add(FetchServicesEvent()),
          ),
          BlocProvider(
            create:
                (_) =>
                    BannerBloc(sl<GetBannersUseCase>())
                      ..add(FetchBannersEvent()),
          ),
        ],
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: const HomescreenBody(),
        ),
      ),
    );
  }
}
