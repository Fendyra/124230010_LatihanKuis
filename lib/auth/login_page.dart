import 'package:flutter/material.dart';
import 'package:latihan_kuis/page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
  {
    String username = "";
    String password = "";
    bool _obscurePassword = true;
    bool isLoginSuccess = false;

    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              _usernameField(),
              _passwordField(),
              _handleLoginButton(),
            ],
          ),
      ),
    );
    }

    Widget _usernameField() {
      return Container(
        margin: EdgeInsets.all(12),
        child: TextField(
          onChanged: (value) {
            setState(() {
              username = value;
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: username,
            labelText: 'Username',
            contentPadding: EdgeInsets.all(8.0),
            prefixIcon: Icon(Icons.person_outline),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: const Color.fromARGB(255, 189, 189, 189)),
            ),
          ),
        ),
      );
    }

    Widget _passwordField() {
      return Container(
        margin: EdgeInsets.all(12),
        child: TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: _obscurePassword,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: const Color.fromARGB(255, 189, 189, 189)),
            ),
            prefixIcon: const Icon(Icons.lock_outline),
            labelText: "Password",
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: Icon(
                _obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
            ),
          ),
        ),
      );
    }


    Widget _handleLoginButton() {
      return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: const Color.fromARGB(255, 199, 0, 0),),
        onPressed: () {
          String text = "";
          if (username == "fulan" && password == "fulan") {
            setState(() {
              text = "Login Sukses";
              isLoginSuccess = true;
            });
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context){
              return HomePage(username: username,);
            }));
          } else {
            setState(() {
              text = "Login Gagal";
              isLoginSuccess = false;
            });
          }

          final snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}

