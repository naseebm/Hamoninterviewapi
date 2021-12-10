import 'package:flutter/material.dart';

 Widget customCard(String labelName, String label, double width) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.25,
            child: Text(labelName + ' : '),
          ),
          SizedBox(width: width * 0.25, child: Text(label)),
        ],
      ),
    );
  }