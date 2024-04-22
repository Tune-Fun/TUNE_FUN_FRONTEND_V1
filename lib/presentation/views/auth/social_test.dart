import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget loginTestAlert(AuthMangerState authState, BuildContext context) {
  if (authState is AuthManagerStateLoading) {
    return const Text("login wait");
  } else if (authState is AuthMangerStateSuccess) {
    return Text("login success \n ${authState.userInfo.username}");
  } else if (authState is AuthMangerStateError) {
    return Text("login error ${authState.message}");
  }
  return const Text("login initial");
}

googleTest() async {
  HttpClient client = HttpClient();
  client.autoUncompress = true;

  // final url = Uri.parse(
  //     "http://15.165.117.136:8080/oauth2/authorization/google?mode=login");
  // var response = await http.get(url, headers: {"accept": "*/*"});
  // print(response);
}

class GoogleWebView extends StatefulWidget {
  const GoogleWebView({super.key});

  @override
  State<GoogleWebView> createState() => _GoogleWebViewState();
}

class _GoogleWebViewState extends State<GoogleWebView> {
  WebViewController? _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(
        Uri.parse(
            'https://api.tunefun.net/oauth2/authorization/google?mode=login'),
      )
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setUserAgent(
        "user-agent",
      )
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (int progress) {
          // progress bar
        },
        onNavigationRequest: (request) {
          if (request.url.startsWith('xxx')) {
            return NavigationDecision.prevent;
          }
          if (request.url.toString().contains('access_token')) {
            // 토큰 추출 로직 실행
            extractTokens(request.url.toString());
          }
          return NavigationDecision.navigate;
        },
      ));
    super.initState();
  }

  void extractTokens(String url) {
    Uri uri = Uri.parse(url);
    String? accessToken = uri.queryParameters['access_token'];
    String? refreshToken = uri.queryParameters['refresh_token'];

    if (accessToken != null && refreshToken != null) {
      print('Access Token: $accessToken');
      print('Refresh Token: $refreshToken');
      // 여기서 추가적인 로직을 수행, 예를 들어 상태 관리나 저장 등
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: WebViewWidget(
          controller: _webViewController!,
        ),
      ),
    );
  }
}

/*

class GoogleWebView extends StatefulWidget {
  const GoogleWebView({super.key});

  @override
  State<GoogleWebView> createState() => _GoogleWebViewState();
}

class _GoogleWebViewState extends State<GoogleWebView> {
  late InAppWebViewController webView;
  late CookieManager cookieManager;
  String url = 'https://api.tunefun.net/oauth2/authorization/google?mode=login';
  @override
  void initState() {
    cookieManager = CookieManager.instance();
    super.initState();
  }

  void extractTokens(String url) {
    Uri uri = Uri.parse(url);
    String? accessToken = uri.queryParameters['access_token'];
    String? refreshToken = uri.queryParameters['refresh_token'];

    if (accessToken != null && refreshToken != null) {
      print('Access Token: $accessToken');
      print('Refresh Token: $refreshToken');
      // 여기서 추가적인 로직을 수행, 예를 들어 상태 관리나 저장 등
    }
  }

  Future<void> handleRedirect(WebUri url) async {
    // Get all cookies from the cookie manager
    List<Cookie> cookies = await cookieManager.getCookies(url: url);
    for (var cookie in cookies) {
      print('Cookie: ${cookie.name}, Value: ${cookie.value}');
    }
    // Additional login handling logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: InAppWebView(
            initialSettings: InAppWebViewSettings(userAgent: 'random'),
            initialUrlRequest: URLRequest(url: WebUri(url)),
            onWebViewCreated: (InAppWebViewController controller) {
              webView = controller;
            },
            onLoadStop: (InAppWebViewController controller, WebUri? url) async {
              if (url != null &&
                  url.toString().startsWith(
                      'https://api.tunefun.net/login/oauth2/code/google')) {
                // Handle the redirection
                await handleRedirect(url);
              }
              if (url != null && url.toString().contains('access_token')) {
                // 토큰 추출 로직 실행
                extractTokens(url.toString());
              }
            },
          ),
        ));
  }
}

*/