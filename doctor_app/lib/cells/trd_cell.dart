import 'package:doctorapp/models/doctor.dart';
import 'package:doctorapp/utils/he_color.dart';
import 'package:doctorapp/utils/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrdCell extends StatelessWidget {
  final Doctor doctor;

  const TrdCell({
    Key key,
    @required this.doctor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 3),
            color: HexColor('#404B63').withOpacity(0.3),
            blurRadius: 10,
          )
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageSection(),
          SizedBox(width: 16),
          _detailSection(),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 28),
              RaisedButton(
                onPressed: (){},
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  // side: BorderSide(color: Colors.green)
                ),
                child: Text('Appointment',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _imageSection() {
    return Container(
      height: 78,
      width: 98,
      decoration: BoxDecoration(
        color: HexColor('#08C6AD'),
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(
          image: AssetImage('assets/images/' + doctor.image),
        )
      ),
    );
  }

  Column _detailSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              doctor.rating.toString(),
              style: TextStyle(
                color: HexColor('#929BB0'),
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(width: 4),
            Icon(
              MyFlutterApp.star,
              color: HexColor('##FFBB23'),
              size: 10,
            )
          ],
        ),
        SizedBox(height: 10,
        ),
        Text(
          doctor.firstName + ' ' + doctor.lastName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 10,
        ),
        Text(
          doctor.type + ' Specialist',
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
