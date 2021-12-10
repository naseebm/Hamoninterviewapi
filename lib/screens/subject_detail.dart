import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/providers/subject_provider.dart';
import 'package:hamon_interviewapi/widgets/custom_card.dart';

import 'package:provider/provider.dart';

class SubjectDetail extends StatefulWidget {
  const SubjectDetail({Key? key, required this.id,required this. title}) : super(key: key);
   final int id;
   final String title;
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
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
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
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                       customCard('name', prov.subjectDetail!.name,width ),
                       customCard('layout', prov.subjectDetail!.teacher,width),
                       customCard('id',prov.subjectDetail!.id.toString(),width),
                       customCard('size', prov.subjectDetail!.credits.toString(),width),
                     
                  
                    ],),
             ),
              
    );
  }

}