import 'package:flutter/material.dart';
import 'package:pocket_trade/domain/entities/card_entity.dart';

class CardItem extends StatelessWidget {
  final CardEntity card;
  final void Function(CardEntity card)? onTap;
  final void Function(CardEntity card)? onLongPress;
  final void Function(CardEntity card)? onDoubleTap;

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
