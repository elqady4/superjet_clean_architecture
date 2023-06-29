import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:suberjet_clean_architecture/config/routes/routes.dart';

import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/style_constant.dart';
import 'features/home/presentation/screens/home_screen.dart';
/*
import 'features/profile/presentation/screens/profileScreen.dart';
import 'features/tickets_history/presentation/screens/tickets_history_screen.dart';*/

class SuperJetApp extends StatefulWidget {
  const SuperJetApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SuperJetAppState createState() => _SuperJetAppState();
}

class _SuperJetAppState extends State<SuperJetApp> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.indigo,
        ),
      ),
      home: SafeArea(
        child: Scaffold(
          body: selectPage(_selectedIndex),
          bottomNavigationBar: MoltenBottomNavigationBar(
            selectedIndex: _selectedIndex,
            domeHeight: 25,
            onTabChange: (clickedIndex) {
              setState(() {
                _selectedIndex = clickedIndex;
              });
            },
            tabs: [
              moltenTabWidget(AppStrings.myAccount, Icons.person),
              moltenTabWidget(AppStrings.mainPage, Icons.search),
              moltenTabWidget(AppStrings.tickets, Icons.list_alt),
            ],
            barColor: AppColors.barColor,
          ),
        ),
      ),
    );
  }

  MoltenTab moltenTabWidget(String tabName, IconData icon) {
    return MoltenTab(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          tabName,
          style: StyleConst.title3.copyWith(color: Colors.white),
        ),
      ),
      icon: Icon(
        icon,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  selectPage(int index) {
    switch (index) {
      case 0:
        {
          //return const ProfileScreen();
          return null;
        }

      case 1:
        {
          return const HomeScreen();
        }

      case 2:
        {
          //return const TicketsHistoryScreen();
          return null;
        }
      default:
        {
          // Navigator.pushNamed(context, HomeScreen.id);
        }
    }
  }
}
