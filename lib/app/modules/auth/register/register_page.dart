import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_provider/app/core/ui/them_extensions.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_field.dart';
import 'package:todo_list_provider/app/core/widget/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          onPressed: () => Navigator.pop(context),
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
                child: Column(
              children: [
                TodoListField(label: 'E-mail'),
                const SizedBox(
                  height: 20,
                ),
                TodoListField(
                  label: 'Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TodoListField(
                  label: 'Confirma Senha',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {},
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
