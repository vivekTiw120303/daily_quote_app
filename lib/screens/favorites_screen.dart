import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import '../providers/quote_provider.dart';
import '../widgets/glass_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<QuoteProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favorites;

          if (favorites.isEmpty) {
            return Center(
              child: Text(
                'No favorites yet.',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  color: Colors.black54,
                ),
              ),
            );
          }

          return CustomScrollView(
            physics: const BouncingScrollPhysics(), // Bouncy scroll
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 20),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          'F   A   V   O   R   I   T   E   S',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            letterSpacing: 2,
                          ),
                        ),
                        const SizedBox(height: 10),
                         Container(
                          width: 40,
                          height: 1,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    final quote = favorites[index];
                    
                    // index-based delay for staggered entrance.
                    // 100ms * index might be too slow for long lists, capping at some point or using small multiplier.
                    final delay = Duration(milliseconds: 50 * index);
                    
                    return FutureBuilder(
                      future: Future.delayed(delay),
                      builder: (context, snapshot) {
                         // Only start animation when delay is passed.
                         // Or simple TweenAnimation with delayed start if widget supports it.
                         // But FutureBuilder is easiest "wait then show" logic without custom stateful widgets for every item.
                         
                         // Actually, TweenAnimationBuilder triggered immediately with duration curve is smoother.
                         // Let's use TweenAnimationBuilder with initial delay logic embedded or just pure duration based usage.
                         // Better: Use a simple AnimatedOpacity + AnimatedPadding triggered by a post-frame callback?
                         // Simplest stable approach:
                         
                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeOutQuart,
                          builder: (context, value, child) {
                            // If we want delay, we can manipulate the curve or verify timestamp.
                            // But simply letting them all run with slightly different duration/curve params is tricky invalidation.
                            //
                            // Let's stick to the previous simple Tween which worked well, but maybe optimize the curve.
                            return Transform.translate(
                              offset: Offset(0, 50 * (1 - value)),
                              child: Opacity(
                                opacity: value,
                                child: child,
                              ),
                            );
                          },
                          child: GlassCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '"${quote.text}"',
                                  style: GoogleFonts.playfairDisplay(
                                    fontSize: 16,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black87,
                                    height: 1.2
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  quote.author.toUpperCase(),
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => provider.toggleFavorite(quote),
                                      child: const Icon(
                                        Icons.favorite,
                                        color: Color(0xFFFFD700),
                                        size: 20,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Share.share(
                                          '"${quote.text}" - ${quote.author}'),
                                      child: const Icon(
                                        Icons.ios_share,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                    );
                  },
                  childCount: favorites.length,
                ),
              ),
               // Add padding at bottom to account for floating nav bar
               const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          );
        },
      ),
    );
  }
}
