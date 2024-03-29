import 'package:flutter/material.dart';

class SABT extends StatefulWidget {
  const SABT({
    Key? key,
    required this.child,
    required this.basicChild,
  }) : super(key: key);

  final Widget child;
  final Widget basicChild;

  @override
  _SABTState createState() {
    return _SABTState();
  }
}

class _SABTState extends State<SABT> {
  ScrollPosition? _position;
  bool _visible = false;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context).position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final settings =
    context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    final visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_visible) {
      return widget.child;
    }
    return widget.basicChild;
  }
}
