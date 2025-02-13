import 'package:flutter/material.dart';
import 'package:pocket_trade/data/models/card_model.dart';

class CardDetailDialog extends StatelessWidget {
  final CardModel card;

  const CardDetailDialog({
    required this.card,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Dialog(
        child: Image.network(
          card.imageUrl,
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => this,
    );
  }
}
