import 'package:binary_fusion_task/constant/custom_button.dart';
import 'package:binary_fusion_task/constant/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../constant/app_text_style.dart';
import '../hive/note_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showFormDialog(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Title and Description"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                CustomTextField(
                  controller: titleController,
                  iconData: Icons.title_outlined,
                  hintText: 'Add Title',
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: descriptionController,
                  iconData: Icons.description_outlined,
                  hintText: 'Description',
                ),
              ],
            ),
          ),
          actions: [
            CustomButton(
              onTap: () {
                Navigator.pop(context); // Close the dialog
              },
              titleText: "Cancel",
              height: 40,
              width: 70,
            ),
            CustomButton(
              onTap: () async {
                final note = Note(title: titleController.text,
                  description: descriptionController.text,
                  status: "pending", // default
                );
                final box = Hive.box<Note>('notes');
                await box.add(note);

                Navigator.pop(context); // Close the dialog
              },
              titleText: "Submit",
              height: 40,
              width: 120,
            ),

          ],
        );
      },
    );
  }

  void _showEditForm(BuildContext context, Note note) {
    final titleController = TextEditingController(text: note.title);
    final descriptionController = TextEditingController(text: note.description);
    String selectedStatus = note.status;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit Note"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: "Description"),
              ),
              DropdownButtonFormField<String>(
                value: selectedStatus,
                items: ["pending", "done"]
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    selectedStatus = value;
                  }
                },
                decoration: InputDecoration(labelText: "Status"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              note.title = titleController.text;
              note.description = descriptionController.text;
              note.status = selectedStatus;
              note.save(); // Save changes to Hive
              Navigator.pop(context);
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;
    final deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      backgroundColor: Color(0xFFF1F3F8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(height: 400),
                  Container(
                    alignment: Alignment.center,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFF7A5AF8),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(24),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Challenge Awaiting",
                                style: AppTextStyle.inter24w600White,
                              ),
                              Text(
                                "Let’s tackle your to do list",
                                style: AppTextStyle.inter13w500LightPurple,
                              ),
                            ],
                          ),
                          Container(
                            height: 90,
                            width: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/task_list.png",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: deviceWidth - 35,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFFEFEFE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Summary of Your Work",
                            style: AppTextStyle.inter14w600Black,
                          ),
                          Text(
                            "Your current task progress",
                            style: AppTextStyle.inter13w400Grey,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Container(

                                /// Total device width - Total spacing and padding
                                width: deviceWidth / 3 - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFEBECEE),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/todo.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Todo",
                                          style: AppTextStyle.inter13w400Grey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "5",
                                      style: AppTextStyle.inter14w600Black,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: deviceWidth / 3 - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFEBECEE),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/in_progress.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "In Progress",
                                          style: AppTextStyle.inter13w400Grey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "5",
                                      style: AppTextStyle.inter14w600Black,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: deviceWidth / 3 - 30,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFFEBECEE),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/done.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          "Done",
                                          style: AppTextStyle.inter13w400Grey,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "5",
                                      style: AppTextStyle.inter14w600Black,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder(
                valueListenable: Hive.box<Note>('notes').listenable(),
                builder: (context, Box<Note> box, _) {
                  return box.values.isEmpty ? Center(
                      child: Text('No notes yet.')) : SizedBox(
                    height: deviceHeight - 500,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: box.length,
                      itemBuilder: (context, index) {
                        final note = box.getAt(index);
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xFFF9FAFB),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF7A5AF8),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          "assets/images/flash.png",
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 7),
                                    Text(
                                      note?.title ?? '',
                                      style: AppTextStyle.inter14w600Black,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            100),
                                        color: Color(0xFFEAECF0),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 12,
                                            width: 12,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  "assets/images/in_progress.png",
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Text(
                                            note!.status.toString(),
                                            style: AppTextStyle.inter14w600Black,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (_) =>
                                              AlertDialog(
                                                content: Text(
                                                    note?.description ??
                                                        'No Description'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(context),
                                                    child: Text("Close"),
                                                  )
                                                ],
                                              ),
                                        );
                                      },
                                      child: Container(
                                        width: 110,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              100),
                                          color: Color(0xFFF95555),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 9,
                                              width: 9,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "assets/images/flash.png",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Text(

                                              ///note?.description ?? ''
                                              "description",
                                              style: AppTextStyle
                                                  .inter14w600White,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Color(0xFF7A5AF8), // Line color
                                  thickness: 4, // Line thickness
                                  indent: 4, // Left margin
                                  endIndent: 4, // Right margin
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButton(
                                      onTap: () {
                                        _showEditForm(context, note);
                                        },
                                      titleText: "edit",
                                      width: 70,
                                      height: 30,
                                    ),
                                    Row(
                                      // crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 16,
                                          width: 16,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/calendar.png",
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 7),
                                        Text(
                                          "27th Sept",
                                          style: AppTextStyle.inter14w600Black,
                                        ),
                                        SizedBox(width: 10),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },

              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: CustomButton(
              onTap: () {
                _showFormDialog(context);
              },
              titleText: "Create Task",
            ),
          ),
        ],
      ),
    );
  }
}
