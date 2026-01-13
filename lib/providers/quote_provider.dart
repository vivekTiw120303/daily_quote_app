import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';
import '../services/quote_service.dart';

class QuoteProvider with ChangeNotifier {
  final QuoteService _quoteService = QuoteService();
  Quote? _currentQuote;
  List<Quote> _favorites = [];
  bool _isLoading = false;

  Quote? get currentQuote => _currentQuote;
  List<Quote> get favorites => _favorites;
  bool get isLoading => _isLoading;

  QuoteProvider() {
    _loadFavorites();
    fetchNewQuote();
  }

  Future<void> fetchNewQuote() async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentQuote = await _quoteService.fetchRandomQuote();
    } catch (e) {
      debugPrint('Error fetching quote: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(Quote quote) {
    if (_isFavorite(quote)) {
      _favorites.removeWhere((q) => q.text == quote.text);
    } else {
      _favorites.add(quote);
    }
    _saveFavorites();
    notifyListeners();
  }

  bool _isFavorite(Quote quote) {
    return _favorites.any((q) => q.text == quote.text);
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String? favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final List<dynamic> decoded = jsonDecode(favoritesJson);
      _favorites = decoded.map((json) => Quote.fromJson(json)).toList();
      notifyListeners();
    }
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final String encoded = jsonEncode(_favorites.map((q) => q.toJson()).toList());
    await prefs.setString('favorites', encoded);
  }
}
