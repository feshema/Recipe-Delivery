import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dinner_widget.dart' show DinnerWidget;
import 'package:flutter/material.dart';

class DinnerModel extends FlutterFlowModel<DinnerWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
