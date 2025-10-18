// scroll_cubit_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/routing/routes.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';

class ScrollCubitCubit extends Cubit<ScrollCubitState> {
  final ScrollController scrollController = ScrollController();
  final Map<String, GlobalKey> sectionKeys = {};
  String currentsctionPath = AppRoutes.about;

  ScrollCubitCubit() : super(const ScrollCubitState.initial()) {
    // Listen to scroll events to update current section
    scrollController.addListener(_handleScroll);
  }

  void registerSection(String sectionId, GlobalKey key) {
    sectionKeys[sectionId] = key;
  }

  void _handleScroll() {
    // Find which section is currently in view
    String? closestSection;
    double closestDistance = double.infinity;

    for (final entry in sectionKeys.entries) {
      final key = entry.value;
      if (key.currentContext != null) {
        final box = key.currentContext!.findRenderObject() as RenderBox?;
        if (box != null) {
          try {
            final position = box.localToGlobal(Offset.zero);
            final sectionTop = position.dy;
            final distance = (sectionTop - 100).abs(); // 100px from top

            if (distance < closestDistance) {
              closestDistance = distance;
              closestSection = entry.key;
            }
          } catch (e) {
            debugPrint('Error calculating position for ${entry.key}: $e');
          }
        }
      }
    }

    if (closestSection != null && closestSection != currentsctionPath) {
      currentsctionPath = closestSection;
      emit(ScrollCubitState.scrollToSection(sctionPath: closestSection));
    }
  }

  void scrollToSection(String sectionId) {
    final key = sectionKeys[sectionId];
    currentsctionPath = sectionId;
    debugPrint('Scrolling to: $sectionId, Key: $key');

    if (key != null && key.currentContext != null) {
      // Use a post-frame callback to ensure the context is ready
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final context = key.currentContext;
        if (context != null) {
          final box = context.findRenderObject() as RenderBox?;
          if (box != null) {
            try {
              // Get the position relative to the viewport
              final position = box.localToGlobal(Offset.zero);

              // Calculate the scroll offset needed to position the section 80px from top
              final targetOffset = scrollController.offset + position.dy - 80;

              scrollController.animateTo(
                targetOffset,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
              );

              emit(ScrollCubitState.scrollToSection(sctionPath: sectionId));
            } catch (e) {
              debugPrint('Error scrolling to section: $e');
              // Fallback: scroll to top if calculation fails
              _scrollToTop();
            }
          } else {
            debugPrint('Box is null for section: $sectionId');
            _scrollToTop();
          }
        } else {
          debugPrint('Context is null for section: $sectionId');
          _scrollToTop();
        }
      });
    } else {
      debugPrint('Key not found or context null for section: $sectionId');
      _scrollToTop();
    }
  }

  void _scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Method to manually update current section (useful for initial load)
  void updateCurrentSection(String sectionId) {
    if (currentsctionPath != sectionId) {
      currentsctionPath = sectionId;
      emit(ScrollCubitState.scrollToSection(sctionPath: sectionId));
    }
  }

  @override
  Future<void> close() {
    scrollController.removeListener(_handleScroll);
    scrollController.dispose();
    return super.close();
  }
}
