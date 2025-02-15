import 'package:flutter/material.dart';
import 'package:pocket_trade/core/base/view_state.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';
import 'package:pocket_trade/presentation/viewmodels/card_search_bottom_sheet_viewmodel.dart';
import 'package:provider/provider.dart';

class CardSearchBottomSheet {
  final CardService cardService;

  CardSearchBottomSheet({required this.cardService});

  void show(
    BuildContext context, {
    required void Function(List<CardModel> cards) onSearchComplete,
  }) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) {
            return CardSearchBottomSheetViewModel(cardService: cardService);
          },
          builder: (context, child) {
            final rarities = CardRarity.all;

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 4,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.grey[400], // 선 색상
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration:
                              InputDecoration(hintText: '포켓몬 이름을 입력하세요'),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '레어도',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 2.3,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                          ),
                          itemBuilder: (context, index) {
                            return _buildRarityItem(
                              context,
                              rarity: rarities[index],
                            );
                          },
                          itemCount: rarities.length,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'EX',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'EX',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 166),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await context
                              .read<CardSearchBottomSheetViewModel>()
                              .searchCards();
                          if (!context.mounted) return;

                          final cards = context
                              .read<CardSearchBottomSheetViewModel>()
                              .cards;

                          if (cards.isSuccess) {
                            onSearchComplete(cards.data!);
                            Navigator.of(context).pop();
                          } else if (cards.isError) {}
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text('검색'),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Icon(Icons.close),
                          ),
                        ),
                      ),
                      SizedBox(height: bottomPadding),
                    ],
                  ),
                ),
                Selector<CardSearchBottomSheetViewModel,
                    BaseState<List<CardModel>>>(
                  selector: (context, viewModel) {
                    return viewModel.cards;
                  },
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return Positioned(
                        bottom: 0,
                        top: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      );
                    }

                    return SizedBox.shrink();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildRarityItem(
    BuildContext context, {
    required CardRarity rarity,
  }) {
    final viewModel = context.read<CardSearchBottomSheetViewModel>();

    final icon = rarity.isDiamond
        ? Icons.diamond
        : rarity.isStar
            ? Icons.star
            : Icons.music_note;

    return Selector<CardSearchBottomSheetViewModel, CardRarity?>(
      selector: (context, viewModel) {
        return viewModel.cardRarity;
      },
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            viewModel.cardRarity = rarity;
          },
          child: Container(
            decoration: BoxDecoration(
              color: value == rarity ? Colors.indigo : Colors.grey[400],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                rarity.count,
                (index) => Icon(
                  icon,
                  size: 16,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
