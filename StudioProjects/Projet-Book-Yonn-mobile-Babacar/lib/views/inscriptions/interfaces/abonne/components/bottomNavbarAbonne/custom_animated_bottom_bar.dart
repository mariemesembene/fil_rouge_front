import 'package:book_yonn_mobile/shared/styles/colors.dart';
import 'package:flutter/material.dart';

const Color _activeColor = colorBlue;
const Color _inactiveColor = colorNavigation;
const Color _activeAddMoreColor = colorBlack;

_CustomAnimatedBottomBarState? customAnimatedBottomBarState;

class CustomAnimatedBottomBar extends StatefulWidget {
  const CustomAnimatedBottomBar(
      {Key? key,
      this.selectedIndex = 0,
      this.iconSize = 33,
      this.backgroundColor,
      this.containerHeight = 56.0,
      this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
      required this.onItemSelected,
      required this.items})
      : super(key: key);

  final double iconSize;
  final Color? backgroundColor;
  final double containerHeight;
  final int selectedIndex;
  final MainAxisAlignment mainAxisAlignment;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;

  @override
  State<CustomAnimatedBottomBar> createState() =>
      customAnimatedBottomBarState = _CustomAnimatedBottomBarState();
}

class _CustomAnimatedBottomBarState extends State<CustomAnimatedBottomBar> {
  bool addMoreItemsSelected = false;
  @override
  Widget build(BuildContext context) {
    final bgColor =
        widget.backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
      ),
      child: SafeArea(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: double.infinity,
          height: widget.containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widget.items.sublist(0, 5).map((item) {
                  var index = widget.items.indexOf(item);
                  return GestureDetector(
                    onTap: () => widget.onItemSelected(index),
                    child: _ItemWidget(
                      item: item,
                      iconSize: widget.iconSize,
                      isSelected: index == widget.selectedIndex,
                      backgroundColor: bgColor,
                    ),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 18,
              ),
              Visibility(
                visible: addMoreItemsSelected,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.items.sublist(5, 9).map((item) {
                      var index = widget.items.indexOf(item);
                      return GestureDetector(
                        onTap: () => widget.onItemSelected(index),
                        child: _ItemWidget(
                          item: item,
                          iconSize: widget.iconSize,
                          isSelected: index == widget.selectedIndex,
                          backgroundColor: bgColor,
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A simple bottom navigation bar that animates when selected.

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.iconSize,
    required this.isSelected,
    required this.item,
    required this.backgroundColor,
  }) : super(key: key);

  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Semantics(
        container: true,
        selected: isSelected,
        child: Column(children: [
          IconTheme(
            data: IconThemeData(
              size: iconSize,
              color: isSelected && !item.isMoreItem
                  ? item.activeColor.withOpacity(1)
                  : item.isMoreItem &&
                          customAnimatedBottomBarState!.addMoreItemsSelected
                      ? _activeAddMoreColor.withOpacity(1)
                      : item.inactiveColor,
            ),
            child: item.icon,
          ),
          Text(item.title,
              style: TextStyle(
                color: isSelected && !item.isMoreItem
                    ? item.activeColor.withOpacity(1)
                    : item.isMoreItem &&
                            customAnimatedBottomBarState!.addMoreItemsSelected
                        ? _activeAddMoreColor.withOpacity(1)
                        : item.inactiveColor,
                fontFamily: 'SF Pro Display Regular',
                fontSize: 12,
              ))
        ]));
  }
}

// Item of the bottom navigation bar.

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.isMoreItem = false,
    this.textAlign = TextAlign.center,
    this.activeColor = _activeColor,
    this.inactiveColor = _inactiveColor,
  });

  final Widget icon;
  final String title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;
  final bool isMoreItem;
}
