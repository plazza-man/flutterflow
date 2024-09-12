import '/flutter_flow/flutter_flow_util.dart';
import '/pages/custom_components/pay_button/pay_button_widget.dart';
import 'cart_page_widget.dart' show CartPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CartPageModel extends FlutterFlowModel<CartPageWidget> {
  ///  State fields for stateful widgets in this page.

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
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController9;

  // Model for payButton component.
  late PayButtonModel payButtonModel3;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController10;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController11;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController12;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController13;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController14;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController15;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController16;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController17;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController18;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController19;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController20;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController21;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController22;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController23;

  // Model for payButton component.
  late PayButtonModel payButtonModel4;

  @override
  void initState(BuildContext context) {
    payButtonModel1 = createModel(context, () => PayButtonModel());
    payButtonModel2 = createModel(context, () => PayButtonModel());
    payButtonModel3 = createModel(context, () => PayButtonModel());
    payButtonModel4 = createModel(context, () => PayButtonModel());
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
    expandableExpandableController9.dispose();
    payButtonModel3.dispose();
    expandableExpandableController10.dispose();
    expandableExpandableController11.dispose();
    expandableExpandableController12.dispose();
    expandableExpandableController13.dispose();
    expandableExpandableController14.dispose();
    expandableExpandableController15.dispose();
    expandableExpandableController16.dispose();
    expandableExpandableController17.dispose();
    expandableExpandableController18.dispose();
    expandableExpandableController19.dispose();
    expandableExpandableController20.dispose();
    expandableExpandableController21.dispose();
    expandableExpandableController22.dispose();
    expandableExpandableController23.dispose();
    payButtonModel4.dispose();
  }
}
