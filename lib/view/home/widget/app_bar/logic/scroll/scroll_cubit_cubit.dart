import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/routing/routes.dart';
import 'package:my_portfolio/view/home/widget/app_bar/logic/scroll/scroll_cubit_state.dart';

class ScrollCubitCubit extends Cubit<ScrollCubitState> {
  final ScrollController scrollController = ScrollController();
  final Map<String, GlobalKey> sectionKeys = {};
  String currentsctionPath = AppRoutes.about;
  ScrollCubitCubit() : super(const ScrollCubitState.initial());

  void registerSection(String sectionId, GlobalKey key) {
    sectionKeys[sectionId] = key;
  }

  void scrollToSection(String sectionId) {
    final key = sectionKeys[sectionId];
    currentsctionPath = sectionId;
    debugPrint('$sectionId:$key:${key?.currentContext}');
    if (key != null && key.currentContext != null) {
      final context = key.currentContext!;
      final box = context.findRenderObject() as RenderBox?;
      if (box != null) {
        final position = box.localToGlobal(Offset.zero);

        scrollController.animateTo(
          scrollController.offset + position.dy - 100, // Adjust for padding
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );

        emit(ScrollCubitState.scrollToSection(sctionPath: sectionId));
      }
    }
  }

  @override
  Future<void> close() {
    scrollController.dispose();
    return super.close();
  }
}
