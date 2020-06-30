import 'package:save_the_planet/main.dart';

List<Card> getCards() {
  List<Card> cards = new List<Card>();
  Card card;

  card = new Card();
  card.setImagePath('assets/1.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/1.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/2.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/2.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/3.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/3.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/4.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/4.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/5.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/5.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/6.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/6.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/7.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/7.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/8.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/8.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/9.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/9.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/10.PNG');
  cards.add(card);

  card = new Card();
  card.setImagePath('assets/10.PNG');
  cards.add(card);

  cards.shuffle();

  return cards;
}
