import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class SelectPicture extends StatefulWidget {
  final Function(List<File>) onImagesPicked;
  final List<File> images;

  const SelectPicture({Key? key, required this.images, required this.onImagesPicked}) : super(key: key);

  @override
  State<SelectPicture> createState() => _SelectPictureState();
}

class _SelectPictureState extends State<SelectPicture> {
  Future<void> _pickImages() async {
    final picker = ImagePicker();
    final pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      final List<File> selectedImages = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      widget.onImagesPicked(selectedImages);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const FaIcon(FontAwesomeIcons.image),
              onPressed: () => _pickImages(),
            ),
            Expanded(
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.file(
                        widget.images[index],
                        width: 100,
                        height: 100,
                      ),
                    );
                  }
                ),
              ),
            )
          ],
        ),
        if (widget.images.length >= 5) 
          const Text("최대 5개의 사진만 선택할 수 있습니다.", style: TextStyle(color: Colors.red),)
      ],
    );
  }
}
