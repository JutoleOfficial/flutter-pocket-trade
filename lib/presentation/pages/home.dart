import 'package:flutter/material.dart';
import 'package:pocket_trade/data/models/card_model.dart';
import 'package:pocket_trade/domain/services/card_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CardService cardService = CardService();
  CardModel? card;

  @override
  void initState() {
    super.initState();
    fetchCard();
  }

  Future<void> fetchCard() async {
    card = await cardService.getCard();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            Image.network(card?.image == null ? '' : "${card!.image}/low.webp"),
      ),
    );
  }
}
