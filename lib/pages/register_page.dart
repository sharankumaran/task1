import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:task1/bloc/auth_bloc.dart';
import 'package:task1/pages/curved_edges.dart';
import 'package:task1/pages/header_design.dart';
import 'package:task1/pages/terms_and_conditions.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go("/login");
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
                    height: 250,
                    width: 500,
                    padding: EdgeInsets.all(0),
                    child: Stack(children: [HEADER_DESIGN(size: size)]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Create Your Account',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 33, 131, 38),
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'create your account to start your journey',
                        style: TextStyle(color: Colors.blueGrey.shade200),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: FormBuilder(
                          key: _formkey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 7,
                                ),
                                child: Text(
                                  'Full Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              FormBuilderTextField(
                                //validatoresssssssssssssssssssssssssssssssss
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Name is Required',
                                  ),
                                  FormBuilderValidators.minLength(
                                    4,
                                    errorText: 'Atleast 3 Characters',
                                  ),
                                ]),
                                name: 'full name',
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  hintText: 'Enter your full name',
                                  filled: true,
                                  fillColor: Color(0xFFE0EAE4),
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
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 9),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              FormBuilderTextField(
                                //email validatorrrrrrrrrrrrrrrrrr
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Email is Required',
                                  ),
                                  FormBuilderValidators.email(
                                    errorText: 'Enter a valid email',
                                  ),
                                ]),
                                keyboardType: TextInputType.emailAddress,
                                name: 'email',
                                textDirection: TextDirection.ltr,
                                decoration: InputDecoration(
                                  hintText: 'Enter your email address',
                                  filled: true,
                                  fillColor: Color(0xFFE0EAE4),
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
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 9),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              SizedBox(height: 6),
                              FormBuilderTextField(
                                //validatorsssssssssssssssssssssss
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
                                  hintText: 'Enter your password',
                                  filled: true,
                                  fillColor: Color(0xFFE0EAE4),
                                  suffixIcon: Icon(Iconsax.eye_slash),
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
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              //terms adn conditionsssssssssssssssssssss
                              terms_and_conditions(),
                              SizedBox(height: 8),
                              //button-------------------
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
                                    if (_formkey.currentState!
                                        .saveAndValidate()) {
                                      final data = _formkey.currentState!.value;
                                      context.read<AuthBloc>().add(
                                        AuthRegisterRequest(
                                          name: data['name'] ?? '',
                                          email: data['email'] ?? '',
                                          password: data['password'] ?? '',
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Sign UP',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(height: 2),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have account?',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign In',
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
