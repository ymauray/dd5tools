import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'username',
                      decoration: const InputDecoration(
                        labelText: 'Username',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    FormBuilderTextField(
                      name: 'password',
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                      validator: FormBuilderValidators.required(),
                    ),
                    FormBuilderTextField(
                      keyboardType: TextInputType.emailAddress,
                      name: 'email',
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint("validation failed !!");
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
