// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thecodyapp/chatApp/common/utils/colors.dart';
import 'package:thecodyapp/chatApp/features/status/controller/status_controller.dart';

class ConfirmStatusScreen extends ConsumerWidget {
  static const String routeName = '/ConfirmStatusScreen';
  final File file;
  const ConfirmStatusScreen({
    Key? key,
    required this.file,
  }) : super(key: key);

  void addStatus(WidgetRef ref, BuildContext context) {
    ref.read(statusControllerProvider).addStatus(file, context);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: Image.file(file),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addStatus(ref, context),
        backgroundColor: tabColor,
        child: const Icon(
          Icons.done,
          color: tabLabelColor,
        ),
      ),
    );
  }
}