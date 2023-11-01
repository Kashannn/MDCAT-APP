import 'package:flutter/material.dart';

import 'Widget .dart';

class LearningMaterial extends StatefulWidget {
  @override
  _LearningMaterialState createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<LearningMaterial> {
  final List<String> files = [
    'File 1',
    'File 2',
    'File 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AllBar(text: 'Learning Material'), // Your custom Widget
      ),
      body: buildFileList(),
    );
  }

  Widget buildFileList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: files.length,
      itemBuilder: (context, index) {
        return buildFileListItem(files[index]);
      },
    );
  }

  Widget buildFileListItem(String fileName) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(fileName),
        trailing: buildDownloadButton(),
      ),
    );
  }

  Widget buildDownloadButton() {
    return IconButton(
      icon: Icon(
        Icons.file_download,
        color: Colors.green,
        size: 30,
      ),
      onPressed: () {
        // Handle file download here
      },
    );
  }
}
