import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/models/users_model.dart';
import 'package:tdvpnext/utility/config_form.dart';
import 'package:tdvpnext/utility/config_progress.dart';
import 'package:tdvpnext/utility/dailog.dart';
import 'package:tdvpnext/utility/style.dart';

class UpdateProfileCustomer extends StatefulWidget {
  final String? docIdProfile;
  const UpdateProfileCustomer({Key? key, this.docIdProfile}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UpdateProfileCustomerState createState() => _UpdateProfileCustomerState();
}

class _UpdateProfileCustomerState extends State<UpdateProfileCustomer> {
  UserModel? userModel;

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController subdistrictController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController zipcodController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> map = {};
  String? docIdProfile;

  @override
  void initState() {
    super.initState();
    docIdProfile = widget.docIdProfile;
    readCurrentProfile();
  }

  Future<void> readCurrentProfile() async {
    FirebaseAuth.instance.authStateChanges().listen((event) async {
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var item in value.docs) {
          setState(() {
            userModel = UserModel.fromMap(item.data());
            fnameController.text = userModel!.fname!;
            lnameController.text = userModel!.lname!;
            addressController.text = userModel!.address!;
            subdistrictController.text = userModel!.subdistrict!;
            districtController.text = userModel!.district!;
            provinceController.text = userModel!.province!;
            zipcodController.text = userModel!.zipcode!;
            phoneController.text = userModel!.phone!;
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        title: const Text('แก้ไขข้อมูลส่วนบุคคล'),
      ),
      body: userModel == null
          ? const ConfigProgress()
          : GestureDetector(
              onTap: () =>
                  FocusScope.of(context).requestFocus(FocusScopeNode()),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: fnameController,
                          label: 'ชื่อ',
                          iconData: Icons.location_history_rounded,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: lnameController,
                          label: 'นามสกุล',
                          iconData: Icons.location_history_rounded,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: addressController,
                          label: 'ที่อยู่ :',
                          iconData: Icons.home,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: subdistrictController,
                          label: 'ตำบล :',
                          iconData: Icons.home,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: districtController,
                          label: 'อำเภอ :',
                          iconData: Icons.home,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.number,
                          controller: provinceController,
                          label: 'จังหวัด :',
                          iconData: Icons.location_city_sharp,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.text,
                          controller: zipcodController,
                          label: 'รหัสไปรษณีย์ :',
                          iconData: Icons.location_on_sharp,
                          changeFunc: (String string) {}),
                      ConfigForm(
                          textInputType: TextInputType.number,
                          controller: phoneController,
                          label: 'เบอร์โทรศัพท์ :',
                          iconData: Icons.phone_android_outlined,
                          changeFunc: (String string) {}),
                      ButtonUpdateProcess(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox ButtonUpdateProcess() {
    return SizedBox(
      width: 250,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print('@@ map ==> $map');

            if (map.isEmpty) {
              normalDialog(context, 'ไม่มีการเปลี่ยนแปลงค่ะ');
            } else {
              FirebaseAuth.instance.authStateChanges().listen((event) async {
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(event!.uid)
                    .update(map)
                    .then((value) => Navigator.pop(context))
                    .catchError((value) {
                  print('@@ error ==>> $value');
                });
              });
            }
          }
        },
        child: const Text('บันทึก'),
      ),
    );
  }
}
