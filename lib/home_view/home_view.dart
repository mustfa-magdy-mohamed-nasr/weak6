import 'dart:io';

import 'package:flutter/material.dart';
import 'package:weak6/data/sqldb.dart';
import 'package:weak6/home_view/details_view.dart';

import 'add_member.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final SqlDb sqlDb = SqlDb();

  Future<List<Map<String, dynamic>>> readData() async {
    return await sqlDb.readDbase("SELECT * FROM elfasafees");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddMemberView()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 241, 239, 239),
        appBar: AppBar(
          actions: const [
            Icon(
              Icons.search,
              color: Colors.blue,
            )
          ],
          leading: const Icon(
            Icons.short_text_outlined,
            color: Colors.blue,
          ),
          shadowColor: Colors.black,
          elevation: 1.5,
          title: const Text(
            'El Fasafees',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder(
          future: readData(),
          builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final Map<String, dynamic> data = snapshot.data![index];
    final String title = data['title'] ?? ''; // Example: Accessing title from data
    final String fanction = data['fanction'] ?? ''; // Example: Accessing title from data
    final String imagePath = data['image'] ?? ''; // Example: Accessing image path from data
                  if(snapshot.hasData){

                     return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const DetailsView()),
                        );
                      },
                      child: ListTile(
                        leading: Container(
                          width: 80,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // image: DecorationImage(
                            //   // image: FileImage('${snapshot.data}'),
                            //   fit: BoxFit.fill,
                            // ),
                          ),
                        ),
                        title:Text(title),
                        titleTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        subtitle:  Text(
                          fanction,
                          style: const TextStyle(color: Colors.grey, inherit: false),
                        ),
                      ),
                    ),
                  );
                    
                  }
                  return null;
                 
                },
              );
            }
          },
        ),
      ),
    );
  }
}