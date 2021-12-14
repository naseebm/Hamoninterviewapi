import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/classrooms_provider.dart';
import 'package:hamon_interviewapi/screens/classroom_detail.dart';
import 'package:provider/provider.dart';

class ClassRooms extends StatefulWidget {
  const ClassRooms({Key? key}) : super(key: key);

  @override
  State<ClassRooms> createState() => _ClassRoomsState();
}

class _ClassRoomsState extends State<ClassRooms> {
  @override
  void initState() {
    var prov = Provider.of<ClassroomProvider>(context, listen: false);
    prov.fetchClassrooms();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ClassroomProvider>(context);
    return Scaffold(
      body: !prov.isLoading && prov.classroomsDetails.isEmpty
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading
              ? const  LinearProgressIndicator()
                
              : ListView.builder(
                  itemCount: prov.classroomsDetails.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  ClassroomDetail(id:prov.classroomsDetails[index].id,
                                    title:prov.classroomsDetails[index].name ,)));
                          },
                          leading:
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(prov.classroomsDetails[index].id.toString()),
                              ),
                          title: Text(prov.classroomsDetails[index].name),
                          subtitle: Text(prov.classroomsDetails[index].layout),
                        ),
                      ),
                    );
                  }),
    );
  }
}
