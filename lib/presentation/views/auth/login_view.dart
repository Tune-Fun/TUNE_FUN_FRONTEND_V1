import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tunefun_front/common/common.dart';
import 'package:tunefun_front/constants/constants.dart';
import 'package:tunefun_front/presentation/manager/auth_manager/auth_manager.dart';
import 'package:tunefun_front/presentation/views/auth/signup_main_view.dart';
import 'package:tunefun_front/theme/pallete.dart';

import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final appbar = UIConstants.appBar();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool buttonState = false;

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  void logIn() {
    dynamic data = {
      'username': usernameController.text,
      'password': passwordController.text,
    };
    ref.watch(authManagerProvider.notifier).logIn(data);
  }

  @override
  Widget build(BuildContext context) {
    // final loginState = ref.watch(authManagerProvider);
    return Scaffold(
        appBar: appbar,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: usernameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(22),
                      hintText: '아이디',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          color: Pallete.textSubColor,
                          width: 3,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(22),
                      hintText: '비밀번호',
                      hintStyle: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // apple social
                        },
                        child: SvgPicture.asset(
                          ImageConstants.appleIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 45),
                      GestureDetector(
                        onTap: () async {
                          // google social
                          // await googleTest();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: ((context) => GoogleWebView())));
                        },
                        child: SvgPicture.asset(
                          ImageConstants.googleIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      const SizedBox(width: 45),
                      GestureDetector(
                        onTap: () {
                          // instagram social
                        },
                        child: SvgPicture.asset(
                          ImageConstants.instagramIcon,
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, SignUpMainScreen.route());
                        },
                        child: const Text(
                          '회원가입',
                          style: TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          '아이디/비밀번호 찾기',
                          style: TextStyle(
                            color: Pallete.textMainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GreenSquareButton(
                      onTap: () {
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) return;
                        logIn();
                      },
                      buttonState: usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty,
                      buttonText: '로그인',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

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