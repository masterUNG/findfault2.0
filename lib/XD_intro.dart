import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class XD_intro extends StatelessWidget {
  XD_intro({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamedAndRemoveUntil(
          context, '/requireData', (route) => false),
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(start: 0.0, end: 0.0),
              Pin(start: 0.0, end: 0.0),
              child: Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff3a58f5),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.96, -0.95),
                          end: Alignment(-1.03, 0.98),
                          colors: [
                            const Color(0xff00ffe5),
                            const Color(0xff450080)
                          ],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 78.0, middle: 0.2127),
                    Pin(size: 44.0, middle: 0.4374),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Text(
                            'FIND',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 33,
                              color: const Color(0xb0ffffff),
                              fontWeight: FontWeight.w700,
                              height: 1.878787878787879,
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
                    Pin(size: 184.0, middle: 0.6794),
                    Pin(size: 84.0, middle: 0.4902),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: Text(
                            'FAULT',
                            style: TextStyle(
                              fontFamily: 'Nexa',
                              fontSize: 63,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                              height: 1.8888888888888888,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


