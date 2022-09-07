import 'package:course/modules/shop_app/shop_login_screen/cupit/cupit.dart';
import 'package:course/modules/shop_app/shop_login_screen/cupit/states.dart';
import 'package:course/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:course/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginScreen extends StatelessWidget {
  const ShopLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'login now to browse our hot offers',
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email Address',
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passwordController,
                          obscureText: ShopLoginCubit.get(context).isPasswordShow,
                          keyboardType: TextInputType.visiblePassword,
                          onFieldSubmitted: (value)
                          {
                            if(formKey.currentState!.validate())
                            {
                              ShopLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter your password';
                            }
                          },
                          decoration:  InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                              onTap: ()
                              {
                                ;
                                ShopLoginCubit.get(context).ChangePasswordVisibility();
                              },
                                child: Icon(ShopLoginCubit.get(context).suffix)),

                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         state is! ShopLoginLoadingState ?


                            Container(
                              width: double.infinity,
                              color: Colors.blue,
                              child: MaterialButton(
                                onPressed: () {
                                  if(formKey.currentState!.validate())
                                  {
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                                child: const Text(
                                  'LOGIN',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ) :

                 const Center(child: CircularProgressIndicator()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Do not have an account?'),
                              TextButton(
                                  onPressed: () {
                                    navigateTo(
                                        context, const ShopRegisterScreen());
                                  },
                                  child: const Text('Register Now!'))
                            ],
                          ),

                    ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
