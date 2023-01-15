import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:technical_test/app/core/values/app_colors.dart';

import '/app/core/utils/debouncer.dart';
import '../values/app_values.dart';

///ignore: must_be_immutable
class PagingView extends StatelessWidget {
  final Widget child;
  final Function() onLoadNextPage;
  final Future<void> Function()? onRefresh;
  final bool isLoading;

  ScrollController? scrollController;

  late final _debouncer = Debouncer(milliseconds: 100);

  PagingView({
    Key? key,
    required this.child,
    required this.onLoadNextPage,
    this.onRefresh,
    this.scrollController,
    required this.isLoading,
  }) : super(key: key) {
    scrollController ??= ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollController != null) {
          var triggerFetchMoreSize =
              0.75 * scrollController!.position.maxScrollExtent;

          if (scrollController!.position.pixels >= triggerFetchMoreSize &&
              (scrollController!.position.userScrollDirection ==
                  ScrollDirection.reverse)) {
            _debouncer.run(() {
              onLoadNextPage();
            });
          }
        }

        return true;
      },
      child: onRefresh == null
          ? _getScrollableView()
          : RefreshIndicator(
              child: _getScrollableView(),
              onRefresh: onRefresh!,
            ),
    );
  }

  _getScrollableView() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      controller: scrollController,
      child: Column(
        children: [
          child,
          SizedBox(
            height: AppValues.listBottomEmptySpace,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading
                    ? const CircularProgressIndicator(
                        color: AppColors.colorPrimary)
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
