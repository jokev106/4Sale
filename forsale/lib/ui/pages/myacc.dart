part of 'pages.dart';

class MyAcc extends StatefulWidget {

  @override
  _MyAccState createState() => _MyAccState();
}

class _MyAccState extends State<MyAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
    );
  }
}