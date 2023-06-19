import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/contents/categories.dart';
import 'package:url_launcher/url_launcher.dart';
import 'sidemenu.dart';

TextEditingController _textEditingController = TextEditingController();

final Uri urlDrugTrade = Uri.parse(
    'https://www.philstar.com/headlines/2021/06/28/2108575/illegal-drug-trade-back-business-usual-un');
final Uri urlImmigration = Uri.parse(
    'https://www.philstar.com/headlines/2023/06/09/2272647/immigration-echoes-interpols-declaration-global-threat-human-trafficking');
final Uri urlMurder =
    Uri.parse('https://www.doj.gov.ph/news_article.html?newsid=112');
final Uri urlCorruption = Uri.parse(
    'https://www.philstar.com/opinion/2022/09/10/2208694/corruption-cases-coming-out-one-one');
final Uri urlAbuse = Uri.parse(
    'https://philippines.unfpa.org/en/news/single-mother-mindanao-survives-domestic-abuse-earthquakes-and-covid-19');
final Uri urlCrimes = Uri.parse(
    'https://www.philstar.com/headlines/2019/02/24/1896274/18-million-pinoys-fell-victim-petty-crimes-sws');
final Uri urlRape = Uri.parse(
    'https://www.philstar.com/nation/2023/03/05/2249334/cop-gets-40-years-teens-rape');
final Uri urlExplosions =
    Uri.parse('https://www.bbc.com/news/world-asia-53895450');
final Uri urlTheft = Uri.parse(
    'https://newsinfo.inquirer.net/1740461/4-filipinos-face-raps-for-alleged-theft-1-still-at-large');
final Uri urlTrade = Uri.parse(
    'https://www.un.int/philippines/activities/ph-shares-government-efforts-challenges-curbing-illicit-trade-small-arms-and-light');

Map<String, Uri> urlMaps = {
  'Illegal drug trade back to business as usual - UN': urlDrugTrade,
  "Immigration echoes INTERPOL's declaration of 'global threat' of human trafficking":
      urlImmigration,
  'MURDER CHARGES FILED IN THE SEPTIC TANK LADY CASE': urlMurder,
  'Corruption cases coming out one by one': urlCorruption,
  'Single mother in Mindanao survives domestic abuse, earthquakes, and COVID-19':
      urlAbuse,
  '1.8 million Pinoys fell victim to petty crimes — SWS': urlCrimes,
  "Cop gets 40 years for teen's rape": urlRape,
  'Twin explosions have ripped through a town in a restive region of the southern Philippines, killing at least 14 people and wounding 75.':
      urlExplosions,
  '4 Filipinos face raps for alleged theft; 1 still at large': urlTheft,
  'PH shares government efforts, challenges in curbing illicit trade of small arms and light weapons at Third UNPoA Review Conference in New York':
      urlTrade,
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Future<bool> _androidBackBtn() async {
    return (await showDialog(
          context: context,
          builder: (context) => Theme(
            data: ThemeData.from(
              colorScheme: const ColorScheme.light(),
            ),
            child: AlertDialog(
              title: const Text('Confirm Quit'),
              content: const Text('Do you want to exit the App?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ),
        )) ??
        false;
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView,)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode textFieldFocus = FocusScope.of(context);
    double width = ScreenUtil().screenWidth;
    double height = ScreenUtil().screenHeight;

    return WillPopScope(
      onWillPop: _androidBackBtn,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: const SideMenu(),
        body: GestureDetector(
          onTap: () {
            if (!textFieldFocus.hasPrimaryFocus && textFieldFocus.hasFocus) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: SafeArea(
            child: Stack(
              children: [
                // TOP
                Container(
                  width: width,
                  height: height,
                  color: const Color(0xff028D8F),
                  // ** ITEMS HERE **
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 30.h),
                            Padding(
                              padding: EdgeInsets.only(left: 150.w),
                              child: Text(
                                "Legal Ease",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: "RobotoFlex",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textScaleFactor: 1.2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 190.w),
                              child: Text(
                                "Ius Criminales",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontFamily: "RobotoFlex",
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textScaleFactor: 1.2,
                              ),
                            ),
                            SizedBox(height: 38.h),
                            const _TextField(),
                            SizedBox(height: 18.h),
                            const GenerateBtn(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 47.h, left: 15.w),
                        child: Builder(
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                textFieldFocus.unfocus();
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                Icons.menu_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 11.h, left: 15.w),
                          child: Image.asset('assets/images/Logo.png',
                              width: 90.w, height: 90.h),
                        ),
                      )
                    ],
                  ),
                ),
                // MID
                Positioned(
                  top: 242.h, // 240
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: 350.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffF2F2F2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.r),
                        topRight: Radius.circular(25.r),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                          offset:
                              const Offset(0, -2), // offset the shadow downwards
                        ),
                      ],
                    ),
                    // ** ITEMS HERE **
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.h, left: 15.w),
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                fontFamily: "RobotoFlex",
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: const Color(0xff333333),
                              ),
                            ),
                          ),
                        ),
                        const ContentButtons()
                      ],
                    ),
                  ),
                ),
                // BOTTOM
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: ScreenUtil().screenWidth,
                    height: 290.h,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.r),
                        topRight: Radius.circular(15.r),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          height: 45.h,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            border: Border(
                              top: BorderSide(
                                width: 1.0,
                                color: Color(0x33000000),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 10.h, left: 15.w),
                            child: Text(
                              "Related Cases",
                              style: TextStyle(
                                fontFamily: "RobotoFlex",
                                fontWeight: FontWeight.w500,
                                fontSize: 20.sp,
                                color: const Color(0xff333333),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: const Color(0xFFFFFFFF),
                            width: width,
                            height: 246.h,
                            child: ListView.builder(
                              itemCount: urlMaps.length,
                              itemBuilder: (context, int index) {
                                String title = urlMaps.keys.elementAt(index);
                                Uri url = urlMaps.values.elementAt(index);
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        title.toUpperCase(),
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: const Color(0xff000000),
                                            fontSize: 16.sp,
                                            fontFamily: "RobotoFLex"),
                                      ),
                                      onTap: () {
                                        _launchUrl(url);
                                      },
                                    ),
                                    const Divider(
                                      indent: 15,
                                      endIndent: 15,
                                      //thickness: 5,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  const _TextField();

  @override
  State<_TextField> createState() => __TextFieldState();
}

class __TextFieldState extends State<_TextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE8E8E8),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      width: 360.w,
      height: 59.h,
      child: TextField(
        controller: _textEditingController,
        focusNode: _focusNode,
        minLines: 1,
        maxLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 20.0,
            top: _focusNode.hasFocus ? 10.0 : 5.0,
            bottom: _focusNode.hasFocus ? 10.0 : 0.0,
          ),
          labelText: _focusNode.hasFocus ? "Enter concerns" : "Consultation",
          labelStyle: TextStyle(
            color:
                _focusNode.hasFocus ? Colors.black45 : const Color(0xff0C2924),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class GenerateBtn extends StatelessWidget {
  const GenerateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 40.h,
      child: ElevatedButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(const Color(0xffF2F2F2)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              // side: const BorderSide(
              //   color: Color(0xff97a294),
              // ),
            ),
          ),
        ),
        onPressed: () {
          // !final
          _textEditingController.clear();
        },
        child: const Text(
          "Submit",
          style: TextStyle(color: Color(0xff000000)),
        ),
      ),
    );
  }
}

class RelatedCases extends StatelessWidget {
  const RelatedCases({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.w),
            child: Text(
              "Random text here. Dont mind it ",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff000000),
                  fontSize: 16.sp,
                  fontFamily: "RobotoFLex"),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.w),
            child: Text(
              "Random text here. Dont mind it example only example only.",
              style: TextStyle(
                  color: const Color(0xff000000),
                  fontSize: 12.sp,
                  fontFamily: "RobotoFLex"),
            ),
          ),
          const Divider(
              // indent: 15,
              // endIndent: 15,
              //thickness: 5,
              ),
        ],
      ),
    );
  }
}
