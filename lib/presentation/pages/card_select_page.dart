import 'package:flutter/material.dart';
import 'package:pocket_trade/core/theme/app_text_styles.dart';
import 'package:pocket_trade/domain/services/card_service.dart';
import 'package:pocket_trade/presentation/base/base_scaffold.dart';
import 'package:pocket_trade/presentation/modals/card_detail_dialog.dart';
import 'package:pocket_trade/presentation/modals/card_search_bottom_sheet.dart';
import 'package:pocket_trade/presentation/providers/card_provider.dart';
import 'package:pocket_trade/presentation/viewmodels/card_select_viewmodel.dart';
import 'package:pocket_trade/presentation/widgets/card_item.dart';
import 'package:provider/provider.dart';

class CardSelectPage extends StatelessWidget {
  const CardSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardSelectViewModel(),
      builder: (context, child) {
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
                ChangeNotifierProvider.value(
                  value: context.read<CardSelectViewModel>().selectedCards,
                  builder: (context, child) {
                    final selectedCards = context
                        .select((CardProvider provider) => provider.cards);

                    if (selectedCards.isSuccess) {
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.715,
                          crossAxisSpacing: 8,
                        ),
                        itemCount: selectedCards.data!.length,
                        itemBuilder: (context, index) {
                          return CardItem(card: selectedCards.data![index]);
                        },
                      );
                    }
                    if (selectedCards.isError) {
                      return const Center(
                        child: Text("오류가 발생했습니다."),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  "검색한 포켓몬",
                  style: AppTextStyle.style18Bold,
                ),
                const SizedBox(height: 8),
                ChangeNotifierProvider.value(
                  value: context.read<CardSelectViewModel>().searchCards,
                  builder: (context, child) {
                    final searchCards = context
                        .select((CardProvider provider) => provider.cards);

                    if (searchCards.isSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.715,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 8,
                          ),
                          itemCount: searchCards.data!.length,
                          itemBuilder: (context, index) {
                            return CardItem(
                              card: searchCards.data![index],
                              onTap: (card) {
                                context
                                    .read<CardSelectViewModel>()
                                    .selectedCards
                                    .addCard(card);
                              },
                              onLongPress: (card) {
                                CardDetailDialog(card: card).show(context);
                              },
                            );
                          },
                        ),
                      );
                    }
                    if (searchCards.isError) {
                      return const Center(
                        child: Text("오류가 발생했습니다."),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              CardSearchBottomSheet(
                cardService: CardService(),
              ).show(context, onSearchComplete: (cards) {
                context.read<CardSelectViewModel>().searchCards.addCards(cards);
              });
            },
            child: Icon(Icons.search),
          ),
        );
      },
    );
  }
}
