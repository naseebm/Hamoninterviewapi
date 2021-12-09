import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';

import 'package:provider/provider.dart';

class SubjectDetail extends StatefulWidget {
  const SubjectDetail({Key? key, required this.id}) : super(key: key);
   final int id;
  @override
  State<SubjectDetail> createState() => _SubjectDetailState();
}

class _SubjectDetailState extends State<SubjectDetail> {
   @override
  void initState() {
    var prov = Provider.of<SubjectProvider>(context, listen: false);
    prov.fetchSubject(widget.id);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<SubjectProvider>(context );
    return Scaffold(
      appBar: AppBar(),
      body:
     !prov.isLoading && prov.subjectDetail==null
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
                     
                     customCard('name', prov.subjectDetail!.name ),
                     customCard('layout', prov.subjectDetail!.teacher),
                     customCard('id',prov.subjectDetail!.id.toString()),
                     customCard('size', prov.subjectDetail!.credits.toString()),
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