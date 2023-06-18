import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget(
      {Key? key,
      this.title,
      this.actions,
      this.toolbarHeight,
      this.backgroundColor,
      this.bottom,
      this.automaticallyImplyLeading = true,
      this.leading,
      this.backButtonPressed})
      : super(key: key);
  final Widget? title, leading;
  final List<Widget>? actions;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final bool automaticallyImplyLeading;
  final void Function()? backButtonPressed;

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 61);
}

class _CustomAppBarState extends State<CustomAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      leading: widget.automaticallyImplyLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset('assets/icons/icon_arrow_left.svg',
                  width: 6.w))
          : null,
      title: widget.title,
      actions: widget.actions,
      toolbarHeight: widget.toolbarHeight,
      backgroundColor: widget.backgroundColor,
      bottom: widget.bottom,
    );
  }
}
