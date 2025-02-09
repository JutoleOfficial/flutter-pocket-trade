import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pocket_trade/core/theme/text_style_provider.dart';
import 'package:pocket_trade/presentation/base/base_scaffold.dart';

class CardSelectPage extends ConsumerWidget {
  const CardSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = ref.watch(textStyleProvider);

    return BaseScaffold(
      useSafeArea: true,
      body: Column(
        children: [
          Text(
            "안녕하세요",
            style: textStyle.style18Bold(),
          ),
        ],
      ),
    );
  }
}
