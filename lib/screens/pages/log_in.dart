import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late TextEditingController _userNameController;

  late TextEditingController _passwordController;

  final _formKey01 = GlobalKey<FormState>();
  final _formKey02 = GlobalKey<FormState>();

  bool _isLoading01 = false;
  bool _isLoading02 = false;
  bool _loadingError = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("LogIn/Register"),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              text: "Loog In",
            ),
            Tab(
              text: "Register",
            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: [
          (_isLoading01) ? _drawLoading() : _logIn(),
          (_isLoading02) ? _drawLoading() : _register(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget _logIn() {
    if (_loadingError) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("There was Error!!!"),
          SizedBox(
            height: 8,
          ),
          SizedBox(
            width: 120,
            height: 40,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade800),
              ),
              onPressed: () {
                setState(() {
                  _loadingError = false;
                });
              },
              child: Text(
                'Try Again',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Form(
            key: _formKey01,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your UserName";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 48,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Your Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 48,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade800),
                    ),
                    onPressed: () {
                      if (_formKey01.currentState!.validate()) {
                        // todo: call Api for login

                        setState(() {
                          _isLoading01 = true;
                          Timer(Duration(seconds: 3), () {
                            setState(() {
                              _isLoading01 = false;
                              if (((_userNameController.text == "fares") ||
                                      (_userNameController.text ==
                                          "Scarlet Knight")) &&
                                  (_passwordController.text == "12345")) {
                                Navigator.pop(context);
                                Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(),),);
                              }else {
                                _loadingError = true;
                              }
                            });
                          });
                        });

                        _loggedIn();
                      } else {
                        _isLoading01 = false;
                      }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _register() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Form(
          key: _formKey02,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nike Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Nike Name";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'UserName',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your UserName";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Email";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Confirm Your Password";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 48,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red.shade800),
                  ),
                  onPressed: () {
                    if (_formKey02.currentState!.validate()) {
                      // todo: call Api for login

                      setState(() {
                        _isLoading02 = true;
                      });

                      _loggedIn();
                    } else {
                      _isLoading02 = false;
                    }
                  },
                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawLoading() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> _loggedIn() async {
    SharedPreferences sharedPreferences_LoggedIn =
        await SharedPreferences.getInstance();
    sharedPreferences_LoggedIn.setBool("isLoggedIn", true);
  }
}
