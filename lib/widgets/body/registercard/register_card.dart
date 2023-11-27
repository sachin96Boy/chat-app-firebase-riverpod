import 'package:flutter/material.dart';

class RegisterCard extends StatefulWidget {
  const RegisterCard({super.key});

  @override
  State<RegisterCard> createState() => _RegisterCardState();
}

class _RegisterCardState extends State<RegisterCard> {
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _paswordController = TextEditingController();

  final _nameFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmpasswordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _paswordController.dispose();
    _nameController.dispose();
    _confirmpasswordFocusNode.dispose();
  }

  void handleSubmit(String name, String email, String password) {
    final validate = _formKey.currentState!.validate();

    if (!validate) {
      return;
    }
    print(name);
    print(email);
    print(password);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      labelText: 'Your name',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.green),
                      hintText: 'Enter your Name'),
                  focusNode: _nameFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_emailFocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please Enter a name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: 'Your Email',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.green),
                      hintText: 'Enter your Email'),
                  focusNode: _emailFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'please Enter a valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _paswordController,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.green),
                      hintText: 'Enter your Password'),
                  obscureText: true,
                  focusNode: _passwordFocusNode,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    // handleSubmit(
                    //     _emailController.text, _paswordController.text);
                    FocusScope.of(context)
                        .requestFocus(_confirmpasswordFocusNode);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please Enter a valid password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(fontSize: 16, color: Colors.green),
                      hintText: 'Confirm Password'),
                  obscureText: true,
                  focusNode: _confirmpasswordFocusNode,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    handleSubmit(_nameController.text, _emailController.text,
                        _paswordController.text);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please Enter a valid password';
                    }
                    if (value != _paswordController.text) {
                      return 'Inavlid Password, please check again';
                    }
                    return null;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade100,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.3, vertical: 10),
                    ),
                    onPressed: () => handleSubmit(_nameController.text,
                        _emailController.text, _paswordController.text),
                    child: Text(
                      'Create an account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
