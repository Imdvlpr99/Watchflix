import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watchflix/utils/constants.dart';

class CustomDialog {
  static Future showErrorDialog({required BuildContext context, required String title}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return ErrorDialog(
          title: title,
        );
      },
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String title;
  const ErrorDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 10),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SvgPicture.asset(
                'assets/error.svg',
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                httpError,
                style: GoogleFonts.poppins().copyWith(
                  color: Colors.white,
                  fontSize: 14
                ),
              ),
            ),
            Container(
              height: 50,
              color: accentColor,
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  buttonOk,
                  style: GoogleFonts.poppins().copyWith(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}