import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/quote_provider.dart';
import '../models/quote.dart';
import '../widgets/scale_button.dart';
import '../widgets/animated_heart_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<QuoteProvider>(
        builder: (context, provider, child) {
          final quote = provider.currentQuote;
          
          if (provider.isLoading && quote == null) {
             return const Center(child: CircularProgressIndicator(color: Colors.black12));
          }
          
           if (quote == null && !provider.isLoading) {
             return Center(child: TextButton(onPressed: provider.fetchNewQuote, child: const Text("Retry")));
           }

          final isFavorite = provider.favorites.any((q) => q.text == quote!.text);

          return Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'T   O   D   A   Y',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Stack(
                        children: [
                          Positioned(
                            top: -20,
                            left: -20,
                            child: userValuesQuoteMark(),
                          ),
                          Text(
                            '"${quote?.text}"',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1A1A1A),
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        width: 40,
                        height: 2,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(2)
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        quote?.author.toUpperCase() ?? '',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.5,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 140, 
                right: 30,
                child: ScaleButton(
                  onPressed: provider.fetchNewQuote,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ]
                    ),
                    child: const Icon(Icons.refresh, color: Colors.black87),
                  ),
                ),
              ),
              Positioned(
                bottom: 140,
                left: 30,
                 child: AnimatedHeartButton(
                   isFavorite: isFavorite,
                   onPressed: () => provider.toggleFavorite(quote!),
                 ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget userValuesQuoteMark() {
    return Opacity(
      opacity: 0.1,
      child: Text(
        '"',
        style: GoogleFonts.playfairDisplay(
          fontSize: 200,
          height: 1,
          color: const Color(0xFFE0C080),
        ),
      ),
    );
  }
}
