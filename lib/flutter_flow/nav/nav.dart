import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const HomePageWidget() : const OnboardingWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const HomePageWidget() : const OnboardingWidget(),
        ),
        FFRoute(
          name: 'CheckEligibility',
          path: '/checkEligibility',
          builder: (context, params) => const CheckEligibilityWidget(),
        ),
        FFRoute(
          name: 'plazzaHomepage',
          path: '/plazzaHomepage',
          builder: (context, params) => const PlazzaHomepageWidget(),
        ),
        FFRoute(
          name: 'cartPage',
          path: '/cartPage',
          builder: (context, params) => const CartPageWidget(),
        ),
        FFRoute(
          name: 'onboarding',
          path: '/onboarding',
          builder: (context, params) => const OnboardingWidget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions1',
          path: '/eligibilityQuestions1',
          builder: (context, params) => const EligibilityQuestions1Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions2',
          path: '/eligibilityQuestions2',
          builder: (context, params) => const EligibilityQuestions2Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions3',
          path: '/eligibilityQuestions3',
          builder: (context, params) => const EligibilityQuestions3Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions4',
          path: '/eligibilityQuestions4',
          builder: (context, params) => const EligibilityQuestions4Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions5',
          path: '/eligibilityQuestions5',
          builder: (context, params) => const EligibilityQuestions5Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestion6',
          path: '/eligibilityQuestion6',
          builder: (context, params) => const EligibilityQuestion6Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestion7',
          path: '/eligibilityQuestion7',
          builder: (context, params) => const EligibilityQuestion7Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestion8',
          path: '/eligibilityQuestion8',
          builder: (context, params) => const EligibilityQuestion8Widget(),
        ),
        FFRoute(
          name: 'EligibilityQuestion9',
          path: '/eligibilityQuestion9',
          builder: (context, params) => const EligibilityQuestion9Widget(),
        ),
        FFRoute(
          name: 'OtpVerifiction',
          path: '/otpVerifiction',
          builder: (context, params) => OtpVerifictionWidget(
            mobilenumber: params.getParam(
              'mobilenumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Mambershipkyc1',
          path: '/mambershipkyc1',
          builder: (context, params) => const Mambershipkyc1Widget(),
        ),
        FFRoute(
          name: 'consultation',
          path: '/consultation',
          builder: (context, params) => const ConsultationWidget(),
        ),
        FFRoute(
          name: 'AddFamily',
          path: '/addFamily',
          builder: (context, params) => const AddFamilyWidget(),
        ),
        FFRoute(
          name: 'Verifyidentity',
          path: '/verifyidentity',
          builder: (context, params) => const VerifyidentityWidget(),
        ),
        FFRoute(
          name: 'medicineHomepage',
          path: '/medicineHomepage',
          builder: (context, params) => const MedicineHomepageWidget(),
        ),
        FFRoute(
          name: 'UpdateNumberOtp',
          path: '/UpdateNumberOtp',
          builder: (context, params) => UpdateNumberOtpWidget(
            mobilenumber: params.getParam(
              'mobilenumber',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Identityverified',
          path: '/identityverified',
          builder: (context, params) => const IdentityverifiedWidget(),
        ),
        FFRoute(
          name: 'Schedulehealthcheck-up',
          path: '/schedulehealthcheckUp',
          builder: (context, params) => const SchedulehealthcheckUpWidget(),
        ),
        FFRoute(
          name: 'Schedulehealthcheck-up2',
          path: '/schedulehealthcheckUp2',
          builder: (context, params) => const SchedulehealthcheckUp2Widget(),
        ),
        FFRoute(
          name: 'Schedulehealthcheck-up3',
          path: '/schedulehealthcheckUp3',
          builder: (context, params) => const SchedulehealthcheckUp3Widget(),
        ),
        FFRoute(
          name: 'page1',
          path: '/page1',
          builder: (context, params) => const Page1Widget(),
        ),
        FFRoute(
          name: 'page2',
          path: '/page2',
          builder: (context, params) => const Page2Widget(),
        ),
        FFRoute(
          name: 'uploadingPrescription',
          path: '/uploadingPrescription',
          builder: (context, params) => const UploadingPrescriptionWidget(),
        ),
        FFRoute(
          name: 'History',
          path: '/history',
          builder: (context, params) => const HistoryWidget(),
        ),
        FFRoute(
          name: 'medicineCart',
          path: '/medicineCart',
          builder: (context, params) => const MedicineCartWidget(),
        ),
        FFRoute(
          name: 'statusOfOrder',
          path: '/statusOfOrder',
          builder: (context, params) => const StatusOfOrderWidget(),
        ),
        FFRoute(
          name: 'EligibilityQuestions0',
          path: '/eligibilityQuestions0',
          builder: (context, params) => const EligibilityQuestions0Widget(),
        ),
        FFRoute(
          name: 'DencetroCall',
          path: '/dencetroCall',
          builder: (context, params) => DencetroCallWidget(
            url: params.getParam(
              'url',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/onboarding';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: FlutterFlowTheme.of(context).primary,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Property_1=White.png',
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
