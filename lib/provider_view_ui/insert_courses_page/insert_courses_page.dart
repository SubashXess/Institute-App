// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:institute_app/components/custom_circular_indicator.dart';
import 'package:institute_app/components/files_picker.dart';
import 'package:institute_app/widgets/custom_radio_button.dart';
import 'package:institute_app/widgets/picking_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/widgets/rounded_button.dart';
import 'package:institute_app/widgets/textform_widget.dart';

class InsertCoursesPage extends StatefulWidget {
  const InsertCoursesPage({super.key});

  @override
  State<InsertCoursesPage> createState() => _InsertCoursesPageState();
}

class _InsertCoursesPageState extends State<InsertCoursesPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _courseNameController;
  late TextEditingController _courseTitleController;
  late TextEditingController _subtitleController;
  late TextEditingController _descController;

  late FocusNode _courseNameNode;
  late FocusNode _courseTitleNode;
  late FocusNode _subtitleNode;
  late FocusNode _descNode;

  bool autovalidateMode = false;
  File? image;
  bool isLoading = false;
  String? _groupValue;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController()..addListener(onListen);
    _courseTitleController = TextEditingController()..addListener(onListen);
    _subtitleController = TextEditingController()..addListener(onListen);
    _descController = TextEditingController()..addListener(onListen);
    _courseNameNode = FocusNode()..addListener(onListen);
    _courseTitleNode = FocusNode()..addListener(onListen);
    _subtitleNode = FocusNode()..addListener(onListen);
    _descNode = FocusNode()..addListener(onListen);
  }

  @override
  void dispose() {
    super.dispose();
    _courseNameController.dispose();
    _courseNameController.removeListener(onListen);
    _courseTitleController.dispose();
    _courseTitleController.removeListener(onListen);
    _subtitleController.dispose();
    _subtitleController.removeListener(onListen);
    _descController.dispose();
    _descController.removeListener(onListen);
    _courseNameNode.dispose();
    _courseTitleNode.dispose();
    _subtitleNode.dispose();
    _descNode.dispose();
  }

  void onListen() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print('load');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(),
          ),
          SliverToBoxAdapter(
            child: SafeArea(
              child: Container(
                width: size.width,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.24,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: AppContainerTheme.appContainerDefaultTheme,
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            width: size.width,
                            child: image != null
                                ? Image.file(image!, fit: BoxFit.cover)
                                : Image.network(
                                    'https://learning.oilab.in/public/img/python-course-in-jodhpur.png',
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          Positioned(
                            right: 16.0,
                            top: 16.0,
                            child: InkWell(
                              onTap: () => pickImageBottomSheet(
                                context,
                                onTapCamera: () async {
                                  Navigator.pop(context);
                                  image = await ImagePickService.pickImage(
                                      ImageSource.camera, context);
                                  setState(() {});
                                },
                                onTapGallery: () async {
                                  Navigator.pop(context);
                                  image = await ImagePickService.pickImage(
                                      ImageSource.gallery, context);
                                  setState(() {});
                                },
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.shade300),
                                child: Icon(
                                  Icons.photo_rounded,
                                  size: AppIconDimensions.appIconMediumSize,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormWidget2(
                              header: 'Course Name',
                              hint: 'Add course name',
                              controller: _courseNameController,
                              node: _courseNameNode,
                              maxLength: 100,
                              counterText: _courseNameController.text.isEmpty
                                  ? ''
                                  : _courseNameNode.hasFocus
                                      ? null
                                      : '',
                              autovalidateMode: autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              fillColor:
                                  AppContainerTheme.appContainerDefaultTheme,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Course name is required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormWidget2(
                              header: 'Course Title',
                              hint: 'Add a title that describes your course',
                              controller: _courseTitleController,
                              node: _courseTitleNode,
                              maxLength: 100,
                              counterText: _courseTitleController.text.isEmpty
                                  ? ''
                                  : _courseTitleNode.hasFocus
                                      ? null
                                      : '',
                              autovalidateMode: autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              fillColor:
                                  AppContainerTheme.appContainerDefaultTheme,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Course title is required';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16.0),
                            TextFormWidget2(
                              header: 'Subtitle',
                              hint: 'Subtitle',
                              controller: _subtitleController,
                              node: _subtitleNode,
                              maxLength: 400,
                              counterText: _subtitleController.text.isEmpty
                                  ? ''
                                  : _subtitleNode.hasFocus
                                      ? null
                                      : '',
                              autovalidateMode: autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              fillColor:
                                  AppContainerTheme.appContainerDefaultTheme,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 16.0),
                            TextFormWidget2(
                              header: 'Description',
                              hint: 'More about your course',
                              controller: _descController,
                              node: _descNode,
                              maxLength: 5000,
                              maxLines: 10,
                              minLines: 6,
                              counterText: _descController.text.isEmpty
                                  ? ''
                                  : _descNode.hasFocus
                                      ? null
                                      : '',
                              keyboardType: TextInputType.multiline,
                              autovalidateMode: autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              fillColor:
                                  AppContainerTheme.appContainerDefaultTheme,
                              textInputAction: TextInputAction.newline,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Description is required';
                                } else if (value.length < 20) {
                                  return 'Please describe your course';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16.0),
                            Text(
                              'Audience',
                              style: AppTextStyle.h3TextStyle(
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 10.0),
                            Text(
                              'You\'re required to tell us whether your course are made for kids.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade400,
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
          ),
        ],
      )),
    );
  }
}
