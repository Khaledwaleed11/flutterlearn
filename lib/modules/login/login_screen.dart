import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  var formKey=GlobalKey<FormState>();
  bool ispassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Login Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),

          ),



          elevation: 0,
          backgroundColor: Colors.purple,
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.account_balance_sharp))
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Form(
                key:formKey ,
                child: Column(
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      onChanged: (String value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return'Email must not be empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.email_rounded),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      onFieldSubmitted: (value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      onChanged: (String value) {
                        if (kDebugMode) {
                          print(value);
                        }
                      },
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return'password must not be empty';
                        }
                        return null;
                      },
                      decoration:  InputDecoration(
                        border:  const OutlineInputBorder(),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: ()
                          {
                            setState(()
                            {
                              ispassword = !ispassword;
                            }
                            );
                          },
                          icon: ispassword ? const Icon(Icons.visibility) : const Icon(Icons.visibility_off),
                      ),
                    ),

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      color: Colors.purple,
                      child: MaterialButton(
                        onPressed: () {
                          if(formKey.currentState!.validate())
                          {
                            if (kDebugMode) {
                              print(emailcontroller.text);
                            }
                            if (kDebugMode) {
                              print(passwordcontroller.text);
                            }
                          }
                        },

                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do not have an account?"),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Register Now!",
                              style: TextStyle(
                                color: Colors.purple,
                              ),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}