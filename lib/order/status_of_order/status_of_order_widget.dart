import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/order/livetrackinglinks/livetrackinglinks_widget.dart';
import '/payments/bill_details/bill_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'status_of_order_model.dart';
export 'status_of_order_model.dart';

class StatusOfOrderWidget extends StatefulWidget {
  const StatusOfOrderWidget({
    super.key,
    required this.ticketid,
    required this.pagename,
    this.orderRef,
  });

  final int? ticketid;
  final String? pagename;
  final DocumentReference? orderRef;

  @override
  State<StatusOfOrderWidget> createState() => _StatusOfOrderWidgetState();
}

class _StatusOfOrderWidgetState extends State<StatusOfOrderWidget> {
  late StatusOfOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusOfOrderModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget.orderRef!)
        ..listen((statusOfOrderOrdersRecord) async {
          if (_model.statusOfOrderPreviousSnapshot != null &&
              !const OrdersRecordDocumentEquality().equals(statusOfOrderOrdersRecord,
                  _model.statusOfOrderPreviousSnapshot)) {
            _model.rebuild = 'Rebuild';
            safeSetState(() {});

            safeSetState(() {});
          }
          _model.statusOfOrderPreviousSnapshot = statusOfOrderOrdersRecord;
        }),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: const Center(
              child: SizedBox(
                width: 1.0,
                height: 1.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0x00FF0083),
                  ),
                ),
              ),
            ),
          );
        }

        final statusOfOrderOrdersRecord = snapshot.data!;

        return Title(
            title: 'statusOfOrder',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                )
                    ? AppBar(
                        backgroundColor: const Color(0xFFEBF7F3),
                        automaticallyImplyLeading: false,
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              buttonSize: 46.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                if (widget.pagename == 'History') {
                                  context.safePop();
                                } else {
                                  context.pushNamed(
                                    'Home',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: const TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.topToBottom,
                                      ),
                                    },
                                  );
                                }
                              },
                            ),
                          ].divide(const SizedBox(width: 20.0)),
                        ),
                        actions: const [],
                        centerTitle: true,
                        elevation: 0.0,
                      )
                    : null,
                body: SafeArea(
                  top: true,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: isWeb
                            ? () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return FFAppState().width.small.toDouble();
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return FFAppState().width.medium.toDouble();
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return FFAppState().width.large.toDouble();
                                } else {
                                  return FFAppState().width.small.toDouble();
                                }
                              }()
                            : FFAppState().width.small.toDouble(),
                      ),
                      decoration: const BoxDecoration(),
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Stack(
                                  children: [
                                    if ((statusOfOrderOrdersRecord
                                                .status.name ==
                                            'Order confirmed and customer paid') ||
                                        (statusOfOrderOrdersRecord
                                                .status.name ==
                                            ' Order modified post payment') ||
                                        (statusOfOrderOrdersRecord
                                                .status.name ==
                                            'Ready for pickup'))
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEBF7F3),
                                        ),
                                        child: Lottie.asset(
                                          'assets/jsons/packinggoods1.json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 300.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                    if (statusOfOrderOrdersRecord.status.name ==
                                        'Order picked up by Delivery Agent')
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEBF7F3),
                                        ),
                                        child: Lottie.asset(
                                          'assets/jsons/Out_for_deliverys_(1).json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 300.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                    if (statusOfOrderOrdersRecord.status.name ==
                                        'Order Delivered')
                                      Container(
                                        decoration: const BoxDecoration(
                                          color: Color(0xFFEBF7F3),
                                        ),
                                        child: Lottie.asset(
                                          'assets/jsons/Delivery_Complet_(1).json',
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: 300.0,
                                          fit: BoxFit.contain,
                                          animate: true,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 300.0, 0.0, 0.0),
                                    child: Container(
                                      width: 390.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(0.0),
                                          bottomRight: Radius.circular(0.0),
                                          topLeft: Radius.circular(18.0),
                                          topRight: Radius.circular(18.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 20.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Container(
                                                width: 350.0,
                                                height: 20.0,
                                                decoration: const BoxDecoration(),
                                                alignment: const AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Text(
                                                  () {
                                                    if (statusOfOrderOrdersRecord
                                                            .status.name ==
                                                        'Order Delivered') {
                                                      return 'Order successfully delivered ';
                                                    } else if (statusOfOrderOrdersRecord
                                                            .status.name ==
                                                        'Order picked up by Delivery Agent') {
                                                      return 'Order has been dispatched!';
                                                    } else {
                                                      return 'Order is being packed';
                                                    }
                                                  }(),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLargeFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (statusOfOrderOrdersRecord
                                                    .status.name ==
                                                'Order picked up by Delivery Agent')
                                              Container(
                                                width: 350.0,
                                                height: 65.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 272.0,
                                                        height: 24.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/material-symbols_package-2.png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: 1.0,
                                                              width: 80.0,
                                                              lineHeight: 4.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  const Color(
                                                                      0xFF50C154),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFD9D9D9),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      8.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/Bike_(1).svg',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: 0.0,
                                                              width: 80.0,
                                                              lineHeight: 4.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  const Color(
                                                                      0xFF318616),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFD9D9D9),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/zap.png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 116.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'Packing',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .backArrowColor,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Figtree'),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 116.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'On the way',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .backArrowColor,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Figtree'),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 116.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Delivered',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backArrowColor,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Figtree'),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if ((statusOfOrderOrdersRecord.status.name == 'Order confirmed and customer paid') ||
                                                (statusOfOrderOrdersRecord
                                                        .status.name ==
                                                    ' Order modified post payment') ||
                                                (statusOfOrderOrdersRecord
                                                        .status.name ==
                                                    'Ready for pickup'))
                                              Container(
                                                width: 350.0,
                                                height: 65.0,
                                                decoration: const BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 272.0,
                                                        height: 24.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/material-symbols_package-2.png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: 0.0,
                                                              width: 80.0,
                                                              lineHeight: 4.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  const Color(
                                                                      0xFF50C154),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFD9D9D9),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      8.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child: SvgPicture
                                                                  .asset(
                                                                'assets/images/Bike.svg',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            LinearPercentIndicator(
                                                              percent: 0.0,
                                                              width: 80.0,
                                                              lineHeight: 4.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  const Color(
                                                                      0xFF318616),
                                                              backgroundColor:
                                                                  const Color(
                                                                      0xFFD9D9D9),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/zap.png',
                                                                width: 24.0,
                                                                height: 24.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Container(
                                                            width: 116.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -0.1,
                                                                      0.0),
                                                              child: Text(
                                                                'Packing',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .backArrowColor,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Figtree'),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Container(
                                                              width: 116.0,
                                                              decoration:
                                                                  const BoxDecoration(),
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Text(
                                                                'On the way',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Figtree',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .backArrowColor,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              'Figtree'),
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 116.0,
                                                            decoration:
                                                                const BoxDecoration(),
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Text(
                                                              'Delivered',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Figtree',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .backArrowColor,
                                                                    fontSize:
                                                                        10.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            'Figtree'),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if ((statusOfOrderOrdersRecord
                                                            .status.name ==
                                                        'Order picked up by Delivery Agent') &&
                                                    (statusOfOrderOrdersRecord
                                                                .deliveryAgentTrackingUrl !=
                                                            '') &&
                                                    (statusOfOrderOrdersRecord
                                                                .deliveryagentphonenumber !=
                                                            '') &&
                                                    (statusOfOrderOrdersRecord
                                                                .deliveryAgentName !=
                                                            ''))
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0.0),
                                                            child: Image.asset(
                                                              'assets/images/Mask_group.png',
                                                              width: 40.0,
                                                              height: 40.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  statusOfOrderOrdersRecord
                                                                      .deliveryAgentName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                      ),
                                                                ),
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                  borderRadius:
                                                                      20.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons.call,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 24.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await launchURL(
                                                                        'tel:${statusOfOrderOrdersRecord.deliveryagentphonenumber}');
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 20.0)),
                                                      ),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              const Color(0xFFEBFFEF),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                          child: Text(
                                                            'I have picked up your order, and I am on the way to your \nlocation for the delivery',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
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
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return WebViewAware(
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () =>
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus(),
                                                                  child:
                                                                      Padding(
                                                                    padding: MediaQuery
                                                                        .viewInsetsOf(
                                                                            context),
                                                                    child:
                                                                        LivetrackinglinksWidget(
                                                                      url: statusOfOrderOrdersRecord
                                                                          .deliveryAgentTrackingUrl,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              safeSetState(
                                                                  () {}));
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Text(
                                                              'Live tracking link',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                  ),
                                                            ),
                                                            Icon(
                                                              Icons.play_arrow,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 24.0,
                                                            ),
                                                          ].divide(const SizedBox(
                                                              width: 10.0)),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(height: 10.0)),
                                                  ),
                                                if (statusOfOrderOrdersRecord
                                                        .status.name ==
                                                    'Order Delivered')
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
                                                      
                                                    },
                                                    child: Container(
                                                      height: 68.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            alignment:
                                                                const AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            children: [
                                                              Container(
                                                                width: 36.0,
                                                                height: 36.0,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF7F7F7),
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 20.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/star.png',
                                                                    width: 36.0,
                                                                    height:
                                                                        36.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      RatingBar
                                                                          .builder(
                                                                        onRatingUpdate:
                                                                            (newValue) =>
                                                                                safeSetState(() => _model.ratingBarValue = newValue),
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        initialRating: _model
                                                                            .ratingBarValue ??= statusOfOrderOrdersRecord.rating ?? 0.0,
                                                                        unratedColor:
                                                                            FlutterFlowTheme.of(context).accent1,
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            24.0,
                                                                        glowColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            250.0,
                                                                        height:
                                                                            25.0,
                                                                        decoration:
                                                                            const BoxDecoration(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      statusOfOrderOrdersRecord.rating !=
                                                                              null
                                                                          ? 'You rated this order'
                                                                          : 'Tap to rate this order',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodySmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodySmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Container(
                                              height: 68.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Stack(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      Container(
                                                        width: 36.0,
                                                        height: 36.0,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              Color(0xFFF7F7F7),
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.asset(
                                                            'assets/images/home.png',
                                                            width: 20.0,
                                                            height: 20.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Delivery at ${statusOfOrderOrdersRecord.tagFromAddressTag.first}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily),
                                                                ),
                                                          ),
                                                          Text(
                                                            statusOfOrderOrdersRecord
                                                                .fulladdresFromAddressid
                                                                .first,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 10.0)),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await launchURL(
                                                    'https://api.whatsapp.com/send?phone=15557031014&text=Hi%2C%20I%20need%20help%20with%20my%20Plazza%20Order%23${widget.ticketid?.toString()}');
                                              },
                                              child: Container(
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      children: [
                                                        Container(
                                                          width: 36.0,
                                                          height: 36.0,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: Color(
                                                                0xFFF7F7F7),
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child: Image.asset(
                                                              'assets/images/message-square_(1).png',
                                                              width: 20.0,
                                                              height: 20.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Need help?',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineLargeFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                  ),
                                                            ),
                                                            Text(
                                                              'Chat with us about any issue with your order',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodySmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).bodySmallFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_outlined,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .backArrowColor,
                                                        size: 14.0,
                                                      ),
                                                    ),
                                                  ].divide(
                                                      const SizedBox(width: 10.0)),
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
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return WebViewAware(
                                                      child: GestureDetector(
                                                        onTap: () =>
                                                            FocusScope.of(
                                                                    context)
                                                                .unfocus(),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BillDetailsWidget(
                                                            ticketid: widget
                                                                .ticketid!,
                                                            itemtotal:
                                                                statusOfOrderOrdersRecord
                                                                    .itemTotal
                                                                    .toString(),
                                                            totalbill:
                                                                statusOfOrderOrdersRecord
                                                                    .billTotalAmount
                                                                    .toString(),
                                                            timeStamp:
                                                                statusOfOrderOrdersRecord
                                                                    .orderCreatedTime!,
                                                            prescriptionListurl:
                                                                statusOfOrderOrdersRecord
                                                                    .prescriptionUrlList,
                                                            deliveryfee:
                                                                statusOfOrderOrdersRecord
                                                                    .deliveryCharges,
                                                            packegingfee:
                                                                statusOfOrderOrdersRecord
                                                                    .packagingCharges,
                                                            platformfee:
                                                                statusOfOrderOrdersRecord
                                                                    .platformFee,
                                                            canvanicefee:
                                                                statusOfOrderOrdersRecord
                                                                    .convenienceFee,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                height: 68.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0.0, 0.0),
                                                        children: [
                                                          Container(
                                                            width: 36.0,
                                                            height: 36.0,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: Color(
                                                                  0xFFF7F7F7),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 20.0,
                                                            height: 20.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/file-text.png',
                                                                width: 20.0,
                                                                height: 20.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Bill Details',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineLargeFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).headlineLargeFamily),
                                                                    ),
                                                              ),
                                                              Text(
                                                                '₹${statusOfOrderOrdersRecord.billTotalAmount.toString()}',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodySmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_forward_ios_outlined,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .backArrowColor,
                                                          size: 14.0,
                                                        ),
                                                      ),
                                                    ].divide(
                                                        const SizedBox(width: 10.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ].divide(const SizedBox(height: 20.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
