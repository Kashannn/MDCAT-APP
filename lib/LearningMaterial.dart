import 'package:flutter/material.dart';

class LearningMaterial extends StatefulWidget {
  @override
  _LearningMaterialState createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<LearningMaterial> {
  final List<String> files = [
    'File 1',
    'File 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildFileList(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'Learning Material',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      flexibleSpace: Container(
        decoration: buildGradientDecoration(),
      ),
    );
  }

  BoxDecoration buildGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.blue, Colors.green],
      ),
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
