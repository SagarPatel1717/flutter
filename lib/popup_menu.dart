import 'package:flutter/material.dart';

class PopupItem {
  int value;
  String name;
  PopupItem(this.value, this.name);
}

class PopupMenu extends StatefulWidget {
  @override
  _MyState createState() {
    return _MyState();
  }
}

class _MyState extends State<PopupMenu> {
  final GlobalKey _menuKey = GlobalKey();
  String _value = "";
  List<PopupItem> _list = [
    PopupItem(1, "First Value"),
    PopupItem(2, "Second Item"),
    PopupItem(3, "Third Item"),
    PopupItem(4, "Fourth Item")
  ];
  @override
  Widget build(BuildContext context) {

    final button = PopupMenuButton(
        color: Colors.yellowAccent,
        elevation: 20,
        enabled: true,
        onSelected: (value) {
          setState(() {
            _value = value as String;
          });
        },
        itemBuilder: (context) {
          return _list.map((PopupItem choice) {
            return PopupMenuItem(
              value: choice,
              child: SizedBox(child: Text(choice.name), width: MediaQuery.of(context).size.width),
            );
          }).toList();
        });

    return Container(
      child: ListTile(
          title: Text('Doge or lion?'),
          trailing: button,
          onTap: () {
            // This is a hack because _PopupMenuButtonState is private.
            dynamic state = _menuKey.currentState;
            state.showButtonMenu();
          }),
    );
  }
}
