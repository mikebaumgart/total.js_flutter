import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
 final Widget? leading;
 final double? leadingWidth;
 final bool automaticallyImplyLeading;
 final Widget title;
 final Function(BuildContext context) onBackButtonTapped;
 final TextStyle? titleTextStyle;
 final List<Widget>? actions;
 final bool centerTitle;
 final double toolbarHeight;
 final double toolbarOpacity;
 final ShapeBorder? shapeBorder;
 final double? elevation;
 final Color? backgroundColor;
 final IconThemeData? actionsIconTheme;
 final Color? shadowColor;
 final double sideMargin;
 final Color? statusBarColor;
 final Gradient? gradient;
 final BorderRadiusGeometry? gradientRadius;


 const AppBarWidget(
     {Key? key,
     this.leading,
     this.automaticallyImplyLeading = false,
     required this.onBackButtonTapped,
     required this.title,
     this.titleTextStyle,
     this.actions,
     this.centerTitle = false,
     this.toolbarHeight = 60,
     this.toolbarOpacity = 1,
     this.shapeBorder,
     this.elevation = 8,
     this.backgroundColor,
     this.leadingWidth = 56,
     this.actionsIconTheme =
         const IconThemeData(color: Colors.black, size: 36),
     this.shadowColor,
     this.sideMargin = 0,
     this.gradient,
     this.gradientRadius,
     this.statusBarColor})
     : super(key: key);


 @override
 Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(left: sideMargin, right: sideMargin),
     child: Center(
       child: AppBar(
           leading: InkWell(
             onTap: () => {onBackButtonTapped(context)},
             child: leading,
           ),
           flexibleSpace: Container(
               decoration: BoxDecoration(
                   gradient: gradient, borderRadius: gradientRadius)),
           leadingWidth: leadingWidth,
           iconTheme: actionsIconTheme,
           automaticallyImplyLeading: automaticallyImplyLeading,
           title: title,
           titleTextStyle: titleTextStyle,
           centerTitle: centerTitle,
           actions: actions,
           actionsIconTheme: actionsIconTheme,
           elevation: elevation,
           toolbarHeight: toolbarHeight,
           toolbarOpacity: toolbarOpacity,
           backgroundColor: backgroundColor,
           shadowColor: shadowColor,
           systemOverlayStyle: SystemUiOverlayStyle(
             statusBarColor: statusBarColor, // Status bar only for android.
           ),
           shape: shapeBorder),
     ),
   );
 }


 @override
 Size get preferredSize => Size.fromHeight(toolbarHeight);
}