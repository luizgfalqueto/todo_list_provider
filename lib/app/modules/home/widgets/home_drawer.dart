import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/auth/auth_provider.dart';
import 'package:todo_list_provider/app/core/ui/messages.dart';
import 'package:todo_list_provider/app/core/ui/them_extensions.dart';
import 'package:todo_list_provider/app/modules/home/home_controller.dart';
import 'package:todo_list_provider/app/services/user/user_service.dart';

class HomeDrawer extends StatefulWidget {

  HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final nameVN = ValueNotifier<String>('');
  final _nameEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    nameVN.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _nameEC.text = context.read<AuthProvider>().user?.displayName ?? '';
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.user?.photoURL ??
                        'https://t4.ftcdn.net/jpg/05/09/59/75/360_F_509597532_RKUuYsERhODmkxkZd82pSHnFtDAtgbzJ.jpg';
                  },
                  builder: (_, value, __) {
                    return CircleAvatar(
                      backgroundImage: NetworkImage(value),
                      radius: 30,
                    );
                  },
                ),
                Selector<AuthProvider, String>(
                  selector: (context, authProvider) {
                    return authProvider.user?.displayName ?? 'Não informado';
                  },
                  builder: (_, value, __) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          value,
                          style: context.textTheme.titleSmall,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: const Text('Alterar nome'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Alterar nome'),
                    content: TextField(
                      controller: _nameEC,
                      onChanged: (value) => nameVN.value = value,
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var value = nameVN.value;
                          if (value.isEmpty) {
                            Messages.of(context).showError('Nome Obrigatório');
                          } else {
                            var of = Navigator.of(context);
                            await context
                                .read<UserService>()
                                .updateDisplayName(value);
                            of.pop();
                          }
                        },
                        child: const Text('Alterar'),
                      )
                    ],
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Sair'),
            onTap: () async {
              await context.read<HomeController>().deleteAllTask();
              await context.read<AuthProvider>().logout();
            },
          )
        ],
      ),
    );
  }
}
