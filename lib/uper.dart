import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class uper extends StatelessWidget {
  uper({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(start: 0.0, end: 0.0),
            Pin(size: 506.0, start: 0.0),
            child: Stack(
              children: <Widget>[
                Pinned.fromPins(
                  Pin(size: 218.0, middle: 0.5029),
                  Pin(size: 93.0, end: 0.0),
                  child: Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 27.0, end: 27.0),
                        Pin(size: 21.0, end: 0.0),
                        child: Text(
                          'Please input your DATA',
                          style: TextStyle(
                            fontFamily: 'Circular Std Book',
                            fontSize: 16,
                            color: const Color(0xff797979),
                            height: 1.5625,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(size: 64.0, start: 0.0),
                        child: Text(
                          'Welcome to \nFINDFAULT PROJECT',
                          style: TextStyle(
                            fontFamily: 'Circular Std Medium',
                            fontSize: 24,
                            color: const Color(0xff1136d2),
                            height: 1.3333333333333333,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Pinned.fromPins(
                  Pin(start: 0.0, end: 0.0),
                  Pin(start: 0.0, end: 95.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('images/logo.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
