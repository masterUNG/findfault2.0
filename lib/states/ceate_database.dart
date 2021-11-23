import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateDatabase extends StatefulWidget {
  const CreateDatabase({Key? key}) : super(key: key);

  @override
  _CreateDatabaseState createState() => _CreateDatabaseState();
}

class _CreateDatabaseState extends State<CreateDatabase> {
  List<String> strings = [];
  List<List<String>> listStrings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => processInsertDatabase(),
          child: Text('Create Databse from xlsx'),
        ),
      ),
    );
  }

  Future<Null> processInsertDatabase() async {
    String xlsxAsset = 'assets/test1.xlsx';
    ByteData data = await rootBundle.load(xlsxAsset);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    List<String> nameSheets = [];
    for (var item in excel.tables.keys) {
      nameSheets.add(item);
    }
    int times = 0;
    // print('### namesheet ==>> $nameSheets');
    for (var item in excel.tables[nameSheets[1]]!.rows) {
      // print('### row ==>> $item');
      List<Data?> datas = item;
      // print('### datas ==>> $datas');

      if (times>0) {
        for (var item2 in datas) {
          // print('### nameSheet ==> ${item2!.sheetName}');
          print('### ข้อมูลใช้ได้ ==>> ${item2!.value}');
         
        }
      }
      times++;
    }
  }
}
