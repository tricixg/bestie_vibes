import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:bestie_vibes/components/auth_state.dart';
import 'package:bestie_vibes/utils/constants.dart';
import 'package:bestie_vibes/components/background.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);


 static Route route() {
    return MaterialPageRoute(
      builder: (_) => LoginPage(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends AuthState<LoginPage> {
  bool _isLoading = false;
  late final TextEditingController _emailController;

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });
    final response = await supabase.auth.signIn(
        email: _emailController.text,
        options: AuthOptions(
            redirectTo: kIsWeb
                ? null
                : 'io.supabase.flutterquickstart://login-callback/'));
    final error = response.error;
    if (error != null) {
      context.showErrorSnackBar(message: error.message);
    } else {
      context.showSnackBar(message: 'Check your email for login link!');
      _emailController.clear();
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255,49, 49, 49),
                    fontSize: 36),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                )

                //  TextField(
                //   decoration: InputDecoration(
                //     labelText: "Email"
                //   ),
                // ),
                ),
            SizedBox(height: size.height * 0.03),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RaisedButton(
                onPressed: _isLoading ? null : _signIn,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                textColor: Colors.white,
                padding: const EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(colors: [
                        Color.fromARGB(255, 255, 193, 198),
                        Color.fromARGB(255, 254, 143, 152)
                      ])),
                  padding: const EdgeInsets.all(0),
                  child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
                  // Text(
                  //   "LOGIN",
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.bold
                  //   ),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Sign In')),
    //   body: ListView(
    //     padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
    //     children: [
    //       const Text('Sign in via the magic link with your email below'),
    //       const SizedBox(height: 18),
    //       TextFormField(
    //         controller: _emailController,
    //         decoration: const InputDecoration(labelText: 'Email'),
    //       ),
    //       const SizedBox(height: 18),
    //       ElevatedButton(
    //         onPressed: _isLoading ? null : _signIn,
    //         child: Text(_isLoading ? 'Loading' : 'Send Magic Link'),
    //       ),
    //     ],
    //   ),
    // );
  }
}
