import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/core/widgets/page_back_widget.dart';
import 'package:suberjet_clean_architecture/features/my_account/presentation/widgets/profile_nav_widget.dart';
import 'package:suberjet_clean_architecture/features/splash/presentation/cubit/locale_cubit.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PageBackHeaderWidget(
                pageTitle:
                    AppLocalizations.of(context)!.translate('settings')!),
            ProfileNavWidget(
              onTap: () {
                if (AppLocalizations.of(context)!.isEnLocale) {
                  BlocProvider.of<LocaleCubit>(context).toArabic();
                } else {
                  BlocProvider.of<LocaleCubit>(context).toEnglish();
                }
              },
              title: AppLocalizations.of(context)!.translate('language')!,
              icon: Icons.translate,
              iconNavigat: Icons.swap_horizontal_circle_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
