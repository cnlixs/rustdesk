import 'dart:async';

import 'package:flutter/material.dart';

/// 万方远控启动画面。
/// 应用首帧先显示品牌 Logo 与名称，1.5 秒后自动进入主界面。
class WanfangBoot extends StatefulWidget {
  final Widget child;

  const WanfangBoot({Key? key, required this.child}) : super(key: key);

  @override
  State<WanfangBoot> createState() => _WanfangBootState();
}

class _WanfangBootState extends State<WanfangBoot> {
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() => _visible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.child,
        if (_visible)
          Positioned.fill(
            child: const _WanfangSplashView(),
          ),
      ],
    );
  }
}

class _WanfangSplashView extends StatelessWidget {
  const _WanfangSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 96,
              height: 96,
            ),
            const SizedBox(height: 24),
            const Text(
              '\u4e07\u65b9\u8fdc\u63a7',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color(0xFF003B7A),
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'WANFANG REMOTE',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0B6BB5),
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 26,
              height: 26,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFE60012)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
