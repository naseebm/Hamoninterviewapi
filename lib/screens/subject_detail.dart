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
              ? const LinearProgressIndicator()
                
              :
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 6),
               child: Card(
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Column(
                     mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                           customCard('Name', prov.subjectDetail!.name,width ),
                           customCard('Layout', prov.subjectDetail!.teacher,width),
                           customCard('Id',prov.subjectDetail!.id.toString(),width),
                           customCard('Size', prov.subjectDetail!.credits.toString(),width),
                         
                      
                        ],),
                 ),
               ),
             ),
              
    );
  }

}