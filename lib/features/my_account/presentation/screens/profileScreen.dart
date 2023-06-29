import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/core/utils/app_strings.dart';

import '../../../../core/widgets/header_widget.dart';
import '../widgets/profileNavWidget.dart';

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
                ProfileNavWidget(
                    title: AppStrings.personalInformation,
                    icon: Icons.person,
                    onTap: () {
                      //Navigator.pushNamed(context, Routes.profilePageRoute),
                    }),
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
