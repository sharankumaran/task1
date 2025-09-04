import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:task1/bloc/auth_bloc.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _formkey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('REGISTER PAGE')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            context.go("/");
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(25.0),
            child: FormBuilder(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'name',
                      prefixIcon: Icon(Icons.person_4),
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'email',
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'password',
                      prefixIcon: Icon(Icons.password),
                    ),
                    validator: FormBuilderValidators.required(),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.saveAndValidate()) {
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
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        backgroundColor: Colors.blue,
                      ),
                      child: Text('REGISTER'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
