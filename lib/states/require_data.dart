import 'package:adobe_xd/pinned.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findfault/models/current_model.dart';
import 'package:findfault/states/show_map.dart';
import 'package:findfault/uper.dart';
import 'package:findfault/utility/my_dailo.dart';
import 'package:findfault/widgets/show_progess.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ReqireData extends StatefulWidget {
  const ReqireData({Key? key}) : super(key: key);

  @override
  _ReqireDataState createState() => _ReqireDataState();
}

class _ReqireDataState extends State<ReqireData> {
  List<String> breakers = [];
  String? brekerChoosed;
  bool loadBreaker = true;

  List<String> typeBreakers = ['slg', '2ph', '2phg', '3ph'];

  String? typeBreaker;
  String? currentMaxStr;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readDataFromdatabase();
  }

  Future<Null> readDataFromdatabase() async {
    await Firebase.initializeApp().then((value) async {
      print('## initial Success');
      await FirebaseFirestore.instance
          .collection('breaker')
          .snapshots()
          .listen((event) {
        for (var item in event.docs) {
          String nameBreaker = item.id;
          // print('## nameBreaker = $nameBreaker');
          setState(() {
            loadBreaker = false;
            breakers.add(nameBreaker);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Reqire Data'),
      // ),
      body: loadBreaker
          ? ShowProgess()
          : GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
              behavior: HitTestBehavior.opaque,
              child: Stack(
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
                                  'Please input DATA',
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
                                  'Welcome to \nFINDFAULT Project.',
                                  style: TextStyle(
                                    fontFamily: 'Circular Std Medium',
                                    fontSize: 23,
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
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Dropdownbreaker(),
                          ),
                        ),
                        Container(margin: EdgeInsets.symmetric(vertical: 8),
                          width: 250,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade600),
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.grey.shade300,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DropdownType(),
                          ),
                        ),
                        BuildCurrent(),
                        Buildcaculate()
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Container Buildcaculate() {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: () {
          if (brekerChoosed == null) {
            Mydialog().normalDialog(context, 'Breaker?', 'กรุณาใส่ข้อมูล');
          } else if (typeBreaker == null) {
            Mydialog().normalDialog(context, 'typeBreaker', 'กรุณาใส่ข้อมูล');
          } else if ((currentMaxStr == null) || (currentMaxStr!.isEmpty)) {
            Mydialog().normalDialog(context, 'ไม่มีค่ากระแส', 'กรุณาใส่ข้อมูล');
          } else {
            processCalculate();
          }
        },
        child: Text('คำนวนค่า'),
      ),
    );
  }

  Future<void> processCalculate() async {
    print(
        '### breakerchoose = $brekerChoosed, typebreker =$typeBreaker, currentmax = $currentMaxStr');

    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('breaker')
          .doc(brekerChoosed)
          .collection(typeBreaker!)
          .get()
          .then((value) {
        int? distant;
        CurrentModel? nearestModel;
        bool first = true;

        for (var item in value.docs) {
          
          CurrentModel model = CurrentModel.fromMap(item.data());
          int test = (int.parse(currentMaxStr!) - model.current).toInt();
          test = test.abs();
          print(' ### test => $test');
          if (first) {
            distant = test;
            first = false;
            nearestModel = CurrentModel.fromMap(item.data());
          } else if (distant! > test) {
            distant = test;
            nearestModel = CurrentModel.fromMap(item.data());
          }
        }

        print('###current ใกล้สุด ${nearestModel!.current}');

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowMap(currentModle: nearestModel!),
            ));
      });
    });

    // await Firebase.initializeApp().then((value) async {
    //   await FirebaseFirestore.instance
    //       .collection('breaker')
    //       .doc(brekerChoosed)
    //       .collection(typeBreaker!)
    //       .where('current', isEqualTo: currentMaxStr)
    //       .snapshots()
    //       .listen((event) {
    //     print('##event from Snapshot ==>> ${event.docs}');
    //     if (event.docs.toString() == '[]') {
    //       Mydialog().normalDialog(context, 'ไม่พบข้อมูล', 'รออัพเดทฐานข้อมูล');
    //     } else {
    //       for (var item in event.docs) {
    //         CurrentModle model = CurrentModle.fromMap(item.data());
    //         print('## lat = ${model.lat}, long = ${model.long}');
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //             builder: (context) => ShowMap(currentModle: model),
    //           ),
    //         );
    //       }
    //     }
    //   });
    // });
  }

  Container BuildCurrent() {
    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade300),
      width: 250,
      child: TextFormField(
        onChanged: (value) => currentMaxStr = value.trim(), //ไม่มีช่องว่าง
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'ค่ากระแสสูงสุด',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  DropdownButton<String> DropdownType() {
    return DropdownButton(
      onChanged: (value) {
        setState(() {
          typeBreaker = value;
        });
      },
      hint: Text('Type FAULT'), // type Fault
      value: typeBreaker,
      items: typeBreakers
          .map(
            (e) => DropdownMenuItem(
              child: Text(e),
              value: e,
            ),
          )
          .toList(),
    );
  }

  DropdownButton<String> Dropdownbreaker() {
    return DropdownButton(
      onChanged: (value) {
        setState(() {
          brekerChoosed = value as String?;
        });
      },
      value: brekerChoosed,
      hint: Text('Please Choose Breaker'),
      items: breakers
          .map((e) => DropdownMenuItem(
                child: Text(e),
                value: e,
              ))
          .toList(),
    );
  }
}
