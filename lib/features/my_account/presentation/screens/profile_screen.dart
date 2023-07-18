import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';

import '../../../../core/widgets/header_widget.dart';
import '../widgets/profile_nav_widget.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderWidget(
          title: AppStrings.myAccount,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SinginOrMyProfile(),
                const ProfileNavWidget(
                  title: AppStrings.msettings,
                  icon: Icons.settings,
                ),
                const ProfileNavWidget(
                  title: AppStrings.freeTrips,
                  icon: Icons.shopping_bag,
                ),
                const ProfileNavWidget(
                  title: AppStrings.wallet,
                  icon: Icons.account_balance_wallet,
                ),
                const ProfileNavWidget(
                  title: AppStrings.smartSubscription,
                  icon: Icons.credit_card,
                ),
                const ProfileNavWidget(
                  title: AppStrings.aboutUs,
                  icon: Icons.help,
                ),
                const ProfileNavWidget(
                  title: AppStrings.usageAgreement,
                  icon: Icons.edit_document,
                ),
                const ProfileNavWidget(
                  title: AppStrings.callUs,
                  icon: Icons.error,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is Authenticated) {
                      if (state.isSignIn == true) {
                        return ProfileNavWidget(
                          title: AppStrings.logOut,
                          icon: Icons.logout,
                          onTap: () {
                            BlocProvider.of<AuthCubit>(context).loggedOut();
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class SinginOrMyProfile extends StatelessWidget {
  const SinginOrMyProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          return ProfileNavWidget(
              title: state.isSignIn!
                  ? AppStrings.personalInformation
                  : AppStrings.login,
              icon: Icons.person,
              onTap: () {
                if (state.isSignIn == false) {
                  Navigator.pushNamed(context, Routes.loginRoute);
                } else {}
              });
        } else {
          return ProfileNavWidget(
              title: AppStrings.login,
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              });
        }
      },
    );
  }
}
