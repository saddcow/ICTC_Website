import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class IframeTest extends StatefulWidget {
  const IframeTest({super.key});

  @override
  State<IframeTest> createState() => _IframeTestState();
}

class _IframeTestState extends State<IframeTest> {
  final _iframeElement = IFrameElement();

  @override
  void initState() {
    _iframeElement.style.height = '80%';
    _iframeElement.style.width = '100%';
    _iframeElement.src =
        "https://www.canva.com/design/DAGD2xJGhQk/Vn67yXCF8GWkNJZu17aiMg/view?embed";
    _iframeElement.style.border = 'none';

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    super.initState();
  }

  final Widget _iframeWidget = HtmlElementView(
    viewType: 'iframeElement',
    key: UniqueKey(),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: _iframeWidget,
    );
  }
}
