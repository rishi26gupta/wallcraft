import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wallpaper_app/download_page.dart';
import 'package:wallpaper_app/models/Image.dart';
import 'package:wallpaper_app/helper.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
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
        future: Helper.getPage(page_num),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            for (var element in snapshot.data as List<Imagee>) {
              result.add(element);
            }

            if (result.length == 0) {
              return Center(
                  child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20)),
                height: 150,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Unable to Load Images Please Try Later",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 153, 22, 72))),
                        onPressed: () {
                          //static data or can show downloaded data
                          result.add(Imagee("large", "", ""));
                          result.add(Imagee("large", "", ""));
                          setState(() {});
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Retry ",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(Icons.refresh)
                          ],
                        ))
                  ],
                ),
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
