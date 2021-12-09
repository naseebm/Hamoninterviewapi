import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:provider/provider.dart';

class Students extends StatefulWidget {
  const Students({Key? key}) : super(key: key);

  @override
  State<Students> createState() => _StudentsState();
}


class _StudentsState extends State<Students> {
  @override
void initState() {
  var prov = Provider.of<StudentsProvider>(context, listen: false);
    prov.fetchStudents();
  super.initState();
  
}
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<StudentsProvider>(context);
    
    return prov.isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            body: ListView.builder(
                itemCount: prov.studentsDetails.length,
                itemBuilder: (context, int index) {
                  return ListTile(
                    leading:Text(prov.studentsDetails[index].id.toString()) ,
                    title: Text(prov.studentsDetails[index].name),
                    subtitle: Text(prov.studentsDetails[index].email),
                  );
                }),
          );
  }
}
