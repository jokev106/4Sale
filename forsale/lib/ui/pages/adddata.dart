part of 'pages.dart';

class AddData extends StatefulWidget {

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  final ctrlproductCategory = TextEditingController();
  final ctrlproductInfo = TextEditingController();
  final ctrlproductPrice = TextEditingController();
  final ctrlproductProfit = TextEditingController();

  void clearForm() {
    ctrlproductCategory.clear();
    ctrlproductInfo.clear();
    ctrlproductPrice.clear();
    ctrlproductProfit.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Sales'),
      ),
      body: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ctrlproductCategory,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: "Product Category",
                              prefixIcon: Icon(Icons.label),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlproductInfo,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: "Description",
                              prefixIcon: Icon(Icons.description),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: ctrlproductPrice,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Price",
                              prefixIcon: Icon(Icons.money_rounded),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),  
                          TextFormField(
                            controller: ctrlproductProfit,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Profit",
                              prefixIcon: Icon(Icons.attach_money_rounded),
                              border: OutlineInputBorder(),
                            ),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please fill in the field!";
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 24,
                          ),                        
                          ElevatedButton.icon(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  Products products = Products(
                                      "",
                                      ctrlproductCategory.text,
                                      ctrlproductInfo.text,
                                      ctrlproductPrice.text,
                                      ctrlproductProfit.text,                             
                                      FirebaseAuth.instance.currentUser.uid,
                                      "",
                                      "");
                                  await ProductServices.addProduct(
                                          products)
                                      .then((value) {
                                    if (value == true) {
                                      Fluttertoast.showToast(
                                          msg: "Save Sales Successful.",
                                          backgroundColor: Colors.green);
                                      clearForm();
                                      setState(() {
                                        isLoading = false;
                                        Navigator.pushReplacementNamed(context, ListData.routeName);
                                      });
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "Save Sales Failed!",
                                          backgroundColor: Colors.red);
                                    }
                                  });
                                } else {
                                  AcitivityServices.showToast(
                                      "Please fill in the blanks!",
                                      Colors.orangeAccent);
                                }
                              },
                              icon: Icon(Icons.save),
                              label: Text("Save Sales"),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.pink[400],
                                  elevation: 0)),
                        ],
                      ),
                    )
                  ],
                ),
                isLoading == true ? AcitivityServices.loadings() : Container()
              ],
            ))
    );
  }
}