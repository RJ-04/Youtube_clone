import 'dart:io';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../cores/methods.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isThumbNailSelected = false;

  File? image;

  bool publishConditionsSatisfied() {
    return isThumbNailSelected &&
        titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.title_rounded),
                  hintText: 'Enter the Title',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: titleController.text.isEmpty
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: titleController.text.isEmpty
                          ? Colors.yellow
                          : Colors.green,
                      width: 2.0,
                    ),
                  ),
                ),
              ),

              //--------------------------------------------------------------------
              const SizedBox(height: 40),
              //--------------------------------------------------------------------

              TextField(
                controller: descriptionController,
                maxLines: 5,
                minLines: 1,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.edit_note_rounded),
                  hintText: 'Enter the Description',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: descriptionController.text.isEmpty
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: descriptionController.text.isEmpty
                          ? Colors.yellow
                          : Colors.green,
                    ),
                  ),
                ),
              ),

              //--------------------------------------------------------------------

              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: TextButton(
                  onPressed: () async {
                    image = await pickImage();

                    if (image != null) {
                      isThumbNailSelected = true;

                      setState(() {});
                    }
                  },
                  child: const Text(
                    'SELECT THUMBNAIL',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              //---------------------------- ----------------------------------------

              isThumbNailSelected
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Image.file(
                        image!,
                        cacheHeight: 150,
                        width: 400,
                      ),
                    )
                  : const SizedBox(),

              //--------------------------------------------------------------------

              publishConditionsSatisfied()
                  ? Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: publishConditionsSatisfied()
                            ? Colors.green
                            : Colors.redAccent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          if (publishConditionsSatisfied()) {
                            String thumbnail = putFileInStorage(
                                image, const Uuid().v4(), 'image');
                          }
                        },
                        child: const Text(
                          'PUBLISH',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
