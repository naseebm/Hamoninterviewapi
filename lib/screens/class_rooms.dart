import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/classroom_provider.dart';
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: prov.classroomsDetails.length,
                  itemBuilder: (context, int index) {
                    return ListTile(
                      leading:
                          Text(prov.classroomsDetails[index].id.toString()),
                      title: Text(prov.classroomsDetails[index].name),
                      subtitle: Text(prov.classroomsDetails[index].layout),
                    );
                  }),
    );
  }
}
