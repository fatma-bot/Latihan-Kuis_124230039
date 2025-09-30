import 'package:flutter/material.dart';
import 'package:latiankuis/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  bool isloginsuccess = false;
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_usernamefield(), _passwordfield(), _loginbutton()],
      ),
    );
  }

  Widget _usernamefield() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        controller: usernameC,
        decoration: InputDecoration(
          labelText: 'Username',
          hintStyle: TextStyle(color: Colors.white),
          fillColor: const Color.fromARGB(255, 125, 3, 44),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }

  Widget _passwordfield() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: _obscure,
        controller: passwordC,
        decoration: InputDecoration(
          labelText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          fillColor: const Color.fromARGB(255, 125, 3, 44),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
            tooltip: _obscure ? 'Tampilkan password' : 'sembunyikan password',
          ),
        ),
      ),
    );
  }

  Widget _loginbutton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          login();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        child: Text(
          'Login',
          style: TextStyle(
            color: const Color.fromARGB(255, 125, 3, 44),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void login() {
    String text = "", username, password;
    username = usernameC.text;
    password = passwordC.text;

    if (username == "user" && password == "123") {
      setState(() {
        text = "Login Berhasil";
        isloginsuccess = true;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      setState(() {
        text = "Login Gagal";
        isloginsuccess = false;
      });
    }
    SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: isloginsuccess ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
