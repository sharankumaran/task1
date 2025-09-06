import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task1/bloc/auth_bloc.dart';
import 'package:task1/pages/colors.dart';
import 'package:task1/pages/curved_edges.dart';
import 'package:task1/pages/header_design.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go("/home");
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  clipper: CurvedEdges(),
                  child: Container(
                    height: 380,
                    width: 600,
                    child: HEADER_DESIGN(size: size),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 7),
                    Text(
                      'Your journey is finally here',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
                          FormBuilder(
                            key: _formkey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              children: [
                                FormBuilderTextField(
                                  //validatorsssssssssssssssss
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      errorText:
                                          'Enter username or Valid Email',
                                    ),
                                  ]),
                                  name: 'email',
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    hintText: 'Username or email',
                                    filled: true,
                                    fillColor: isdark ? kDarkCard : kLightcard,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 16,
                                    ),
                                    focusColor: Color(0xFFE0EAE4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                FormBuilderTextField(
                                  // validatorsssssssssssss
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(
                                      errorText: 'Password is Required',
                                    ),
                                    FormBuilderValidators.minLength(
                                      6,
                                      errorText: 'At Least 6 Characters',
                                    ),
                                    FormBuilderValidators.maxLength(
                                      15,
                                      errorText: 'Max 15 Characters',
                                    ),
                                    (value) {
                                      if (value == null || value.isEmpty)
                                        return null;

                                      final regex = RegExp(
                                        r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$&*-]).+$',
                                      );
                                      if (!regex.hasMatch(value)) {
                                        return 'Must Contain 1 Upperacase 1 number & 1 special Character';
                                      }
                                      return null;
                                    },
                                  ]),
                                  name: 'password',
                                  textDirection: TextDirection.ltr,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Iconsax.eye_slash),
                                    hintText: 'Enter your password',
                                    filled: true,
                                    fillColor: isdark ? kDarkCard : kLightcard,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 14,
                                      horizontal: 16,
                                    ),
                                    focusColor: Color(0xFFE0EAE4),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 113, 48),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(
                                  255,
                                  33,
                                  131,
                                  38,
                                ),
                              ),
                              onPressed: () {
                                if (_formkey.currentState!.saveAndValidate()) {
                                  final data = _formkey.currentState!.value;
                                  context.read<AuthBloc>().add(
                                    AuthLoginRequested(
                                      email: data['email'] ?? '',
                                      password: data['password'] ?? '',
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Dont have account?',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                              ),

                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Create one!',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 113, 48),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
