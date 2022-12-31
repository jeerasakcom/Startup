import 'package:avatar_view/avatar_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/components/frontend/customer/profile/customer_updateprofile.dart';
import 'package:tdvpnext/models/users_model.dart';
import 'package:tdvpnext/utility/config_progress.dart';
import 'package:tdvpnext/utility/config_text.dart';
import 'package:tdvpnext/utility/config_title.dart';
import 'package:tdvpnext/utility/style.dart';

class CustomerReaderProfilePage extends StatefulWidget {
  const CustomerReaderProfilePage({Key? key}) : super(key: key);

  @override
  State<CustomerReaderProfilePage> createState() =>
      _CustomerReaderProfilePageState();
}

class _CustomerReaderProfilePageState extends State<CustomerReaderProfilePage> {
  var user = FirebaseAuth.instance.currentUser;
  UserModel? userModel;
  bool load = true;

  @override
  void initState() {
    super.initState();
    readProfile();
  }

  Future<void> readProfile() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(user!.uid)
        .get()
        .then((value) {
      setState(() {
        load = false;
        userModel = UserModel.fromMap(value.data()!);
        print('userModel ==> ${userModel!.toMap()}');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UpdateProfileCustomer(),
              )).then((value) {
            readProfile();
          });
        },
        backgroundColor: Colors.amber,
        //backgroundColor: StyleProjects().baseColor,
        child: const Icon(Icons.edit),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      backgroundColor: StyleProjects().backgroundState,
      body: load
          ? const Center(child: ConfigProgress())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StyleProjects().boxTop2,
                  const Center(
                    child: ConfigTitle(
                      title: 'ข้อมูลส่วนบุคคลลูกค้า',
                    ),
                  ),
                  StyleProjects().boxTop2,
                  AvatarView(
                    radius: 75,
                    borderWidth: 8,
                    // borderColor: Color(0xff033674),
                    borderColor: const Color(0xfff8d800),
                    avatarType: AvatarType.CIRCLE,
                    backgroundColor: Colors.red,
                    imagePath: userModel!.images!,
                    placeHolder: const Icon(
                      Icons.person,
                      size: 50,
                    ),
                    errorWidget: Container(
                      child: const Icon(
                        Icons.error,
                        size: 50,
                      ),
                    ),
                  ),

                  /*
                  ShowImageAvatar(
                    urlImage: userModel!.images!,
                    size: 75,
                  ),
                  */

                  StyleProjects().boxTop2,
                  newLabel(head: 'ชื่อ :', value: userModel!.fname!),
                  newLabel(head: 'นามสกุล :', value: userModel!.lname!),
                  newLabel(head: 'ที่อยู่ :', value: userModel!.address!),
                  newLabel(head: 'ตำบล :', value: userModel!.subdistrict!),
                  newLabel(head: 'อำเภอ :', value: userModel!.district!),
                  newLabel(head: 'จังหวัด :', value: userModel!.province!),
                  newLabel(head: 'รหัสไปรษณีย์ :', value: userModel!.zipcode!),
                  newLabel(head: 'เบอร์โทรศัพท์ :', value: userModel!.phone!),
                  newLabel(head: 'Email :', value: userModel!.email!),
                ],
              ),
            ),
    );
  }

  Row newLabel({required String head, required String value}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ConfigText(
            lable: head,
            textStyle: StyleProjects().contentstyle2,
          ),
        ),
        Expanded(
          flex: 3,
          child: ConfigText(
            lable: value,
            textStyle: StyleProjects().contentstyle2,
          ),
        ),
      ],
    );
  }
}
