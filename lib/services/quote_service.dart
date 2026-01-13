import 'dart:math';
import '../models/quote.dart';

class QuoteService {
  // Keeping the API setup for potential future use or fallback
  // static const String _baseUrl = 'https://zenquotes.io/api/random';

  final List<Quote> _localQuotes = [
    Quote(text: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
    Quote(text: "Life is what happens when you're busy making other plans.", author: "John Lennon"),
    Quote(text: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
    Quote(text: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
    Quote(text: "In the end, it's not the years in your life that count. It's the life in your years.", author: "Abraham Lincoln"),
    Quote(text: "The purpose of our lives is to be happy.", author: "Dalai Lama"),
    Quote(text: "Get busy living or get busy dying.", author: "Stephen King"),
    Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
    Quote(text: "Many of life's failures are people who did not realize how close they were to success when they gave up.", author: "Thomas A. Edison"),
    Quote(text: "If you want to live a happy life, tie it to a goal, not to people or things.", author: "Albert Einstein"),
    Quote(text: "Never let the fear of striking out keep you from playing the game.", author: "Babe Ruth"),
    Quote(text: "Money and success don’t change people; they merely amplify what is already there.", author: "Will Smith"),
    Quote(text: "Your time is limited, so don’t waste it living someone else’s life.", author: "Steve Jobs"),
    Quote(text: "Not how long, but how well you have lived is the main thing.", author: "Seneca"),
    Quote(text: "If life were predictable it would cease to be life, and be without flavor.", author: "Eleanor Roosevelt"),
    Quote(text: "The whole secret of a successful life is to find out what is one’s destiny to do, and then do it.", author: "Henry Ford"),
    Quote(text: "In order to write about life first you must live it.", author: "Ernest Hemingway"),
    Quote(text: "The big lesson in life, baby, is never be scared of anyone or anything.", author: "Frank Sinatra"),
    Quote(text: "Sing like no one’s listening, love like you’ve never been hurt, dance like nobody’s watching, and live like it’s heaven on earth.", author: "Attributed to various sources"),
    Quote(text: "Curiosity about life in all of its aspects, I think, is still the secret of great creative people.", author: "Leo Burnett"),
    Quote(text: "Life is not a problem to be solved, but a reality to be experienced.", author: "Soren Kierkegaard"),
    Quote(text: "The unexamined life is not worth living.", author: "Socrates"),
    Quote(text: "Turn your wounds into wisdom.", author: "Oprah Winfrey"),
    Quote(text: "The way I see it, if you want the rainbow, you gotta put up with the rain.", author: "Dolly Parton"),
    Quote(text: "Do all the good you can, for all the people you can, in all the ways you can, as long as you can.", author: "Hillary Clinton"),
    Quote(text: "Don’t settle for what life gives you; make life better and build something.", author: "Ashton Kutcher"),
    Quote(text: "Everything negative – pressure, challenges – is all an opportunity for me to rise.", author: "Kobe Bryant"),
    Quote(text: "I like criticism. It makes you strong.", author: "LeBron James"),
    Quote(text: "You never really learn much from hearing yourself speak.", author: "George Clooney"),
    Quote(text: "Life imposes things on you that you can’t control, but you still have the choice of how you’re going to live through this.", author: "Celine Dion"),
    Quote(text: "Life is never easy. There is work to be done and obligations to be met – obligations to truth, to justice, and to liberty.", author: "John F. Kennedy"),
    Quote(text: "Live for each second without hesitation.", author: "Elton John"),
    Quote(text: "Life is like riding a bicycle. To keep your balance, you must keep moving.", author: "Albert Einstein"),
     Quote(text: "Simplicity is the ultimate sophistication.", author: "Leonardo da Vinci")
  ];

  Future<Quote> fetchRandomQuote() async {
    // Simulate a tiny delay for "feel" if needed, but keeping it instant for "Speed" request
    // await Future.delayed(const Duration(milliseconds: 100));
    
    final random = Random();
    return _localQuotes[random.nextInt(_localQuotes.length)];
  }
}
