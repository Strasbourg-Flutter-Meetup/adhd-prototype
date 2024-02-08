// Project: adhd-prototype
// Author: Daniel Krentzlin
// Dev Environment: Android Studio
// Platform: Windows 11
// Copyright:  2024
// ID: 20240208061354
// 08/02/2024 06:13

import 'package:adhd_prototype/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/dependency_injection/injections.dart';
import '../../../../shared/isar_db/models/notebook.dart';
import '../blocs/add_notebook_modal_bloc.dart';
import '../blocs/add_notebook_modal_events.dart';

class AddNotebookModal extends StatelessWidget {
  const AddNotebookModal({
    super.key,
    required this.notebooks,
  });

  final List<Notebook> notebooks;

  @override
  Widget build(BuildContext context) => BlocProvider<AddNotebookModalBloc>(
    create: (context) => getIt.get<AddNotebookModalBloc>()
      ..add(AddNotebookModalInitial(notebooks: notebooks)),
    child: _AddNotebookModalContent(notebooks: notebooks),
  );
}

class _AddNotebookModalContent extends StatefulWidget {
  const _AddNotebookModalContent({
    required this.notebooks,
  });

  final List<Notebook> notebooks;

  @override
  State<_AddNotebookModalContent> createState() =>
      _AddNotebookModalContentState();
}

class _AddNotebookModalContentState extends State<_AddNotebookModalContent> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Form(
    key: _formKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocalizations?.dashboardModalTitle ?? 'Add notebook',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return context
                  .appLocalizations?.dashboardModalValidatorText ??
                  'Please enter a notebook name';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText:
            context.appLocalizations?.dashboardModalTextFieldHint ??
                'Notebook name',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AddNotebookModalBloc>().add(
                      AddNotebook(
                        notebookName: _controller.text,
                      ),
                    );
                    Navigator.of(context).pop();
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(content: Text('Processing Data')),
                    //);
                  }
                },
                child: Text(
                    context.appLocalizations?.dashboardModalButtonAdd ??
                        'Add'),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
