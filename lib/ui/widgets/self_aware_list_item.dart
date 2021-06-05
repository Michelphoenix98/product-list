import 'package:flutter/material.dart';

class SelfAwareListItem extends StatefulWidget {
  final Function itemCreated;
  final Widget child;
  final key;
  const SelfAwareListItem({
    required this.key,
    required this.itemCreated,
    required this.child,
  });
  @override
  _SelfAwareListItemState createState() => _SelfAwareListItemState();
}

class _SelfAwareListItemState extends State<SelfAwareListItem> {
  @override
  void initState() {
    super.initState();
    widget.itemCreated();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
