import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'nav_bar_model.dart';
export 'nav_bar_model.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late NavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              height: MediaQuery.sizeOf(context).height * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: const BoxDecoration(),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if (FFAppState().onTouchPlazza == false)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.16,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchPlazza ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchPlazza ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    true;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Home.svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    true;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/Property_1=Black_Default_(1).png',
                                                  width: 37.0,
                                                  height: 11.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().onTouchPlazza == true)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 69.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchPlazza ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchPlazza ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    true;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Home_Selected.svg',
                                                  width: 37.2,
                                                  height: 41.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if (FFAppState().onTouchStore == false)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.16,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchStore ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchStore ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    true;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Store.svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    true;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Store',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color: FFAppState()
                                                                  .onTouchStore ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().onTouchStore == true)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 69.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchStore ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchStore ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    true;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/storeSelected.svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    true;
                                                FFAppState()
                                                    .onTouchTransaction = false;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Store',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color: FFAppState()
                                                                  .onTouchStore ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if (FFAppState().onTouchTransaction ==
                                        false)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 69.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchTransaction ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchTransaction ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = true;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/Transactions.svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = true;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Transactions',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color: FFAppState()
                                                                  .onTouchTransaction ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().onTouchTransaction == true)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.16,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  FFAppState().onTouchTransaction ==
                                                          true
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .bottomNavbarIconcolor
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                                border: Border.all(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().onTouchTransaction ==
                                                            true
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .bottomNavbarIconcolor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = true;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/transactionsSelected.svg',
                                                  width: 28.0,
                                                  height: 28.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                FFAppState().onTouchPlazza =
                                                    false;
                                                FFAppState().onTouchStore =
                                                    false;
                                                FFAppState()
                                                    .onTouchTransaction = true;
                                                FFAppState().onTouchLife =
                                                    false;
                                                safeSetState(() {});
                                              },
                                              child: Text(
                                                'Transactions',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Figtree',
                                                      color: FFAppState()
                                                                  .onTouchTransaction ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  children: [
                                    if (FFAppState().onTouchLife == false)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.16,
                                                  height: 2.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().onTouchLife ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .onTouchLife ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().onTouchPlazza =
                                                        false;
                                                    FFAppState().onTouchStore =
                                                        false;
                                                    FFAppState()
                                                            .onTouchTransaction =
                                                        false;
                                                    FFAppState().onTouchLife =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/Plazza_Life.svg',
                                                      width: 28.0,
                                                      height: 28.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().onTouchPlazza =
                                                        false;
                                                    FFAppState().onTouchStore =
                                                        false;
                                                    FFAppState()
                                                            .onTouchTransaction =
                                                        false;
                                                    FFAppState().onTouchLife =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Life',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Figtree',
                                                              color: FFAppState()
                                                                          .onTouchLife ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .bottomNavbarIconcolor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    if (FFAppState().onTouchLife == true)
                                      Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.1,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                1.0,
                                        decoration: const BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.16,
                                                  height: 2.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().onTouchLife ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    border: Border.all(
                                                      color: FFAppState()
                                                                  .onTouchLife ==
                                                              true
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .bottomNavbarIconcolor
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().onTouchPlazza =
                                                        false;
                                                    FFAppState().onTouchStore =
                                                        false;
                                                    FFAppState()
                                                            .onTouchTransaction =
                                                        false;
                                                    FFAppState().onTouchLife =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: SvgPicture.asset(
                                                      'assets/images/plazzaLifeSelected.svg',
                                                      width: 28.0,
                                                      height: 28.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    FFAppState().onTouchPlazza =
                                                        false;
                                                    FFAppState().onTouchStore =
                                                        false;
                                                    FFAppState()
                                                            .onTouchTransaction =
                                                        false;
                                                    FFAppState().onTouchLife =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: Text(
                                                    'Life',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Figtree',
                                                              color: FFAppState()
                                                                          .onTouchLife ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .bottomNavbarIconcolor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.076,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.089,
                                    decoration: const BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Stack(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 2.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                            'EligibilityQuestions1');
                                                      },
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Ellipse_714.png',
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.088,
                                                          height: 71.0,
                                                          fit: BoxFit.cover,
                                                          alignment: const Alignment(
                                                              0.0, 0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            -0.15, -0.12),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  2.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.asset(
                                                          'assets/images/Group_48096773_(1).png',
                                                          width: 40.0,
                                                          height: 36.0,
                                                          fit: BoxFit.cover,
                                                          alignment: const Alignment(
                                                              0.0, 0.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
