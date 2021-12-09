import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';

import 'package:provider/provider.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key? key, required this.id}) : super(key: key);
   final int id;
  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
   @override
  void initState() {
    var prov = Provider.of<StudentsProvider>(context, listen: false);
    prov.fetchStudent(widget.id);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<StudentsProvider>(context, );
    return Scaffold(
      appBar: AppBar(),
      body:
     !prov.isLoading && prov.studentDetails==null
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              :
              Center(
                child: Card(
                  child: Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                     
                     customCard('name', prov.studentDetails!.name ),
                     customCard('layout', prov.studentDetails!.email),
                     customCard('id',prov.studentDetails!.id.toString()),
                     customCard('size', prov.studentDetails!.age.toString()),
                   //  customCard('subject', prov.StudentDetails!.subject.toString())
                
                  ],),
                ),
              )
       
    );
  }

  Widget customCard (String labelName, String label){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(labelName+ ' : ' +label,),
    );
  }
}