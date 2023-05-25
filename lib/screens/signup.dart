import 'package:flutter/material.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/screens/login.dart';

class UserType {
  final String name;

  UserType(this.name);

  static List<UserType> get values => [admin, doctor, patient];

  static final UserType admin = UserType('Admin');
  static final UserType doctor = UserType('Doctor');
  static final UserType patient = UserType('Patient');

  @override
  String toString() => name;
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  UserType _userType = UserType.patient;
  late String _name = '';
  late String _address = '';
  late String _phoneNumber = '';
  late String _email = '';
  late String _city = '';
  late String _qualifications = '';
  late String _experience = '';
  late String _specialty = '';
  late String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<UserType>(
                  value: _userType,
                  onChanged: (value) {
                    setState(() {
                      _userType = value!;
                    });
                  },
                  items: UserType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name),
                        ),
                      )
                      .toList(),
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'User Type'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _address = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                if (_userType == UserType.patient)
                  TextFormField(
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 44, 199, 226)),
                        ),
                        labelText: 'City'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your city';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _city = value!;
                    },
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (_userType == UserType.doctor)
                  Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 44, 199, 226)),
                            ),
                            labelText: 'Qualifications'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your qualifications';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _qualifications = value!;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 44, 199, 226)),
                            ),
                            labelText: 'Experience'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your experience';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _experience = value!;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 44, 199, 226)),
                            ),
                            labelText: 'Specialty'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your specialty';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _specialty = value!;
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 3, color: Color.fromARGB(255, 44, 199, 226)),
                      ),
                      labelText: 'Password'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      MyApp.storedEmail = _email;
                      MyApp.storedPassword = _password;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    }
                  },
                  child: Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
