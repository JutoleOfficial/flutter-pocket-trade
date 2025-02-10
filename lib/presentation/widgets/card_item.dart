import 'package:flutter/material.dart';
import 'package:pocket_trade/data/models/card_model.dart';

class CardItem extends StatelessWidget {
  final CardModel card;
  final void Function(CardModel card)? onTap;
  final void Function(CardModel card)? onLongPress;
  final void Function(CardModel card)? onDoubleTap;

  const CardItem({
    super.key,
    required this.card,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap != null ? () => onTap!(card) : null,
      onLongPress: onLongPress != null ? () => onLongPress!(card) : null,
      onDoubleTap: onDoubleTap != null ? () => onDoubleTap!(card) : null,
      child: Image.network(
        card.imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
