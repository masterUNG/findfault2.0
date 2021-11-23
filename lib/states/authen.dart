import 'package:findfault/utility/my_dailo.dart';
import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  const Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  String? user;
  String? password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            USER(),
            PASSWORD(),
            LOGIN(),
            TextButton(
                onPressed: () => Navigator.pushNamed(context, '/requireData'),
                child: Text('Guest'))
          ],
        ),
      ),
    );
  }

  ElevatedButton LOGIN() {
    return ElevatedButton(
      onPressed: () {
        if ((user?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
          Mydialog().normalDialog(context, 'โปรดลงทะเบียน', 'ลงชื่อ');
        } else {}
      },
      child: Text('Login'),
    );
  }

  Container USER() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 200,
      child: TextFormField(
        onChanged: (value) => user = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container PASSWORD() {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: 200,
      child: TextFormField(
        onChanged: (value) => password = value.trim(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_outline),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
