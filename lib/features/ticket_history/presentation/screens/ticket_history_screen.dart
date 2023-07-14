import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/header_widget.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeaderWidget(
          title: AppStrings.ticketsHistory,
        ),
      ],
    );
  }
}
