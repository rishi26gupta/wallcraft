import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        color: Colors.grey.shade100,
        // color: Colors.redAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const part_1(),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 202, 201, 201),
                      offset: Offset(
                        .4,
                        .4,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color.fromARGB(255, 153, 22, 72), width: 2)),
              child: const Column(
                children: [
                  Custom_Tile(
                    ic: Icons.favorite,
                    tittle: "Liked Wallpapers",
                  ),
                  Custom_Tile(
                    ic: Icons.download,
                    tittle: "downloads",
                  ),
                  Custom_Tile(
                    ic: Icons.language,
                    tittle: "Language",
                  ),
                  Custom_Tile(
                    ic: Icons.settings,
                    tittle: "Settings",
                  ),
                  Custom_Tile(
                    ic: Icons.notifications,
                    tittle: "Notification",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 202, 201, 201),
                      offset: Offset(
                        .4,
                        .4,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color.fromARGB(255, 153, 22, 72), width: 2)),
              child: const Column(
                children: [
                  Custom_Tile(
                    ic: Icons.logout,
                    tittle: "Logout",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class Custom_Tile extends StatelessWidget {
  final IconData ic;
  final String tittle;

  const Custom_Tile({super.key, required this.ic, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 0),
      minLeadingWidth: 0,
      leading: Icon(
        ic,
        size: 27,
        color: Color.fromARGB(255, 153, 22, 72),
      ),
      title: Text(
        tittle,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.black,
      ),
    );
  }
}

class part_1 extends StatelessWidget {
  const part_1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 169, 168, 168),
                shape: BoxShape.circle),
            child: Image.asset("images/pj.png"),
          ),
          const Column(
            children: [
              Text(
                "Rishi ",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "rishiguptag26@gmail.com",
                    style: TextStyle(color: Color.fromARGB(255, 113, 112, 112)),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
