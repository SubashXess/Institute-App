// ignore_for_file: avoid_print

import 'dart:io';
import 'package:institute_app/components/files_picker.dart';
import 'package:institute_app/providers/course_insert_provider.dart';
import 'package:institute_app/widgets/custom_radio_button.dart';
import 'package:institute_app/widgets/picking_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:institute_app/constants/dimensions.dart';
import 'package:institute_app/constants/textstyles.dart';
import 'package:institute_app/constants/themes.dart';
import 'package:institute_app/widgets/textform_widget.dart';
import 'package:provider/provider.dart';
import '../../constants/symbols.dart';
import '../../providers/radio_button_providers.dart';

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
  late TextEditingController _maxUserController;
  late TextEditingController _amountController;

  late FocusNode _courseNameNode;
  late FocusNode _courseTitleNode;
  late FocusNode _subtitleNode;
  late FocusNode _descNode;
  late FocusNode _maxUserNode;
  late FocusNode _amountNode;

  bool autovalidateMode = false;
  File? image;
  bool isLoading = false;
  int selectedValue = 0;

  @override
  void initState() {
    super.initState();
    _courseNameController = TextEditingController()..addListener(onListen);
    _courseTitleController = TextEditingController()..addListener(onListen);
    _subtitleController = TextEditingController()..addListener(onListen);
    _descController = TextEditingController()..addListener(onListen);
    _maxUserController = TextEditingController()..addListener(onListen);
    _amountController = TextEditingController()..addListener(onListen);
    _courseNameNode = FocusNode()..addListener(onListen);
    _courseTitleNode = FocusNode()..addListener(onListen);
    _subtitleNode = FocusNode()..addListener(onListen);
    _descNode = FocusNode()..addListener(onListen);
    _maxUserNode = FocusNode()..addListener(onListen);
    _amountNode = FocusNode()..addListener(onListen);
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
    _maxUserController.dispose();
    _maxUserController.removeListener(onListen);
    _amountController.dispose();
    _amountController.removeListener(onListen);
    _courseNameNode.dispose();
    _courseTitleNode.dispose();
    _subtitleNode.dispose();
    _descNode.dispose();
    _maxUserNode.dispose();
    _amountNode.dispose();
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
                        color: AppTextFieldTheme.appTextFieldTheme,
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
                              fillColor: AppTextFieldTheme.appTextFieldTheme,
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
                              fillColor: AppTextFieldTheme.appTextFieldTheme,
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
                              fillColor: AppTextFieldTheme.appTextFieldTheme,
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
                              fillColor: AppTextFieldTheme.appTextFieldTheme,
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
                              'You\'re required to tell us whether your course are visible for kids or students.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Consumer<RadioButtonProviders>(
                                builder: (context, provider, child) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomRadioButton<String>(
                                    value: 'Student',
                                    title: 'Student',
                                    groupValue: provider.selectedValue,
                                    onChanged: (value) {
                                      provider.chooseValue(value!);
                                      print(provider.selectedValue);
                                    },
                                    selected: false,
                                  ),
                                  CustomRadioButton<String>(
                                    value: 'Parent',
                                    title: 'Parent (Kids)',
                                    groupValue: provider.selectedValue,
                                    onChanged: (value) {
                                      provider.chooseValue(value!);
                                      print(provider.selectedValue);
                                    },
                                    selected: false,
                                  ),
                                ],
                              );
                            }),
                            const SizedBox(height: 16.0),
                            Text('Enrollment',
                                style: AppTextStyle.h3TextStyle()),
                            const SizedBox(height: 10.0),
                            Text(
                              'Add a start date and/or end date to limit when users can enroll for this course. If left blank, enrollment will be indefinite. By default, if left blank users will have unlimited time to enoll for and access this course.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                Expanded(
                                  child: Consumer<CourseInsertProvider>(
                                      builder: (context, provider, child) {
                                    return InkWell(
                                      onTap: () =>
                                          provider.pickStartDate(context),
                                      child: Container(
                                        width: size.width,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppTextFieldTheme
                                              .appTextFieldTheme,
                                        ),
                                        child: Center(
                                          child: Text(
                                            provider.startDate != null
                                                ? provider.startDate!
                                                : 'Enroll Start Date',
                                            style: AppTextStyle.h4TextStyle(
                                              color: provider.startDate != null
                                                  ? AppTextTheme
                                                      .appTextThemeDark
                                                  : Colors.grey.shade500,
                                              fontWeight:
                                                  provider.startDate != null
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Consumer<CourseInsertProvider>(
                                      builder: (context, provider, child) {
                                    return InkWell(
                                      onTap: () =>
                                          provider.pickEndDate(context),
                                      child: Container(
                                        width: size.width,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppTextFieldTheme
                                              .appTextFieldTheme,
                                        ),
                                        child: Center(
                                          child: Text(
                                            provider.endDate != null
                                                ? provider.endDate!
                                                : 'Enroll End Date',
                                            style: AppTextStyle.h4TextStyle(
                                              color: provider.endDate != null
                                                  ? AppTextTheme
                                                      .appTextThemeDark
                                                  : Colors.grey.shade500,
                                              fontWeight:
                                                  provider.endDate != null
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            Text('Course Schedule',
                                style: AppTextStyle.h3TextStyle()),
                            const SizedBox(height: 10.0),
                            Text(
                              'Add a start and end time for this course.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Consumer<CourseInsertProvider>(
                                builder: (context, provider, child) {
                              return Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () =>
                                          provider.pickStartTime(context),
                                      child: Container(
                                        width: size.width,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppTextFieldTheme
                                              .appTextFieldTheme,
                                        ),
                                        child: Center(
                                          child: Text(
                                            provider.startTime != null
                                                ? provider.startTime!
                                                : 'Start Time',
                                            style: AppTextStyle.h4TextStyle(
                                              color: provider.startTime != null
                                                  ? AppTextTheme
                                                      .appTextThemeDark
                                                  : Colors.grey.shade500,
                                              fontWeight:
                                                  provider.startTime != null
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () =>
                                          provider.pickEndTime(context),
                                      child: Container(
                                        width: size.width,
                                        height: 46.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: AppTextFieldTheme
                                              .appTextFieldTheme,
                                        ),
                                        child: Center(
                                          child: Text(
                                            provider.endTime != null
                                                ? provider.endTime!
                                                : 'End Time',
                                            style: AppTextStyle.h4TextStyle(
                                              color: provider.endTime != null
                                                  ? AppTextTheme
                                                      .appTextThemeDark
                                                  : Colors.grey.shade500,
                                              fontWeight:
                                                  provider.endTime != null
                                                      ? FontWeight.w500
                                                      : FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                            const SizedBox(height: 16.0),
                            Text('Total Open Enrollment',
                                style: AppTextStyle.h3TextStyle()),
                            const SizedBox(height: 10.0),
                            Text(
                              'Set the maximum number of users that can be enrolled for this course.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            TextFormWidget2(
                              hint: 'Maximum users',
                              controller: _maxUserController,
                              node: _maxUserNode,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              counterText: '',
                              autovalidateMode: autovalidateMode
                                  ? AutovalidateMode.onUserInteraction
                                  : AutovalidateMode.disabled,
                              fillColor: AppTextFieldTheme.appTextFieldTheme,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required maximum number of user';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(height: 16.0),
                            Text('Pricing', style: AppTextStyle.h3TextStyle()),
                            const SizedBox(height: 10.0),
                            Text(
                              'Set the initial price on the course.',
                              style: AppTextStyle.h4TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Container(
                              width: size.width,
                              height: 46.0,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10.0),
                                color: AppTextFieldTheme.appTextFieldTheme,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Amount',
                                      style: AppTextStyle.h4TextStyle(
                                          color: Colors.grey.shade400),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: TextFormField(
                                      textAlign: TextAlign.end,
                                      controller: _amountController,
                                      focusNode: _amountNode,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        hintText:
                                            '${AppUnicode.rupeeUnicode}0.00',
                                        border: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        counterText: '',
                                      ),
                                      maxLength: 6,
                                      smartQuotesType: SmartQuotesType.disabled,
                                      textInputAction: TextInputAction.done,
                                    ),
                                  ),
                                ],
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
