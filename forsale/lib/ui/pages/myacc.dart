part of 'pages.dart';

class MyAcc extends StatefulWidget {

  

  @override
  _MyAccState createState() => _MyAccState();
}

class _MyAccState extends State<MyAcc> {
  
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account'),
      ),
      body: Stack(
        children: [Container(
          alignment: Alignment.center,
          child: ElevatedButton.icon(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await AuthServices.signOut().then((value) {
                        if (value) {
                          setState(() {
                            isLoading = false;
                          });
                          AcitivityServices.showToast(
                              "Logout success", Colors.greenAccent);
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          AcitivityServices.showToast("Logout Failed", Colors.redAccent);
                        }
                      });
                    },
                    icon: Icon(Icons.logout),
                    label: Text("Logout"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepOrange[400],
                      elevation: 0,
                    )),
          ),
          isLoading == true ? AcitivityServices.loadings()
            : Container()
        ]
      ),
    );
  }
}