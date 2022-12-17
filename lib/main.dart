import 'package:database/model/user_model.dart';
import 'package:database/service/userdatabase_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Home_());
}

class Home_ extends StatefulWidget {
  const Home_({super.key});

  @override
  State<Home_> createState() => _Home_State();
}

class _Home_State extends State<Home_> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                    future: userdatbasehelper.getUsers(),
                    builder: (ctx, snapsot) {
                      if (snapsot.connectionState == ConnectionState.done) ;
                      {
                        if (snapsot.data!.isNotEmpty) ;
                        {
                          _userNameController.text = snapsot.data![0].username;
                          _emailController.text = snapsot.data![0].email;
                          _passwordController.text = snapsot.data![0].password;
                          _currentUser = snapsot.data![0];
                        }
                        return Column(
                          children: [
                            username(),
                            SizedBox(height: 10),
                            email(),
                            SizedBox(height: 10),
                            password(),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(flex: 1, child: _createUser()),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(flex: 1, child: _updateUser()),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(flex: 1, child: _deleteUser()),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    })
              ],
            )),
      ),
    );
  }

  Widget username() => TextFormField(
        controller: _userNameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      );
  Widget email() => TextFormField(
        controller: _userNameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      );
  Widget password() => TextFormField(
        controller: _userNameController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Username',
        ),
      );
  Widget _createUser() => MaterialButton(
        onPressed: () async {
          UserModel user = UserModel(
              id: 1,
              email: _emailController.text,
              password: _passwordController.text,
              username: _userNameController.text);
          await userdatbasehelper.createUser(user);
          setState(() {});
        },
        color: Colors.amber,
        height: 50,
        child: const Text(
          'create',
          style: TextStyle(color: Colors.white),
        ),
      );
  Widget _updateUser() => MaterialButton(
        onPressed: () async {
          UserModel user = UserModel(
              id: 1,
              email: _emailController.text,
              password: _passwordController.text,
              username: _userNameController.text);
          await userdatbasehelper.updateUser(_currentUser);
          setState(() {});
        },
        color: Colors.amber,
        height: 50,
        child: const Text(
          'create',
          style: TextStyle(color: Colors.white),
        ),
      );
  Widget _deleteUser() => MaterialButton(
        onPressed: () async {
          UserModel user = UserModel(
              id: 1,
              email: _emailController.text,
              password: _passwordController.text,
              username: _userNameController.text);
          await userdatbasehelper.deleteUser(_currentUser.id);
          setState(() {});
        },
        color: Colors.red,
        height: 50,
        child: const Text(
          'Delete',
          style: TextStyle(color: Colors.white),
        ),
      );
}
