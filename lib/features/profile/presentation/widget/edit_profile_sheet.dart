import 'package:flutter/material.dart';
import 'package:vibezone/core/common/translations/l10n.dart';
import 'package:vibezone/core/common/widgets/custom_textfield.dart';
import 'package:vibezone/core/common/widgets/primary_button.dart';

/// Resolves to the new display name, or `null` when dismissed.
Future<String?> showEditProfileSheet(
  BuildContext context, {
  required String displayName,
}) {
  return showModalBottomSheet<String>(
    context: context,
    useRootNavigator: true,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => _EditProfileSheet(displayName: displayName),
  );
}

class _EditProfileSheet extends StatefulWidget {
  final String displayName;

  const _EditProfileSheet({required this.displayName});

  @override
  State<_EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<_EditProfileSheet> {
  late final _name = TextEditingController(text: widget.displayName);
  String? _error;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  void _save() {
    final name = _name.text.trim();
    if (name.isEmpty) {
      setState(() => _error = S.of(context).err_name_required);
      return;
    }
    Navigator.pop(context, name);
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        0,
        20,
        MediaQuery.viewInsetsOf(context).bottom + 20,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s.title_edit_profile,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              ctr: _name,
              hintText: s.hint_display_name,
              error: _error,
              maxLength: 50,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              prefixWidget: const Icon(Icons.person_outline_rounded),
              onChanged: (_) {
                if (_error != null) setState(() => _error = null);
              },
            ),
            const SizedBox(height: 20),
            PrimaryButton(text: s.btn_update, onPressed: _save),
          ],
        ),
      ),
    );
  }
}
