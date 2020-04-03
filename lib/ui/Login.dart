import 'package:flutter/material.dart';
import 'package:bvp_ieee/Auth.dart';
import 'package:bvp_ieee/App.dart';

class LoginPage extends StatefulWidget {                                        //TODO: Login button and signup button don't login at the moment
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoginForm = true;
  String _email;
  String _password;
  String _errorMessage;
  bool _isLoading;
  final _formKey = new GlobalKey<FormState>();

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: Stack(
        children: <Widget>[
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              )),
              elevation: 20.0,
              child: Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: new Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          LoginForm(),
                          LoginButton(),
                        ],
                      ),
                      FlatButton(
                        splashColor: Colors.white.withOpacity(0.0),
                        child: Text(
                          _isLoginForm
                              ? "Register"
                              : "Have an account? Sign in",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                        onPressed: toggleForm,
//                  color: Colors.blue,
                      ),
                      showErrorMessage(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _showCircularProgress(),
        ],
      ),
    );
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
          /*Navigator.push(context, new MaterialPageRoute(builder: (context){
            return App(
              userId: _userId,
              auth: widget.auth,
              logoutCallback: logoutCallback,
            );
          }));*/
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  void toggleForm() {
    if (_isLoginForm) {
      setState(() {
        _isLoginForm = false;
      });
      print("false");
    } else {
      setState(() {
        _isLoginForm = true;
      });
      print("true");
    }
  }

  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget LoginButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          width: MediaQuery.of(context).size.width * 0.8,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.blue,
            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }

  Widget LoginForm() {
    return _isLoginForm
        ? Column(
            children: <Widget>[
              ListTile(
                title: Text("Email"),
                subtitle: new TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: new InputDecoration(
                      hintText: 'Email',
                      icon: new Icon(
                        Icons.mail,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value.trim(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text("Password"),
                subtitle: new TextFormField(
                  maxLines: 1,
                  obscureText: true,
                  autofocus: false,
                  decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Password can\'t be empty' : null,
//            onSaved: (value) => _password = value.trim(),
                ),
              ),
            ],
          )
        : Column(
            children: <Widget>[
              ListTile(
                title: Text("University Roll No"),
                subtitle: new TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  decoration: new InputDecoration(
                      hintText: 'Enter your Roll Number',
                      icon: new Icon(
                        Icons.format_list_numbered,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Roll Number can\'t be empty' : null,
//            onSaved: (value) => _email = value.trim(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text("User ID"),
                subtitle: new TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  decoration: new InputDecoration(
                      hintText: 'Email',
                      icon: new Icon(
                        Icons.mail,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Email can\'t be empty' : null,
                  onSaved: (value) => _email = value.trim(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListTile(
                title: Text("Password"),
                subtitle: new TextFormField(
                  maxLines: 1,
                  obscureText: true,
                  autofocus: false,
                  decoration: new InputDecoration(
                      hintText: 'Password',
                      icon: new Icon(
                        Icons.lock,
                        color: Colors.grey,
                      )),
                  validator: (value) =>
                      value.isEmpty ? 'Password can\'t be empty' : null,
                  onSaved: (value) => _password = value.trim(),
                ),
              ),
            ],
          );
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }
}


/*Widget showErrorMessage() {
  if (_errorMessage.length > 0 && _errorMessage != null) {
    return new Text(
      _errorMessage,
      style: TextStyle(
          fontSize: 13.0,
          color: Colors.red,
          height: 1.0,
          fontWeight: FontWeight.w300),
    );
  } else {
    return new Container(
      height: 0.0,
    );
  }
}
*/
