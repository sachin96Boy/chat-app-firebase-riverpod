import 'package:flutter/material.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({
    super.key,
  });

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  final _emailController = TextEditingController();
  final _paswordController = TextEditingController();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _paswordController.dispose();
  }

  void handleSubmit(String email, String password) {
    final validate = _formKey.currentState!.validate();

    if (!validate) {
      return;
    }
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
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) {
                    handleSubmit(
                        _emailController.text, _paswordController.text);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please Enter a valid password';
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
                    onPressed: () => handleSubmit(
                        _emailController.text, _paswordController.text),
                    child: Text(
                      'Log in',
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
