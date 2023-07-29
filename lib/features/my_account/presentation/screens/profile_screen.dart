import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:suberjet_clean_architecture/features/auth/presentation/cubit/user_data_cubit/user_data_cubit.dart';
import 'package:suberjet_clean_architecture/features/ticket_history/presentation/cubit/tickethistory_cubit.dart';

import '../../../../core/widgets/header_widget.dart';
import '../widgets/profile_nav_widget.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: AppLocalizations.of(context)!.translate('myAccount')!,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SinginOrMyProfile(),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!.translate('settings')!,
                  icon: Icons.settings,
                  onTap: () =>
                      Navigator.pushNamed(context, Routes.settingRoute),
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!.translate('freeTrips')!,
                  icon: Icons.shopping_bag,
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!.translate('wallet')!,
                  icon: Icons.account_balance_wallet,
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!
                      .translate('smartSubscription')!,
                  icon: Icons.credit_card,
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!.translate('aboutUs')!,
                  icon: Icons.help,
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!
                      .translate('usageAgreement')!,
                  icon: Icons.edit_document,
                ),
                ProfileNavWidget(
                  title: AppLocalizations.of(context)!.translate('callUs')!,
                  icon: Icons.error,
                ),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is Authenticated) {
                      if (state.isSignIn == true) {
                        return ProfileNavWidget(
                          title: AppLocalizations.of(context)!
                              .translate('logOut')!,
                          icon: Icons.logout,
                          onTap: () {
                            BlocProvider.of<AuthCubit>(context)
                                .loggedOut(context);
                            BlocProvider.of<UserDataCubit>(context)
                                .removeUserDataWithLogout();
                            BlocProvider.of<TickethistoryCubit>(context)
                                .emitInitial();
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
                  ? AppLocalizations.of(context)!
                      .translate('personalInformation')!
                  : AppLocalizations.of(context)!.translate('login')!,
              icon: Icons.person,
              onTap: () {
                if (state.isSignIn == false) {
                  Navigator.pushNamed(context, Routes.loginRoute);
                } else {
                  Navigator.pushNamed(context, Routes.personalInformationRoute);
                }
              });
        } else {
          return ProfileNavWidget(
              title: AppLocalizations.of(context)!.translate('login')!,
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, Routes.loginRoute);
              });
        }
      },
    );
  }
}
