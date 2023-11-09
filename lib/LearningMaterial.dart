import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:untitled3/API/CallApi.dart';
import 'Widget .dart';

class LearningMaterial extends StatefulWidget {
  final chapter;

  LearningMaterial({super.key, required this.chapter});

  @override
  _LearningMaterialState createState() => _LearningMaterialState();
}

class _LearningMaterialState extends State<LearningMaterial> {
  List<Map<String, dynamic>> allFiles = [];

  @override
  void initState() {
    super.initState();
    FlutterDownloader.initialize(); // Initialize Flutter Downloader
    getFilesMaterial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AllBar(text: 'Learning Material'),
      ),
      body: buildFileList(),
    );
  }

  Widget buildFileList() {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: allFiles.length,
      itemBuilder: (context, index) {
        return buildFileListItem(allFiles[index]);
      },
    );
  }

  Widget buildFileListItem(Map<String, dynamic> file) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(file['file_name'],
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        trailing: buildDownloadButton(file['original_url'], file['file_name']),
      ),
    );
  }

  Widget buildDownloadButton(String fileUrl, String fileName) {
    return IconButton(
      icon: Icon(
        Icons.file_download,
        color: Colors.green,
        size: 30,
      ),
      onPressed: () {
        downloadFile(fileUrl, fileName);
      },
    );
  }

  Future<void> getFilesMaterial() async {
    final response = await CallApi().getData('chapter/${widget.chapter['id']}/material');
    print(response.body);
    final data = json.decode(response.body)['data'];
    final List<Map<String, dynamic>> files = [];
    data.forEach((key, value) {
      files.add(Map<String, dynamic>.from(value));
    });

    print("Data: ${files.length}");

    setState(() {
      allFiles = files;
    });
  }

  Future<void> downloadFile(String fileUrl, String fileName) async {
    try {
      final taskId = await FlutterDownloader.enqueue(
        url: fileUrl,
        savedDir: '/storage/emulated/0/Download/', // Replace with your desired directory path
        fileName: fileName,
        showNotification: true,
        openFileFromNotification: true,
      );
      print('File "$fileName" is downloading with task ID: $taskId');
    } catch (error) {
      print('Error downloading file: $error');
    }
  }
}