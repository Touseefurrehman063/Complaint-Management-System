import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileRecordWidget extends StatelessWidget {
  final String? title;
  final String? name;

  const ProfileRecordWidget({Key? key, this.title, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '$title',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            ':',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(
            width: Get.width * 0.03,
          ),
          Expanded(
            child: Text(
              '$name',
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
