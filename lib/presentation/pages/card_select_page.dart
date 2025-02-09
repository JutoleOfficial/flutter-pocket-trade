import 'package:flutter/material.dart';
import 'package:pocket_trade/core/theme/app_text_styles.dart';
import 'package:pocket_trade/core/theme/text_style_provider.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';
import 'package:pocket_trade/presentation/base/base_scaffold.dart';
import 'package:pocket_trade/presentation/providers/card_provider.dart';
import 'package:pocket_trade/presentation/viewmodels/card_select_viewmodel.dart';

class CardSelectPage extends StatelessWidget {
  const CardSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useSafeArea: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Text(
              "선택된 포켓몬",
              style: AppTextStyle.style18Bold,
            ),
            const SizedBox(height: 8),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.715,
                crossAxisSpacing: 8,
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.network(src);
              },
            ),
          ],
        ),
      ),
    );
  }
}
