import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/download_page.dart';
import 'package:wallpaper_app/models/Image.dart';
import 'package:wallpaper_app/helper.dart';

class Page9 extends StatefulWidget {
  Page9({required this.query, super.key});
  final String query;
  @override
  State<Page9> createState() => _Page9State(query: query);
}

class _Page9State extends State<Page9> {
  final String query;

  _Page9State({required this.query});

  List<Imagee> result = [];
  ScrollController scrollController = ScrollController();
  var page_num = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hasNext();
  }

  void hasNext() {
    scrollController.addListener(() async {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        setState(() {
          page_num++;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 5, left: 5, top: 5),
      child: FutureBuilder(
        future: Helper.getPageBySearch(query, page_num),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var element in snapshot.data as List<Imagee>) {
              result.add(element);
            }

            if (result.length == 0) {
              return Center(
                  child: Container(
                height: 100,
                width: 100,
                color: Colors.grey,
              ));
            }

            return GridView.builder(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DownloadPage(
                                  url: result[index].large,
                                )),
                      );
                    },
                    child: Container(
                      height: 500,
                      width: 300,
                      color: Colors.white,
                      child:
                          Image.network(result[index].large, fit: BoxFit.cover),
                    ),
                  );
                });
          } else {
            return GridView.builder(
                controller: scrollController,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    period: Duration(seconds: 2),
                    baseColor: const Color.fromARGB(255, 190, 189, 189),
                    highlightColor: Colors.grey.shade300,
                    child: Container(
                      height: 500,
                      width: 300,
                      color: Colors.white,
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
