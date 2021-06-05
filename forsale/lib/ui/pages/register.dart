part of 'pages.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
  final ctrlPhone = TextEditingController();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(24),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: EdgeInsets.all(24),
              child: ListView(children: [
                Form(
                    key: _formkey,
                    child: Column(children: [
                      Image.asset("assets/images/Logoforsale.png"),                   
                      TextFormField(
                        controller: ctrlName,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Name",
                          prefixIcon: Icon(Icons.account_box_rounded),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Your Name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: ctrlEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Please fill all field!";
                          } else {
                            if (!EmailValidator.validate(value)) {
                              return "Email is not valid!";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: ctrlPhone,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Your Phone Number";
                          } else {
                            if (value.length < 7 || value.length > 14) {
                              return "Phone Number isn't valid!";
                            } else {
                              return null;
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: ctrlPass,
                        obscureText: isVisible,
                        decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.vpn_key),
                            border: OutlineInputBorder(),
                            suffixIcon: new GestureDetector(
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(isVisible == true
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value.length < 6
                              ? "Password contains at least 6 character!"
                              : null;
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      ElevatedButton.icon(
                            onPressed: () async{
                              if(_formkey.currentState.validate()){
                                setState(() {
                                  isLoading = true;
                                });
                                Users users = new Users("", ctrlName.text, ctrlPhone.text, ctrlEmail.text, ctrlPass.text, "", "");
                                await AuthServices.signUp(users).then((value){  
                                  if(value == "Success!"){
                                  setState(() {
                                    isLoading = false;
                                  });
                                    AcitivityServices.showToast("Register Successful!", Colors.grey);
                                    Navigator.pushReplacementNamed(context, Login.routeName);
                                  }else{
                                    setState(() {
                                    isLoading = false;
                                  });
                                    AcitivityServices.showToast(value, Colors.red);
                                  }
                                });

                                //lanjut ke page berikut
                              }else{
                                //kosongkan aja
                                Fluttertoast.showToast(msg: "Please check all fields!",backgroundColor: Colors.red, toastLength: Toast.LENGTH_SHORT);
                              }
                            },
                            icon: Icon(Icons.save),
                            label: Text("Register"),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.grey,
                              elevation: 4,
                            ),
                          ),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, Login.routeName);
                        },
                        child: Text("Already Registered? Login Now!",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      )
                    ]))
              ]),
            ),
            isLoading == true ? AcitivityServices.loadings()
            : Container()
          ],
        ),
      ),
    );
  }
}
