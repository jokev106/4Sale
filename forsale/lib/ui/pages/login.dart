part of 'pages.dart';

class Login extends StatefulWidget {

  static const String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formkey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPass = TextEditingController();
 
  bool isVisible = true;
  bool isLoading = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            ListView(children: [
              Form(
                  key: _formkey,
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset("assets/images/Logoforsale.png"),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        controller: ctrlEmail,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          email = value;
                          if (value.isEmpty) {
                            return "Please fill the field!";
                          } else {
                            if (!EmailValidator.validate(value)) {
                              return "Email isn't valid!";
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
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await AuthServices.signIn(ctrlEmail.text, ctrlPass.text).then((value) {
                              if (value == "success") {
                                setState(() {
                                  isLoading = false;
                                });
                                AcitivityServices.showToast("Login success", Colors.blueGrey);
                                Navigator.pushReplacementNamed(context, MainMenu.routeName);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                AcitivityServices.showToast(
                                    value, Colors.redAccent);
                              }
                            });
                            Navigator.pushReplacementNamed(
                            context, MainMenu.routeName);

                          } else {
                            Fluttertoast.showToast(
                            msg: "Please check the field",
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                          }
                        },
                        icon: Icon(Icons.login_rounded),
                        label: Text("Login"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[400],
                          elevation: 0,
                        ),
                      ),
                      SizedBox(height: 24),
                    SizedBox(
                      height: 24,
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(
                              context, Register.routeName);
                      },
                      child: Text("Don't have an account? Register Here",
                      style: TextStyle(color: Colors.black,)
                      ),
                    )
                  ]))
            ]),
            isLoading == true ? AcitivityServices.loadings()
            : Container()
          ],
        ),
      ),
    );
  }
}
