import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tdvpnext/components/backend/admin/lists_admin.dart';
import 'package:tdvpnext/components/backend/news/lists_news.dart';
import 'package:tdvpnext/components/backend/products/list_products.dart';
import 'package:tdvpnext/components/backend/services/dashboard.dart';
import 'package:tdvpnext/components/frontend/guest/authentication/authentication.dart';
import 'package:tdvpnext/models/users_model.dart';
import 'package:tdvpnext/utility/config_logout.dart';
import 'package:tdvpnext/utility/config_text.dart';
import 'package:tdvpnext/utility/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminService extends StatefulWidget {
  @override
  _AdminServiceState createState() => _AdminServiceState();
}

class _AdminServiceState extends State<AdminService> {
  UserModel? userModel;
  Widget currentWidget = DashboardAdminPages(
    uid: '',
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        actions: <Widget>[
          ConfigLogout(),
          /*
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthenticationPage(),
                    ),
                    (Route<dynamic> route) => false);
              });
            },
          )
        */
        ],
      ),
      drawer: Drawer(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildUserAccountsDrawerHeader(),
                  buildListDataAdmin(),
                  buildListProducts(),
                  buildListPublishing(),
                  buildListTransportation(),
                  buildListPrinting(),
                  buildListNews(),
                  buildListAccount(),
                  buildListFilePDF(),
                ],
              ),
            ),
            blocklogout(),
          ],
        ),
      ),
      body: currentWidget,
    );
  }

  ListTile buildListDataAdmin() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.add_chart,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'ผู้ดูแลระบบ',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const DashboardAdminPages(uid: '',);
          //const ListsAdminPages();
        });
      },
    );
  }

  ListTile buildListProducts() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.add_chart,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'หมวดสินค้า/รายการสินค้า',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsProductsPages();
        });
      },
    );
  }

  ListTile buildListPublishing() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          //Icons.print_rounded,
          Icons.production_quantity_limits,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'การสั่งซื้อ/สั่งพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  ListTile buildListNews() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.new_label_sharp,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'ข่าวสาร',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  ListTile buildListTransportation() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.real_estate_agent,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'การขนส่ง',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  ListTile buildListPrinting() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.invert_colors,
          //Icons.add_task,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'ขั้นตอนการพิมพ์',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  ListTile buildListAccount() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.add_task,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'รายรับ-รายจ่าย',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  ListTile buildListFilePDF() {
    return ListTile(
      leading: IconButton(
        icon: new Icon(
          Icons.cloud_download,
          color: Colors.black,
        ),
        onPressed: () => null,
      ),
      title: const Text(
        'ไฟล์งาน',
        style: TextStyle(
          fontFamily: 'THSarabunNew',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          //color: const Color(0xFF000120),
          color: Colors.black,
        ),
      ),
      onTap: () {
        Navigator.pop(context);
        setState(() {
          currentWidget = const ListsNewsPages();
        });
      },
    );
  }

  UserAccountsDrawerHeader buildUserAccountsDrawerHeader() {
    return UserAccountsDrawerHeader(
      decoration: const BoxDecoration(
        image: DecorationImage(
          //image: AssetImage('assets/images/img00100.jpg'),
          //image: AssetImage('assets/images/img00100.jpg'),
          image: AssetImage('assets/images/pro901.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      currentAccountPicture: userModel == null
          ? Image.asset('assets/images/avatar.png')
          : const CircleAvatar(
              radius: 30.0,
              //backgroundImage: NetworkImage(userModel.images),
              /*
              backgroundImage:
                    NetworkImage("${snapshot.data.hitsList[index].images}"),
                backgroundColor: Colors.transparent,
              */

              //backgroundImage: NetworkImage('images'),
              backgroundColor: Colors.transparent,
            ),
      accountName: Row(
        children: [
          const Text(
            'คุณ',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'fname',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
      accountEmail: Row(
        children: [
          const Text(
            'อีเมล',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              //color: const Color(0xFF000120),
              color: Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'email',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.normal,
              //color: const Color(0xFF000120),
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Column blocklogout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            /*
            onTap: () async {
              Firebase.initializeApp().then((value) async {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationPage(),
                        ),
                        (route) => false));
              });
            },
            */
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: ConfigText(
                    lable: 'Exit',
                    textStyle: StyleProjects().alertstyle1,
                  ),
                  content: ConfigText(
                    lable: 'คุณต้องการออกจากระบบ ?',
                    textStyle: StyleProjects().alertstyle2,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const AuthenticationPage()));
                      },
                      child: Text(
                        'ใช่',
                        style: StyleProjects().alertstyle2,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'ไม่',
                        style: StyleProjects().alertstyle2,
                      ),
                    ),
                  ],
                ),
              );
            },
            leading: const Icon(
              Icons.exit_to_app,
              color: Color.fromARGB(255, 253, 253, 253),
            ),
            title: const Text(
              'ออกจากระบบ',
              style: TextStyle(
                fontFamily: 'THSarabunNew',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> findUserLogin() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance.authStateChanges().listen((event) async {
        String uid = event!.uid;
        print('uid ===>> $uid');
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(uid)
            .snapshots()
            .listen((event) {
          setState(() {});
        });
      });
    });
  }

  //
}
