import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class DownloadPage extends StatefulWidget {
  final String url;

  const DownloadPage({required this.url, super.key});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool inProgress = false;
  bool downloaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(widget.url), fit: BoxFit.cover)),
      ),
      Positioned(
          bottom: 50,
          left: 50,
          right: 50,
          child: GestureDetector(
            onTap: () {
              //download code
              FileDownloader.downloadFile(
                  url: widget.url,
                  onProgress: (name, progress) async {
                    setState(() {
                      inProgress = true;
                      print(progress);
                    });
                  },
                  onDownloadCompleted: (value) {
                    setState(() {
                      inProgress = false;
                      downloaded = true;
                      print(" obj  is downloadedd");
                    });
                  });
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: downloaded
                      ? Colors.green.shade600
                      : Color.fromARGB(255, 153, 22, 72),
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: inProgress
                      ? SizedBox(
                          height: 25,
                          width: 25,
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : Text(
                          downloaded ? "Downloaded" : "Download",
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
            ),
          ))
    ]));
  }
}
