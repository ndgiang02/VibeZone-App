import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vibezone/core/common/translations/l10n.dart';

/// What the user picked in the profile picture sheet.
sealed class AvatarAction {}

class AvatarPicked extends AvatarAction {
  final String path;

  AvatarPicked(this.path);
}

class AvatarRemoved extends AvatarAction {}

/// Lets the user take or choose a picture, or remove the current one.
/// Resolves to `null` when dismissed.
Future<AvatarAction?> showAvatarSheet(
  BuildContext context, {
  required bool hasAvatar,
}) async {
  final s = S.of(context);
  final choice = await showModalBottomSheet<Object>(
    context: context,
    useRootNavigator: true,
    showDragHandle: true,
    builder: (ctx) => SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library_outlined),
            title: Text(s.btn_choose_photo),
            onTap: () => Navigator.pop(ctx, ImageSource.gallery),
          ),
          ListTile(
            leading: const Icon(Icons.photo_camera_outlined),
            title: Text(s.btn_take_photo),
            onTap: () => Navigator.pop(ctx, ImageSource.camera),
          ),
          if (hasAvatar)
            ListTile(
              leading: Icon(
                Icons.delete_outline_rounded,
                color: Theme.of(ctx).colorScheme.error,
              ),
              title: Text(
                s.btn_remove_photo,
                style: TextStyle(color: Theme.of(ctx).colorScheme.error),
              ),
              onTap: () => Navigator.pop(ctx, false),
            ),
          const SizedBox(height: 8),
        ],
      ),
    ),
  );
  if (choice == false) return AvatarRemoved();
  if (choice is! ImageSource) return null;

  // The server crops to a square and needs ≥ 200×200 px.
  final image = await ImagePicker().pickImage(
    source: choice,
    maxWidth: 1600,
    maxHeight: 1600,
    imageQuality: 90,
  );
  return image == null ? null : AvatarPicked(image.path);
}
