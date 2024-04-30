import 'package:flutter/material.dart';
import 'package:weak6/data/sqldb.dart';
import 'package:weak6/home_view/home_view.dart';
import 'package:weak6/home_view/picture_view.dart';

class AddMemberView extends StatefulWidget {
  const AddMemberView({super.key});

  @override
  State<AddMemberView> createState() => _AddMemberViewState();
}

class _AddMemberViewState extends State<AddMemberView> {
  TextEditingController title = TextEditingController();
  TextEditingController fanction = TextEditingController();
  TextEditingController phone = TextEditingController();
  SqlDb sqlDb = SqlDb();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formstate,
                  child: Column(
                    children: [
                      const UpLodeImage(),
                      TextField(
                          controller: title,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person_3_outlined,
                                color: Colors.blue,
                              ),
                              labelText: 'Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                            controller: phone,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                    Icons.phone_enabled_outlined,
                                    color: Colors.blue),
                                labelText: 'Phone',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ))),
                      ),
                      TextField(
                          controller: fanction,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.wordpress_outlined,
                                  color: Colors.blue),
                              labelText: 'Function',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Text(
                            'Cansel',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          int response = await sqlDb.insertDbase('''
  INSERT INTO elfasafees ("title", "fanction", "phone", "image" ,"email")
  VALUES ("${title.text}", "${fanction.text}", "${phone.text}", "${phone.text}", "$imageCache")
''');
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const HomeView()),
                                (route) => false);
                          }
                          print('$response=======================');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
