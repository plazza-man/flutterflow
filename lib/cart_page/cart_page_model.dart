import '/components/pay_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Switch widget.
  bool? switchValue;
  // Model for payButton component.
  late PayButtonModel payButtonModel1;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController5;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController6;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController7;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController8;

  // Model for payButton component.
  late PayButtonModel payButtonModel2;

  @override
  void initState(BuildContext context) {
    payButtonModel1 = createModel(context, () => PayButtonModel());
    payButtonModel2 = createModel(context, () => PayButtonModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    payButtonModel1.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    expandableExpandableController5.dispose();
    expandableExpandableController6.dispose();
    expandableExpandableController7.dispose();
    expandableExpandableController8.dispose();
    payButtonModel2.dispose();
  }
}
