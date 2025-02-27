import 'package:animasi/loginAnimation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Animation Tutorial',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  int statusClick = 0;
  late AnimationController animationControllerButton;

  @override
  void initState() {
    super.initState();
    animationControllerButton = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
  }

  @override
  void dispose() {
    animationControllerButton.dispose();
    super.dispose();
  }

  Future<void> _playAnimation() async {
    await animationControllerButton.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/w.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(162, 146, 199, 0.8),
                Color.fromRGBO(51, 51, 63, 0.9),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(top: 22.0, bottom: 30.0),
                    ),
                    onPressed: () {
                      // Tambahkan aksi ketika tombol ditekan
                    },
                    child: const Text(
                      "Don't have an account? Sign Up here",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  statusClick == 0
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              statusClick = 1;
                            });
                            _playAnimation();
                          },
                          child: SignIn(),
                        )
                      : StartAnimation(buttonController: animationControllerButton),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      height: 60.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.red[700],
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      child: const Text(
        "Sign In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
