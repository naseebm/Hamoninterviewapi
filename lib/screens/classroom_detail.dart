import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/classrooms_provider.dart';
import 'package:provider/provider.dart';

class ClassroomDetail extends StatefulWidget {
  const ClassroomDetail({Key? key, required this.id}) : super(key: key);
   final int id;
  @override
  State<ClassroomDetail> createState() => _ClassroomDetailState();
}

class _ClassroomDetailState extends State<ClassroomDetail> {
   @override
  void initState() {
    var prov = Provider.of<ClassroomProvider>(context, listen: false);
    prov.fetchClassroom(widget.id);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ClassroomProvider>(context, );
    return Scaffold(
      appBar: AppBar(),
      body:
     !prov.isLoading && prov.classroomDetails==null
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
                     
                     customCard('name', prov.classroomDetails!.name ),
                     customCard('layout', prov.classroomDetails!.layout),
                     customCard('id',prov.classroomDetails!.id.toString()),
                     customCard('size', prov.classroomDetails!.size.toString()),
                     customCard('subject', prov.classroomDetails!.subject.toString())
                
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