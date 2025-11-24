import 'package:flutter/material.dart';


class AppBar_Principal extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const AppBar_Principal({super.key, required this.title, this.actions});
  @override
  State <AppBar_Principal> createState()  => _AppBar_PrincipalState();
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
  class _AppBar_PrincipalState extends State<AppBar_Principal> {
    @override
    Widget build(BuildContext context) {
      return AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      actions: <Widget>[
        
           IconButton (icon : Icon(Icons.lightbulb),
           onPressed: () {}),
      ],
    );

  }
}

