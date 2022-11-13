import 'package:first_flutter/custom/custom_button.dart';
import 'package:first_flutter/model/post_result.dart';
import 'package:first_flutter/pages/projects/channel.dart';
import 'package:first_flutter/pages/projects/general.dart';
import 'package:first_flutter/pages/projects/person.dart';
import 'package:first_flutter/pages/projects/recent.dart';
import 'package:first_flutter/service/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  bool fetching = false;
  List<PostResult> postResult = [];
  Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Project')),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: ListView(children: [
          // const DrawerHeader(
          //     decoration: BoxDecoration(color: Colors.white),
          //     child: Text('DraweHeader')),
          drawerItem(
              Icons.rotate_left_outlined,
              'Recent',
              () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecentPage()))
                  }),
          drawerItem(
              Icons.bar_chart,
              'General',
              () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GeneralPage()))
                  }),
          drawerItem(
              Icons.person,
              'Person',
              () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PersonPage()))
                  }),
          drawerItem(
              Icons.people,
              'Channel',
              () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChannelPage()))
                  }),
        ]),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(label: Text('Name')),
                ),
                TextField(
                  controller: jobController,
                  decoration: const InputDecoration(label: Text('Job')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: fetching
                      ? const CupertinoActivityIndicator(
                          color: Colors.blue,
                          radius: 15,
                        )
                      : buildCustomButton('Submit', () {
                          setState(() {
                            fetching = true;
                          });
                          api
                              .postUser(nameController.text, jobController.text)
                              .then((value) => {
                                    print(value),
                                    nameController.text = '',
                                    jobController.text = '',
                                    postResult.add(value),
                                    setState(() {
                                      fetching = false;
                                    })
                                  });
                        },
                          [Colors.blue, Colors.blue],
                          340 * MediaQuery.of(context).size.width / 375,
                          70 * MediaQuery.of(context).size.width / 600,
                          20),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: postResult.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              rowItem("ID: ", postResult[index].id),
                              rowItem("Name: ", postResult[index].name),
                              rowItem("Job: ", postResult[index].job),
                              rowItem(
                                  "Created At: ", postResult[index].created),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(icon, String title, onTap) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 0.5))),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        onTap: () {
          onTap();
        },
      ),
    );
  }

  Widget rowItem(String title, String value) {
    return Row(
      children: [
        Text(title),
        Text(value),
      ],
    );
  }
}
