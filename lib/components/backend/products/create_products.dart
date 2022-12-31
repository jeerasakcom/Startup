import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tdvpnext/models/products_model.dart';
import 'package:tdvpnext/utility/category_constant.dart';
import 'package:tdvpnext/utility/dailog.dart';
import 'package:tdvpnext/utility/style.dart';
import 'package:tdvpnext/utility/category_constant.dart';
import 'package:tdvpnext/utility/style.dart';

class CreateProductPages extends StatefulWidget {
  const CreateProductPages({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateProductPagesState createState() => _CreateProductPagesState();
}

class _CreateProductPagesState extends State<CreateProductPages> {
  File? file;
  String? code, name, price, detail, quantity, category, images;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: StyleProjects().primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: height,
          child: Column(
            children: [
              StyleProjects().boxTop1,
              blockheader(),
              StyleProjects().boxheight1,
              blockprocate(),
              StyleProjects().boxheight1,
              blockproid(),
              StyleProjects().boxheight1,
              blockproname(),
              StyleProjects().boxheight1,
              blockprodetail(),
              StyleProjects().boxheight1,
              blockproprice(),
              StyleProjects().boxheight1,
              blockproquantity(),
              StyleProjects().boxheight1,
              blockImg(),
              StyleProjects().boxheight1,
              blockSaveButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget blockheader() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Text(
            'เพิ่มแบบพิมพ์ใหม่',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockprocate() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'หมวดสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000f3b),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: DropdownButton<String>(
                  value: category,
                  items: DataCategory()
                      .positions
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                              fontFamily: 'THSarabunNew',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000f3b),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      category = value;
                    });
                  },
                  hint: const Text(
                    'กรุณาเลือกหมวดสินค้าค่ะ',
                    style: TextStyle(
                      fontFamily: 'THSarabunNew',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFD80000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockproid() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'รหัสสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000f3b),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 200,
                height: 35,
                child: TextField(
                  onChanged: (value) => code = value.trim(),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Color(0xff000f3b),
                    )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockproname() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'ชื่อสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 2,
            minLines: 1,
            onChanged: (value) => name = value.trim(),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockprodetail() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'รายละเอียด',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000f3b),
                ),
              ),
            ],
          ),
          TextFormField(
            maxLines: 5,
            minLines: 2,
            onChanged: (value) => detail = value.trim(),
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xff000f3b),
              )),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Required';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget blockproprice() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            'ราคา',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff000f3b),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 100,
            height: 35,
            child: TextField(
              onChanged: (value) => price = value.trim(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff000f3b),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'บาท',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockproquantity() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          const Text(
            'จำนวน',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff000f3b),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 100,
            height: 35,
            child: TextField(
              onChanged: (value) => quantity = value.trim(),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Color(0xff000f3b),
                )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'เล่ม',
            style: TextStyle(
              fontFamily: 'THSarabunNew',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff000f3b),
            ),
          ),
        ],
      ),
    );
  }

  Widget blockImg() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'ภาพสินค้า',
                style: TextStyle(
                  fontFamily: 'THSarabunNew',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff000f3b),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.add_a_photo,
                  color: Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.camera),
              ),
              SizedBox(
                width: 150,
                height: 150,
                child: file == null
                    ? Image.asset(
                        'assets/images/productsimg.png',
                      )
                    : Image.file(file!),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_photo_alternate,
                  color: Color(0xff000f3b),
                ),
                onPressed: () => chooseImage(ImageSource.gallery),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget blockSaveButton() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color(0xFF459522),
          ),
        ),
        child: Text(
          "บันทึก",
          style: StyleProjects().topicstyle3,
          /*
          style: TextStyle(
            fontFamily: 'THSarabunNew',
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Color(0xffffffff),
          ),
          */
        ),
        onPressed: () {
          if (file == null) {
            normalDialog(context, 'กรุณาเลือก รูปภาพด้วย คะ');
          } else if (code == null ||
              code!.isEmpty ||
              name == null ||
              name!.isEmpty ||
              price == null ||
              price!.isEmpty ||
              detail == null ||
              detail!.isEmpty ||
              quantity == null ||
              quantity!.isEmpty ||
              category == null ||
              category!.isEmpty) {
            normalDialog(context, 'กรุณากรอก ทุกช่อง คะ');
          } else {
            processUploadAndInsertData();
          }
        },
      ),
    );
  }

// img
  Future<Null> chooseImage(ImageSource imageSource) async {
    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );
    file = File(result!.path);
    setState(() {});
  }

  Row imageGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.add_a_photo,
              color: Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.camera),
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: file == null
                ? Image.asset(
                    'assets/images/newspic002.jpg',
                  )
                : Image.file(file!),
          ),
          IconButton(
            icon: const Icon(
              Icons.add_photo_alternate,
              color: Color(0xff000f3b),
            ),
            onPressed: () => chooseImage(ImageSource.gallery),
          ),
        ],
      );

  ///create db
  Future<void> processUploadAndInsertData() async {
    String nameFile = 'products${Random().nextInt(100000)}.jpg';
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    Reference reference = firebaseStorage.ref().child('product/$nameFile');
    UploadTask uploadTask = reference.putFile(file!);
    await uploadTask.whenComplete(() async {
      await reference.getDownloadURL().then((value) async {
        String images = value;
        ProductModel productModel = ProductModel(
            code: int.parse(code!),
            name: name!,
            detail: detail!,
            price: int.parse(price!),
            quantity: int.parse(quantity!),
            category: category!,
            images: images);

        await FirebaseFirestore.instance
            .collection('products')
            .doc()
            .set(productModel.toMap())
            .then((value) => Navigator.pop(context));
      });
    });
  }
}
