import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

import 'new_character_dialog.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          context.t('Characters'),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.add),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => CupertinoCharacterCreationDialog(),
            );
          },
        ),
      ),
      child: Center(
        child: Text(
          context.t('No characters yet'),
        ),
      ),
    );
    //return Scaffold(
    //  appBar: AppBar(
    //    title: Text(
    //      context.t('Characters'),
    //    ),
    //    centerTitle: true,
    //    actions: [
    //      IconButton(
    //        icon: const Icon(Icons.add),
    //        onPressed: () {
    //          showDialog(
    //            context: context,
    //            builder: (context) {
    //              return NewCharacterDialog.build(context);
    //            },
    //          );
    //        },
    //      ),
    //    ],
    //  ),
    //  body: PaperContainer(
    //    child: Center(
    //      child: ElevatedButton(
    //        onPressed: () {
    //          Navigator.of(context).push(
    //            MaterialPageRoute(
    //              builder: (context) => const SomeDialog(),
    //            ),
    //          );
    //        },
    //        child: const Text('DD5 Tools'),
    //      ),
    //    ),
    //  ),
    //);
  }
}

class SomeDialog extends StatelessWidget {
  const SomeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Some dialog'),
      ),
    );
  }
}
