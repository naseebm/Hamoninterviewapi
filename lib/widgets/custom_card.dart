import 'package:flutter/material.dart';

 Widget classroomCard(String labelName, String label, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.21,
            child: Text(labelName ,style: TextStyle(color: Colors.black.withOpacity(0.7)),),
          ),
          SizedBox(width: width * 0.3, child: Text(label,style:  const TextStyle(fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
   Widget customCard(String labelName, String label, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.25,
            child: Text(labelName , style: TextStyle(color: Colors.black.withOpacity(0.7)),),
          ),
          SizedBox(width: width * 0.5, child: Text(label, style:  const TextStyle(fontWeight: FontWeight.w500),)),
        ],
      ),
    );
  }