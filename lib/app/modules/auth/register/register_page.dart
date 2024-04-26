import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/notifier/default_listener_notifier.dart';
import 'package:todo_list_provider/app/core/ui/them_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';
import 'package:todo_list_provider/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

import '../../../validators/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _passwordConfirmEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _passwordConfirmEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // context.read<RegisterController>().addListener(() {
    //   final controller = context.read<RegisterController>();
    //   var success = controller.success;
    //   var error = controller.error;
    //   if (success) {
    //     Navigator.of(context).pop();
    //   } else if (error != null && error.isNotEmpty) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(
    //         content: Text(error),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // });
    var defaulListener = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());
    defaulListener.listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        listenerInstance.dispose();
        Navigator.of(context).pushReplacementNamed('/login');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(
                fontSize: 12,
                color: context.primaryColor,
              ),
            ),
            Text(
              'Cadastro',
              style: TextStyle(
                fontSize: 17,
                color: context.primaryColor,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * .5,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: TodoListLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TodoListField(
                      label: 'E-mail',
                      controller: _emailEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email Obrigatório'),
                        Validatorless.email('Email inválido'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TodoListField(
                      label: 'Senha',
                      obscureText: true,
                      controller: _passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha Obrigatória'),
                        Validatorless.min(
                            6, 'A senha deve ter pelo menos 6 caracteres'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TodoListField(
                      label: 'Confirma Senha',
                      obscureText: true,
                      controller: _passwordConfirmEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Confirma Senha Obrigatória'),
                        Validators.compare(
                            _passwordEC, 'As senhas fornecidas não combinam'),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final email = _emailEC.text;
                            final password = _passwordEC.text;
                            context
                                .read<RegisterController>()
                                .registerUser(email, password);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Text('Salvar'),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
