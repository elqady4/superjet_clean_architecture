import 'package:flutter/material.dart';
import 'package:suberjet_clean_architecture/config/locale/app_localizations.dart';

import '../../../../core/widgets/header_widget.dart';

class TicketHistoryScreen extends StatelessWidget {
  const TicketHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          title: AppLocalizations.of(context)!.translate('ticketsHistory')!,
        ),
      ],
    );
  }
}
