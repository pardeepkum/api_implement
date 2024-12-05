import 'dart:io';
import 'package:flutter/material.dart';

class ProfilePicWidget extends StatelessWidget {
  final double picSize;
  final String? profileImage;
  final String userName;
  final String subInfo;
  final Function()? onCameraTap;
  final Function()? onGalleryTap;
  final Function()? onPicTap;
  final Function()? onEditTap;
  final bool showEditIcon;
  final bool showOnlyPhoto;
  final bool showBgCurves;
  final bool showCameraIconOnCorner;
  final bool isEditIcon;

  const ProfilePicWidget({
    super.key,
    this.picSize = 100,
    this.profileImage,
    required this.userName,
    this.subInfo = "",
    this.onCameraTap,
    this.onGalleryTap,
    this.onPicTap,
    this.onEditTap,
    this.showEditIcon = true,
    this.showOnlyPhoto = false,
    required String heroTag,
    required String firstName,
    required String lastName,
    this.showBgCurves = true,
    this.showCameraIconOnCorner = true,
    this.isEditIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: onPicTap,
              child: CircleAvatar(
                radius: picSize / 2,
                backgroundImage: profileImage != null
                    ? (profileImage!.startsWith('http')
                        ? NetworkImage(profileImage!)
                        : FileImage(File(profileImage!))) as ImageProvider
                    : null,
                child: profileImage == null
                    ? Icon(
                        Icons.person,
                        size: picSize / 2,
                        color: Colors.grey.shade400,
                      )
                    : null,
              ),
            ),
            if (showEditIcon)
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => _showImagePickerOptions(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
          ],
        ),
        if (!showOnlyPhoto) ...[
          const SizedBox(height: 16),
          Text(userName,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (subInfo.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(subInfo,
                  style: const TextStyle(fontSize: 14, color: Colors.grey)),
            ),
        ],
      ],
    );
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  if (onCameraTap != null) onCameraTap!();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  if (onGalleryTap != null) onGalleryTap!();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
