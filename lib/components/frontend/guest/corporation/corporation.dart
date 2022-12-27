import 'package:flutter/material.dart';
import 'package:tdvpnext/utils/style.dart';






class CorporationPages extends StatefulWidget {
  const CorporationPages({super.key});

  @override
  State createState() => CorporationPagesState();
}

class CorporationPagesState extends State<CorporationPages>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 238, 255),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                elevation: 0,
                expandedHeight: 175,
                leading: const BackButton(
                  color: Colors.black87,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/cbg.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    indicatorColor: const Color(0xff04066b),
                    labelColor: const Color(0xff04066b),
                    unselectedLabelColor: const Color(0xff011298),
                    labelStyle: StyleProjects().topicstyle6,
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      const Tab(
                        text: 'คณะผู้บริหาร',
                      ),
                      const Tab(
                        text: 'วิสัยทัศน์/พันธกิจ',
                      ),
                      const Tab(
                        text: 'ประวัติองค์กร',
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },

          //tab
          body: TabBarView(
              //controller: _tabController,
              children: [
                //1new
                Container(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const SizedBox(height: 20),
                            Column(
                              children: <Widget>[
                                Text(
                                  'คณะกรรมการบริหาร\n'
                                  'โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง',
                                  textAlign: TextAlign.center,
                                  style: StyleProjects().topicstyle6,
                                ),
                              ],
                            ),

                            //
                            StyleProjects().boxheight1,
                            //1
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/c10.jpg',
                                        height: 100,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'นายธนาคม จงจิระ',
                                            textAlign: TextAlign.center,
                                            style:
                                                StyleProjects().contentstyle5,
                                          ),
                                          Text(
                                            'อธิบดีกรมการปกครอง',
                                            textAlign: TextAlign.center,
                                            style:
                                                StyleProjects().contentstyle5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            StyleProjects().boxheight1,

                            //2
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/c9.jpg',
                                        height: 100,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'นายสมชาย เกียรติก้องแก้ว',
                                            textAlign: TextAlign.center,
                                            style:
                                                StyleProjects().contentstyle5,
                                          ),
                                          Text(
                                            'ผอ.โรงพิมพ์อาสารักษาดินแดน',
                                            textAlign: TextAlign.center,
                                            style:
                                                StyleProjects().contentstyle5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //

                            StyleProjects().boxheight1,

                            //3
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/c8-1.jpg',
                                            height: 100,
                                          ),
                                          Column(
                                            children: <Widget>[
                                              Text(
                                                'ร.ท.ภัทรชัย ขันธหิรัญ',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                              Text(
                                                'ผช.ผอ.(ฝ่ายการค้า)',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/c8-2.jpg',
                                            height: 100,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'นายกฤษดา โลศิริ',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                              Text(
                                                'ผช.ผอ.(ฝ่ายการพิมพ์)',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            StyleProjects().boxheight1,

                            //4
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/logo2.jpg',
                                            height: 100,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'นายจงรัก เพชรเสน',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                              Text(
                                                'ผช.ผอ.(ฝ่ายบริหาร)',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/c8-3.jpg',
                                            height: 100,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                'นายสิทธิพร คงหอม',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                              Text(
                                                'ผช.ผอ.(ฝ่ายการเงินและบัญชี)',
                                                textAlign: TextAlign.center,
                                                style: StyleProjects()
                                                    .contentstyle5,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            StyleProjects().boxheight1,

                            //5
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Image.asset(
                                                'assets/images/c8-4.jpg',
                                                height: 100,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'นายอมรศักดิ์ ธีระนานนท์',
                                                    textAlign: TextAlign.center,
                                                    style: StyleProjects()
                                                        .contentstyle5,
                                                  ),
                                                  Text(
                                                    'เลขานุการคณะกรรมการฯ',
                                                    textAlign: TextAlign.center,
                                                    style: StyleProjects()
                                                        .contentstyle5,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            StyleProjects().boxheight1,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //2new
                Stack(
                  children: [
                    /*
                    Container(
                      child: StyleProjects().bgdataCorp(),
                    ),
                    */
                    ListView(
                      padding: const EdgeInsets.all(20),
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            color: const Color(0xfffffdfd),
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                            //
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                const ListTile(
                                  leading: Icon(
                                    Icons.check_circle,
                                    //color: const Color(0xff2c6cdf),
                                    color: Color(0xff369000),
                                  ),
                                  title: Text(
                                    'วิสัยทัศน์ (Vision)',
                                    style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                      //color: Color(0xFF090943),
                                      color: Color(0xff900036),
                                      //color: const Color(0xff002055),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    '"ยุคใหม่ รวดเร็ว ทันสมัย ก้าวไกลสู่สากล"',
                                    style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      //color: const Color(0xff900036),
                                      //color: const Color(0xff9b194a),
                                      //color: Color(0xFF090943),
                                      //color: Color(0xFF0040aa),
                                      color: Color(0xFFdd0053),
                                    ),
                                  ),
                                ),
                                /*
                              Image.asset(
                                'assets/images/cc100.jpeg',
                                height: 100,
                              ),
                              */

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Card(
                            color: const Color(0xfffffdfd),
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                            margin: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const ListTile(
                                  leading: Icon(
                                    Icons.check_circle,
                                    //color: const Color(0xff2c6cdf),
                                    color: Color(0xff369000),
                                  ),
                                  title: Text(
                                    'พันธกิจ (Mission)',
                                    style: TextStyle(
                                      fontFamily: 'THSarabunNew',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26,
                                      //color: Color(0xFF090943),
                                      color: Color(0xff900036),
                                      //color: const Color(0xff002055),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Text(
                                        "- ใส่ใจในลูกค้าและบริการ",
                                        style: TextStyle(
                                          fontFamily: 'THSarabunNew',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          //color: const Color(0xff900036),
                                          //color: Color(0xFF090943),
                                          color: Color(0xFFdd0053),
                                        ),
                                      ),
                                      const Text(
                                        '- ให้บริการแบบพิมพ์อย่างมีคุณภาพ',
                                        style: TextStyle(
                                          fontFamily: 'THSarabunNew',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          //color: const Color(0xff900036),
                                          //color: Color(0xFF090943),
                                          color: Color(0xFFdd0053),
                                        ),
                                      ),
                                      const Text(
                                        '- งานพิมพ์ระดับสากล',
                                        style: TextStyle(
                                          fontFamily: 'THSarabunNew',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          //color: const Color(0xff900036),
                                          //color: Color(0xFF090943),
                                          color: Color(0xFFdd0053),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                /*
                              Image.asset('assets/images/bg815.jpg',height: 100,),
                              */

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                //3new
                Stack(
                  children: [
                    /*
                    Container(
                      child: StyleProjects().bgdataCorp(),
                    ),
                    */
                    SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/images/b14.jpg',
                                fit: BoxFit.cover,
                                height: 150,
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                StyleProjects().boxheight1,
                                Center(
                                  child: Text(
                                    "ประวัติโรงพิมพ์อาสารักษาดินแดน",
                                    textAlign: TextAlign.center,
                                    style: StyleProjects().topicstyle2,
                                  ),
                                ),
                                StyleProjects().boxheight1,
                                Text(
                                  '   ในปีพ.ศ.2500 องค์การบริหารวิเทศกิจ(U.S.O.M.) ได้ให้ความช่วยเหลือในการก่อตั้งได้โอนกิจการให้กรมมหาดไทย โดยใช้ชื่อในการดำเนินกิจการเป็น “โรงพิมพ์กรมมหาดไทย” และได้เปลี่ยนชื่อเป็น “โรงพิมพ์ส่วนท้องถิ่น กรมการปกครอง” โดยมีการแต่งตั้งผู้อำนวยการคนแรกคือ นายพัฒน์ พินทุโยธิน ',
                                  style: StyleProjects().contentstyle5,
                                ),
                                Text(
                                  '   ในปีพ.ศ.2551 ได้เปลี่ยนชื่อมาใช้ “โรงพิมพ์อาสารักษาดินแดน กรมการปกครอง” จนถึงปัจจุบัน และได้ยึดถือว่าวันที่ 28 กันยายนของทุกปี เป็น "วันคล้ายวันสถาปนาของโรงพิมพ์อาสารักษาดินแดน กรมการปกครอง กระทรวงมหาดไทย"',
                                  style: StyleProjects().contentstyle5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromARGB(255, 215, 238, 255),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
