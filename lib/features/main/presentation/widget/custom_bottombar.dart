import 'package:flutter/material.dart';
import 'package:vibezone/core/common/widgets/max_width_box.dart';
import 'package:vibezone/core/common/widgets/svg_widget.dart';
import 'package:vibezone/core/utils/responsive.dart';

class CustomBottomBar extends StatelessWidget {
  /// A bottom bar that faithfully follows the design by Aurélien Salomon
  ///
  /// https://dribbble.com/shots/5925052-Google-Bottom-Bar-Navigation-Pattern/
   CustomBottomBar({
    Key? key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const StadiumBorder(),
    this.margin = const EdgeInsets.all(10),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  final List<SalomonBottomBarItem> items;
  final int currentIndex;
  final Function(int)? onTap;
  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final double? selectedColorOpacity;
  final ShapeBorder itemShape;
  final EdgeInsets margin;
  final EdgeInsets itemPadding;
  final Duration duration;
  final Curve curve;

  static const double _iconSize = 24;

  /// Width of the widest label at the current text scale.
  double _maxLabelWidth(BuildContext context, TextStyle style) {
    final scaler = MediaQuery.textScalerOf(context);
    var maxWidth = 0.0;
    for (final item in items) {
      final title = item.title;
      if (title is! Text || title.data == null) continue;
      final painter = TextPainter(
        text: TextSpan(text: title.data, style: style),
        textScaler: scaler,
        maxLines: 1,
        textDirection: Directionality.of(context),
      )..layout();
      if (painter.width > maxWidth) maxWidth = painter.width;
      painter.dispose();
    }
    return maxWidth;
  }

  /// Labels are only shown when the selected item (icon + label) plus every
  /// other item (icon only) fits; otherwise the bar falls back to icons.
  bool _canShowLabels(BuildContext context, double availableWidth) {
    final labelStyle = DefaultTextStyle.of(
      context,
    ).style.merge(const TextStyle(fontWeight: FontWeight.w700));
    final iconItemWidth = _iconSize + itemPadding.horizontal;
    final selectedWidth =
        iconItemWidth +
        itemPadding.left / 2 +
        _maxLabelWidth(context, labelStyle);
    final required = iconItemWidth * (items.length - 1) + selectedWidth;
    // Small slack for font rendering differences.
    return required + 4 <= availableWidth;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        minimum: margin,
        child: MaxWidthBox(
          maxWidth: Breakpoints.bottomBar,
          child: LayoutBuilder(
            builder: (context, constraints) =>
                _buildItems(context, theme, constraints.maxWidth),
          ),
        ),
      ),
    );
  }

  Widget _buildItems(BuildContext context, ThemeData theme, double width) {
    final showLabels = _canShowLabels(context, width);
    return Row(
      /// Using a different alignment when there are 2 items or less
      /// so it behaves the same as BottomNavigationBar.
      mainAxisAlignment: items.length <= 2
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.spaceBetween,
      children: [
        for (final item in items)
          TweenAnimationBuilder<double>(
            tween: Tween(end: items.indexOf(item) == currentIndex ? 1.0 : 0.0),
            curve: curve,
            duration: duration,
            builder: (context, t, _) {
              final selectedColor = theme.colorScheme.primary;
              final unselectedColor = theme.colorScheme.secondary;
              final label = item.title is Text
                  ? (item.title as Text).data
                  : null;
              final tab = Material(
                color: Color.lerp(Colors.transparent, selectedColor, t),
                shape: itemShape,
                child: InkResponse(
                  onTap: () => onTap?.call(items.indexOf(item)),
                  containedInkWell: true,
                  highlightShape: BoxShape.rectangle,
                  radius: 28,
                  splashColor: selectedColor.withValues(alpha: 0.3),
                  hoverColor: selectedColor.withValues(alpha: 0.1),
                  highlightColor: selectedColor.withValues(alpha: 0.1),
                  focusColor: selectedColor.withValues(alpha: 0.1),
                  customBorder: itemShape,
                  child: Padding(
                    // With labels hidden the pill stays symmetric.
                    padding: !showLabels
                        ? itemPadding
                        : itemPadding -
                              (Directionality.of(context) == TextDirection.ltr
                                  ? EdgeInsets.only(
                                      right: itemPadding.right * t,
                                    )
                                  : EdgeInsets.only(
                                      left: itemPadding.left * t,
                                    )),
                    child: Row(
                      children: [
                        SvgWidget(
                          ic: items.indexOf(item) == currentIndex
                              ? item.activeIcon ?? item.icon
                              : item.icon,
                          color: Color.lerp(unselectedColor, Colors.black, t),
                          height: _iconSize,
                          width: _iconSize,
                        ),
                        ClipRect(
                          clipBehavior: Clip.antiAlias,
                          child: SizedBox(
                            height: MediaQuery.textScalerOf(context).scale(20),
                            child: Align(
                              alignment: Alignment(-0.2, 0.0),
                              widthFactor: showLabels ? t : 0,
                              child: Padding(
                                padding:
                                    Directionality.of(context) ==
                                        TextDirection.ltr
                                    ? EdgeInsets.only(
                                        left: itemPadding.left / 2,
                                        right: itemPadding.right,
                                      )
                                    : EdgeInsets.only(
                                        left: itemPadding.left,
                                        right: itemPadding.right / 2,
                                      ),
                                child: DefaultTextStyle.merge(
                                  style: TextStyle(
                                    color: Color.lerp(
                                      unselectedColor,
                                      Colors.black,
                                      t,
                                    ),
                                    fontWeight: FontWeight.w700,
                                  ),
                                  child: item.title,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
              if (showLabels || label == null) return tab;
              return Tooltip(message: label, child: tab);
            },
          ),
      ],
    );
  }
}

/// A tab to display in a [SalomonBottomBar]
class SalomonBottomBarItem {
  /// An icon to display.
  final String icon;

  /// An icon to display when this tab bar is active.
  final String? activeIcon;

  /// Text to display, ie `Home`
  final Widget title;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  SalomonBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
  });
}
