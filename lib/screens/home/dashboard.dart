import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuri_app/screens/quran/quran.dart';
import 'package:nuri_app/utils/dimensions.dart';
import 'package:intl/intl.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  double _height = Dimensions.pageViewContainer;
  String hariIni = DateFormat.yMMMMd('id').format(DateTime.now());
  String waktuHariIni = DateFormat("HH:mm").format(DateTime.now());
  String timerReal = DateFormat('HH:mm:ss').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi Muhamad Nur,",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          _logicWelcome()
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/image/woman.jpg"),
                      ),
                    ],
                  ),
                ),
                // Baca Al Quran
                Stack(
                  children: [
                    SizedBox(
                      child: Container(
                        height: Dimensions.height30 * 7,
                        margin: EdgeInsets.only(
                          top: Dimensions.height20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Color(0xFF035A2F),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF035A2F).withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        // top: Dimensions.height15,
                        bottom: Dimensions.height15,
                        left: Dimensions.width16,
                        right: Dimensions.width16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                "assets/image/quran_read.png",
                                width: Dimensions.width10 * 15,
                                height: Dimensions.height10 * 15,
                              ),
                              GestureDetector(
                                onTap: () =>
                                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) => QuranPage())),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: Dimensions.height20 * 2),
                                  padding: EdgeInsets.all(Dimensions.width10 / 1.2),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius20 / 2),
                                      color: Colors.white),
                                  child: Text(
                                    "Baca Qur'an",
                                    style: GoogleFonts.getFont(
                                      'Poppins',
                                      color: Color(0xFF035A2F),
                                      fontSize: Dimensions.font14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Jaga lidahmu sebagaimana kamu merawat emas dan perak.",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: Dimensions.font14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "- Ali bin Abi Thalib.",
                            style: GoogleFonts.getFont(
                              'Poppins',
                              fontSize: Dimensions.font14,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                  ),
                  child: Text(
                    "DKI Jakarta",
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                // Jadwal Hari Ini
                Stack(
                  children: [
                    SizedBox(
                      child: Container(
                        height: Dimensions.height30 * 4,
                        margin: EdgeInsets.only(
                          top: Dimensions.height20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: Dimensions.height30,
                        bottom: Dimensions.height15,
                        left: Dimensions.width16,
                        right: Dimensions.width16,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Hari ini",
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Text(
                                "$hariIni",
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Adzan Magrib",
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      fontSize: Dimensions.font14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF035A2F),
                                    ),
                                  ),
                                  Text(
                                    "17:45",
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFEDC855),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Saat ini Waktu",
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      fontSize: Dimensions.font14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF035A2F),
                                    ),
                                  ),
                                  Text(
                                    "Ashar",
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      fontSize: Dimensions.font20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFEDC855),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Waktu Saat ini",
                                    style: GoogleFonts.getFont(
                                      "Poppins",
                                      fontSize: Dimensions.font14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF035A2F),
                                    ),
                                  ),
                                  StreamBuilder(
                                    stream: Stream.periodic(const Duration(seconds: 1)),
                                    builder: (context, snapshot) {
                                      return Text(
                                        DateFormat('HH:mm:ss').format(DateTime.now()),
                                        style: GoogleFonts.getFont(
                                          "Poppins",
                                          fontSize: Dimensions.font20,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFFEDC855),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: Dimensions.height20,
                  ),
                  child: Text(
                    "Jadwal Sholat",
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  height: 480,
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: 3.5 / 4,
                    crossAxisCount: 2,
                    children: [
                      // Subuh
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.height15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF035A2F),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF035A2F).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height15,
                            left: Dimensions.width16,
                            right: Dimensions.width16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "05:00 AM",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Waktu Sholat Subuh",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                "assets/image/cloudy_night.png",
                                width: Dimensions.width10 * 15,
                                height: Dimensions.height10 * 12,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Dzuhur
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.height15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height15,
                            left: Dimensions.width16,
                            right: Dimensions.width16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12:00 PM",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF035A2f),
                                ),
                              ),
                              Text(
                                "Waktu Sholat Dzuhur",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF035A2f),
                                ),
                              ),
                              Image.asset(
                                "assets/image/day_cloud.png",
                                width: Dimensions.width10 * 15,
                                height: Dimensions.height10 * 12,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Ashar
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.height15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height15,
                            left: Dimensions.width16,
                            right: Dimensions.width16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "15:00 PM",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF035A2f),
                                ),
                              ),
                              Text(
                                "Waktu Sholat Ashar",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF035A2f),
                                ),
                              ),
                              Image.asset(
                                "assets/image/day_cloud.png",
                                width: Dimensions.width10 * 15,
                                height: Dimensions.height10 * 12,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Isya
                      Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.height15,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xFF035A2F),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF035A2F).withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            top: Dimensions.height15,
                            left: Dimensions.width16,
                            right: Dimensions.width16,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "18:00 AM",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Waktu Sholat Isya",
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontSize: Dimensions.font12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Image.asset(
                                "assets/image/cloudy_night.png",
                                width: Dimensions.width10 * 15,
                                height: Dimensions.height10 * 12,
                                alignment: Alignment.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _logicWelcome() {
    String dataJam = DateFormat("HH:mm").format(DateTime.now());
    if (dataJam == '18:10' ||
        dataJam == '19:20' ||
        dataJam == '20:00' ||
        dataJam == '21:00' ||
        dataJam == '22:00' ||
        dataJam == '23:00' ||
        dataJam == '00:00') {
      return Text(
        "Selamat Berbuka!",
        style: GoogleFonts.getFont(
          'Poppins',
          fontSize: Dimensions.font14,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (dataJam == '01:00' && dataJam == '02:00' && dataJam == '03:00' && dataJam == '04:00') {
      return Text(
        "Selamat Sahur!",
        style: GoogleFonts.getFont(
          'Poppins',
          fontSize: Dimensions.font14,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      return Text(
        "Selamat Berpuasa!",
        style: GoogleFonts.getFont(
          'Poppins',
          fontSize: Dimensions.font14,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}
