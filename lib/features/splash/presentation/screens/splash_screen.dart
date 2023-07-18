import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/core/utils/app_assets_strings.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).appStarted();
    return Scaffold(
      body: Center(
        child: Image.asset(AppAssetsStrings.splashLogo),
      ),
    );
  }
}
