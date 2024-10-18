import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/services/user_data.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  final String identifier;
  final String field;
  final Function(String channelName)? onSave;

  const SettingsDialog({
    required this.identifier,
    required this.field,
    super.key,
    this.onSave,
  });

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();
}

final _formKey = GlobalKey<FormState>();

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  final controller = TextEditingController();
  bool isValidate = true;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 0),
      title: Padding(
        padding: const EdgeInsets.only(left: 22, top: 8),
        child: Text(
          widget.identifier,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
      ),
      content: SizedBox(
        height: 70,
        child: Form(
          child: TextFormField(
            onChanged: (data) async {
              isValidate = await ref
                  .watch(userDataServiceProvider)
                  .validateUserDataUniqueness(data, widget.field);

              setState(() {});
            },
            key: _formKey,
            controller: controller,
            autovalidateMode: AutovalidateMode.always,
            validator: (username) =>
                isValidate ? null : '${widget.identifier} already taken',
            decoration: InputDecoration(
              suffixIcon: isValidate && controller.text.isNotEmpty
                  ? const Icon(Icons.verified_user_rounded)
                  : const Icon(Icons.cancel_rounded),
              suffixIconColor: isValidate && controller.text.isNotEmpty
                  ? Colors.green
                  : Colors.red,
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('CANCEL', style: TextStyle(color: Colors.black)),
        ),
        TextButton(
          onPressed: () {
            if (isValidate && controller.text.isNotEmpty) {
              widget.onSave!(controller.text);

              Navigator.pop(context);
            }
          },
          child: Text(
            'SAVE',
            style: TextStyle(
              color: isValidate && controller.text.isNotEmpty
                  ? Colors.green
                  : Colors.redAccent,
            ),
          ),
        ),
      ],
    );
  }
}
