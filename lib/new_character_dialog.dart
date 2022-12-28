import 'package:dd5tools/paper_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gettext_i18n/gettext_i18n.dart';

class NewCharacterDialog {
  NewCharacterDialog._();

  static Dialog? _instance;
  static final _formKey = GlobalKey<FormBuilderState>();

  static Dialog build(BuildContext context) {
    _instance = null;
    _instance ??= Dialog(
      child: PaperContainer(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.t('New character'),
                      style: Theme.of(context).primaryTextTheme.titleLarge,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    FormBuilderTextField(
                      name: 'name',
                      autofocus: true,
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: context.t('Name'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),
                    FormBuilderTextField(
                      name: 'description',
                      validator: FormBuilderValidators.required(),
                      decoration: InputDecoration(
                        labelText: context.t('Description'),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        context.t('Cancel'),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: Text(
                        context.t('Save'),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

    return _instance!;
  }
}

class CupertinoCharacterCreationDialog extends ConsumerWidget {
  CupertinoCharacterCreationDialog({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final p = StateProvider<bool>((_) => false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              context.t('Cancel'),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          middle: Text(
            context.t('New character'),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: ref.watch(p)
                ? () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      debugPrint(_formKey.currentState?.value.toString());
                    } else {
                      debugPrint(_formKey.currentState?.value.toString());
                      debugPrint('validation failed');
                    }
                  }
                : null,
            child: Text(
              context.t('Ok'),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Material(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        autofocus: true,
                        validator: FormBuilderValidators.required(),
                        decoration: InputDecoration(
                          labelText: context.t('Name'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                        textCapitalization: TextCapitalization.words,
                        onChanged: (value) => ref.read(p.notifier).state =
                            value?.isNotEmpty ?? false,
                      ),
                      FormBuilderTextField(
                        name: 'description',
                        validator: FormBuilderValidators.required(),
                        decoration: InputDecoration(
                          labelText: context.t('Description'),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
