import 'package:flutter/material.dart';
import 'package:hamon_interviewapi/providers/students_provider.dart';
import 'package:hamon_interviewapi/widgets/custom_card.dart';

import 'package:provider/provider.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key? key, required this.id, required this.title}) : super(key: key);
   final int id;
   final String title;
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
    var width=MediaQuery.of(context).size.width;
    var prov = Provider.of<StudentsProvider>(context, );
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),),
      body:
     !prov.isLoading && prov.studentDetails==null
          ? Center(
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                  label: const Text('refresh')))
          : prov.isLoading
              ? const  LinearProgressIndicator()
                
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
                           
                           customCard('Name', prov.studentDetails!.name,width ),
                           customCard('Layout', prov.studentDetails!.email,width),
                           customCard('Id',prov.studentDetails!.id.toString(),width),
                           customCard('Size', prov.studentDetails!.age.toString(),width),
                         
                      
                        ],
                      
                                ),
                    ),
                  ),
                )
       
    );
  }

 
}