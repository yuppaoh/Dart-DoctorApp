import 'package:doctorapp/cells/category_cell.dart';
import 'package:doctorapp/cells/hd_cell.dart';
import 'package:doctorapp/cells/trd_cell.dart';
import 'package:doctorapp/models/category.dart';
import 'package:doctorapp/models/doctor.dart';
import 'package:doctorapp/utils/he_color.dart';
import 'package:doctorapp/utils/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Doctor> _hDoctors = List<Doctor>();
  List<Category> _categories = List<Category>();
  List<Doctor> _trDoctors = List<Doctor>();

  _onCellTap(Doctor doctor) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(doctor: doctor),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _hDoctors = _getHDoctors();
    _categories = _getCategories();
    _trDoctors = _getTRDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _hDoctorsSection(),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  SizedBox(height: 32),
                  _trDoctorsSection(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: HexColor('#150047')),
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          size: 30,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
              color: Colors.black,
            ),
            onPressed: () {})
      ],
    );
  }

  SizedBox _hDoctorsSection() {
    return SizedBox(
      height: 199,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14),
        itemCount: _hDoctors.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(indent: 14),
        itemBuilder: (BuildContext context, int index) =>
            HDCell(
                doctor: _hDoctors[index],
                onTap: () => _onCellTap(_hDoctors[index]),
            ),
      ),
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Categories',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 26,
        ),
        SizedBox(
          height: 100,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 14),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(category: _categories[index]),
          ),
        )
      ],
    );
  }

  Column _trDoctorsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Rated Doctor',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 26),
        ListView.separated(
          primary: false,
          shrinkWrap: true,
          itemCount: _trDoctors.length,
          separatorBuilder: (BuildContext context, int index) => Divider(
            thickness: 6,
              color: Colors.transparent,
          ),
          itemBuilder: (BuildContext context, int index) =>
              TrdCell(doctor: _trDoctors[index]),
        )
      ],
    );
  }

  List<Doctor> _getHDoctors() {
    List<Doctor> hDoctor = List<Doctor>();
    hDoctor.add(
      Doctor(
          firstName: 'Albert1',
          lastName: 'Alexander',
          image: 'albert1.jpg',
          type: 'Kidney',
          rating: 4.5),
    );
    hDoctor.add(
      Doctor(
          firstName: 'Albert',
          lastName: 'Alexander',
          image: 'albert.jpg',
          type: 'Kidney',
          rating: 4.5),
    );
    return hDoctor;
  }

  List<Category> _getCategories() {
    List<Category> categories = List<Category>();
    categories.add(Category(
      icon: MyFlutterApp.cardiologist,
      title: 'Cardiologist',
    ));
    categories.add(Category(
      icon: MyFlutterApp.eyes,
      title: 'Eyes',
    ));
    categories.add(Category(
      icon: MyFlutterApp.pediatrician,
      title: 'Pediatrician',
    ));
    return categories;
  }

  List<Doctor> _getTRDoctors() {
    List<Doctor> trDoctors = List<Doctor>();
    trDoctors.add(Doctor(
        firstName: 'Albert',
        lastName: 'Alexander',
        image: 'albert.jpg',
        type: 'Bone',
        rating: 4.3));

    trDoctors.add(Doctor(
        firstName: 'Cherly',
        lastName: 'Bishop',
        image: 'cherly.jpg',
        type: 'Bone',
        rating: 4.3));

    trDoctors.add(Doctor(
        firstName: 'Mathew',
        lastName: 'Chambers',
        image: 'mathew.png',
        type: 'Bone',
        rating: 4.3));
    trDoctors.add(Doctor(
        firstName: 'Mabow',
        lastName: 'Chambers',
        image: 'mathew.png',
        type: 'Bone',
        rating: 4.3));

    return trDoctors;
  }
}
