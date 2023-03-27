import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nuri_app/utils/dimensions.dart';
import 'package:intl/date_symbol_data_local.dart';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.width16,
              right: Dimensions.width16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                onTap: () {
                                  print("Aku Mau Baca Qur'an");
                                },
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
                            "Jagal lidahmu sebagaimana kamu merawat emas dan perak.",
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
                    "Jadwal Sholat",
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontSize: Dimensions.font14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
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
                                "Saat ini Waktu",
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF035A2F),
                                ),
                              ),
                              Text(
                                "Waktu Saat ini",
                                style: GoogleFonts.getFont(
                                  "Poppins",
                                  fontSize: Dimensions.font14,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF035A2F),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.width10 / 2,
                              right: Dimensions.width10 / 2,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "17:45",
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    fontSize: Dimensions.font24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEDC855),
                                  ),
                                ),
                                Text(
                                  "Ashar",
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    fontSize: Dimensions.font24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEDC855),
                                  ),
                                ),
                                Text(
                                  waktuHariIni,
                                  style: GoogleFonts.getFont(
                                    "Poppins",
                                    fontSize: Dimensions.font24,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEDC855),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
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
    if (dataJam == '18:10' &&
        dataJam == '19:00' &&
        dataJam == '20:00' &&
        dataJam == '21:00' &&
        dataJam == '22:00' &&
        dataJam == '23:00' &&
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
