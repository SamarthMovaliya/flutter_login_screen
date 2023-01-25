import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class webViewAll extends StatefulWidget {
  const webViewAll({Key? key}) : super(key: key);

  @override
  State<webViewAll> createState() => _webViewAllState();
}

class _webViewAllState extends State<webViewAll> {
  InAppWebViewController? inAppWebView;

  @override
  Widget build(BuildContext context) {
    Map e = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          e['name'],
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigo,
                Colors.indigo.shade400,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: InAppWebView(
        onWebViewCreated: (controller) {
          setState(() {
            inAppWebView = controller;
          });
        },
        initialUrlRequest: URLRequest(
          url: Uri.parse(
            e['url'],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 45,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade900,
                offset: const Offset(2, 3),
                blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () async {
                await inAppWebView?.loadUrl(
                  urlRequest: URLRequest(
                    url: Uri.parse(e['url']),
                  ),
                );
              },
              icon: const Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                await inAppWebView?.goForward();
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                await inAppWebView?.goBack();
              },
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () async {
                await inAppWebView?.reload();
              },
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
