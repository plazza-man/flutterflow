import '/flutter_flow/flutter_flow_util.dart';
import '/medicine_order/components/nav_bar/nav_bar_widget.dart';
import 'plazza_homepage_widget.dart' show PlazzaHomepageWidget;
import 'package:flutter/material.dart';

class PlazzaHomepageModel extends FlutterFlowModel<PlazzaHomepageWidget> {
  ///  Local state fields for this page.

  String? address;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getLocation] action in plazzaHomepage widget.
  String? addres;
  // Stores action output result for [Custom Action - checkPermissionStatus] action in plazzaHomepage widget.
  bool? locationPermissionresponse;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
