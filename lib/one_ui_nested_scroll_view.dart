import 'package:atomic_design/fade_animation.dart';
import 'package:atomic_design/one_ui_scroll_physics.dart';
import 'package:flutter/material.dart';

class OneUINestedScrollView extends StatefulWidget {
  final double? expandedHeight;
  final double? toolbarHeight;
  final Widget? expandedWidget;
  final Widget? collapsedWidget;
  final BoxDecoration? boxDecoration;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final SliverList sliverList;
  final Color? sliverBackgroundColor;

  final GlobalKey<NestedScrollViewState>? globalKey;
  const OneUINestedScrollView({
    super.key,
    this.expandedHeight,
    this.toolbarHeight,
    this.expandedWidget,
    this.collapsedWidget,
    this.boxDecoration,
    this.leadingIcon,
    this.actions,
    this.sliverBackgroundColor,
    required this.sliverList,
    this.globalKey,
  });

  @override
  State<OneUINestedScrollView> createState() => _OneUINestedScrollViewState();
}

class _OneUINestedScrollViewState extends State<OneUINestedScrollView> {
  late double _expandedHeight;
  late double _toolbarHeight;
  late GlobalKey<NestedScrollViewState> _nestedScrollViewState;

  Future<void>? scrollAnimate;

  @override
  void initState() {
    _nestedScrollViewState = widget.globalKey ?? GlobalKey();
    super.initState();
  }

  double calculateExpandRatio(BoxConstraints constraints) {
    var expandRatio = (constraints.maxHeight - _toolbarHeight) /
        (_expandedHeight - _toolbarHeight);
    if (expandRatio > 1.0) expandRatio = 1;
    if (expandRatio < 0.0) expandRatio = 0;
    return expandRatio;
  }

  List<Widget> headerSliverBuilder(context, innerBoxIsCrolled) {
    return [
      SliverOverlapAbsorber(
        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        sliver: SliverAppBar(
          expandedHeight: _expandedHeight,
          pinned: true,
          toolbarHeight: _toolbarHeight,
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              final expandRatio = calculateExpandRatio(constraints);
              final animation = AlwaysStoppedAnimation(expandRatio);

              return Stack(
                children: [
                  Container(
                    decoration: widget.boxDecoration,
                  ),
                  if (widget.expandedWidget != null)
                    Center(
                      child: FadeAnimation(
                        animation: animation,
                        isExpandedWidget: true,
                        child: widget.expandedWidget!,
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        if (widget.leadingIcon != null) widget.leadingIcon!,
                        if (widget.collapsedWidget != null)
                          Padding(
                            padding: EdgeInsets.only(
                                left: widget.leadingIcon != null ? 0 : 20),
                            child: FadeAnimation(
                              animation: animation,
                              isExpandedWidget: false,
                              child: widget.collapsedWidget!,
                            ),
                          ),
                        if (widget.actions != null)
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: widget.actions!.reversed.toList(),
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      )
    ];
  }

  Widget body() {
    return Container(
      color: widget.sliverBackgroundColor,
      child: Builder(
        builder: (context) => CustomScrollView(
          slivers: [
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            widget.sliverList
          ],
        ),
      ),
    );
  }

  bool onNotification(ScrollEndNotification notification) {
    final scrollViewState = _nestedScrollViewState.currentState;
    final outerController = scrollViewState!.outerController;

    if (scrollViewState.innerController.position.pixels == 0 &&
        !outerController.position.atEdge) {
      final range = _expandedHeight - _toolbarHeight;
      final snapOffset = (outerController.offset / range) > 0.55 ? range : 0.0;

      Future.microtask(() async {
        if (scrollAnimate != null) await scrollAnimate;
        scrollAnimate = outerController.animateTo(
          snapOffset,
          duration: const Duration(milliseconds: 150),
          curve: Curves.ease,
        );
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    _expandedHeight =
        widget.expandedHeight ?? MediaQuery.of(context).size.height * 3 / 8;
    _toolbarHeight = widget.toolbarHeight ?? kToolbarHeight;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowIndicator();
        return true;
      },
      child: NotificationListener<ScrollEndNotification>(
        child: NestedScrollView(
          headerSliverBuilder: headerSliverBuilder,
          physics: OneUIScrollPhysics(_expandedHeight),
          body: body(),
        ),
      ),
    );
  }
}
