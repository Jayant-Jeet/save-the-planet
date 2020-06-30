import 'package:save_the_planet/card_model.dart';

List<CardModel> getCards() {
  List<CardModel> cards = new List<CardModel>();
  CardModel card;

  card = new CardModel();

  card.setImagePath('assets/1.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/2.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/3.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/4.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/5.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/6.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/7.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();
  card.setImagePath('assets/8.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/9.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  card = new CardModel();

  card.setImagePath('assets/10.PNG');
  card.setIsClickable(false);
  card.setIsUncovered(true);

  cards.add(card);
  cards.add(card);

  cards.shuffle();

  return cards;
}