import 'package:primecustomer/res/config/size_config.dart';

class AppDimens {
  static double h1 = getSize(28, 3.6);
  static double h2 = getSize(24, 3.2);
  static double h3 = getSize(20, 2.8);
  static double h4 = getSize(17.5, 2.6);
  static double h5 = getSize(17, 2.2);
  static double title = getSize(16, 2.0);
  static double desc = getSize(14, 1.8);
  static double subDesc = getSize(12, 1.6);
  static double subMidDesc = getSize(13, 1.7);
  static double smallSubDesc = getSize(10, 1.4);
  static double smallestSubDesc = getSize(8, 1.0);
  static double smallerSubDesc = getSize(9, 1.2);

  //Custom dimensions
  static double dimen1 = getSize(1, 0.05);
  static double dimen2 = getSize(2, 0.25);
  static double dimen3 = getSize(3, 0.4);
  static double dimen4 = getSize(4, 0.6);
  static double dimen5 = getSize(10, 0.8);
  static double dimen6 = getSize(10, 0.8);

  static double dimen1_4 = getSize(1.4, 0.18);
  static double dimen1_3 = getSize(1.3, 0.15);
  static double dimen1_8 = getSize(1.8, 0.30);
  static double dimen0_13 = getSize(0.13, 0.017);
  static double dimen0_18 = getSize(0.18, 0.027);
  static double dimen0_11 = getSize(0.11, 0.015);
  static double dimen10 = getSize(10, 1.5);
  static double dimen9 = getSize(9, 1.3);
  static double dimen12 = getSize(12, 1.7);

  static double dimen13 = getSize(13, 1.7);
  static double dimen32 = getSize(32, 4.2);
  static double dimen35 = getSize(35, 4.8);
  static double dimen36 = getSize(36, 4.9);
  static double dimen100 = getSize(100, 12);
  static double dimen105 = getSize(105, 13);
  static double dimen110 = getSize(110, 14);
  static double dimen115 = getSize(115, 15);
  static double dimen400 = getSize(400, 48);
  static double dimen380 = getSize(380, 46);
  static double dimen350 = getSize(350, 40);
  static double dimen330 = getSize(330, 38);
  static double dimen90 = getSize(90, 10);
  static double dimen92 = getSize(90, 10.2);
  static double dimen95 = getSize(95, 11);
  static double dimen120 = getSize(120, 16);
  static double dimen125 = getSize(120, 16.8);
  static double dimen150 = getSize(150, 20);
  static double dimen135 = getSize(135, 18);
  static double dimen160 = getSize(150, 22);
  static double dimen500 = getSize(500, 70);
  static double dimen600 = getSize(600, 80);
  static double dimen130 = getSize(130, 17.5);
  static double dimen140 = getSize(130, 18.5);
  static double dimen145 = getSize(130, 19);
  static double dimen170 = getSize(170, 24);
  static double dimen240 = getSize(240, 32);
  static double dimen250 = getSize(250, 33);
  static double dimen260 = getSize(260, 34);
  static double dimen270 = getSize(270, 35);
  static double dimen220 = getSize(220, 30);
  static double dimen200 = getSize(200, 28);
  static double dimen180 = getSize(180, 26);
  static double dimen190 = getSize(190, 27);
  static double dimen300 = getSize(300, 38);
  static double dimen280 = getSize(280, 36);
  static double dimen290 = getSize(280, 37);
  static double dimen230 = getSize(230, 31);
  static double dimen60 = getSize(60, 8);
  static double dimen65 = getSize(65, 8.5);
  static double dimen62 = getSize(62, 9);
  static double dimen70 = getSize(70, 9);
  static double dimen75 = getSize(75, 9);
  static double dimen77 = getSize(75, 9.5);
  static double dimen80 = getSize(80, 10);
  static double dimen30 = getSize(30, 4);
  static double dimen20 = getSize(20, 2.8);
  static double dimen22 = getSize(22, 2.9);
  static double dimen25 = getSize(25, 3.4);
  static double dimen28 = getSize(28, 3.6);
  static double dimen26 = getSize(26, 3.5);
  static double dimen24 = getSize(24, 3.3);
  static double dimen15 = getSize(15, 2);
  static double dimen16 = getSize(16, 2.2);
  static double dimen18 = getSize(18, 2.4);
  static double dimen17 = getSize(17, 2.3);
  static double dimen19 = getSize(19, 2.6);
  static double dimen8 = getSize(8, 1.1);
  static double dimen40 = getSize(40, 5.2);
  static double dimen38 = getSize(38, 5.0);
  static double dimen45 = getSize(45, 5.5);
  static double dimen48 = getSize(48, 6.0);
  static double dimen50 = getSize(50, 6.3);
  static double dimen55 = getSize(55, 7.5);
  static double dimen52 = getSize(52, 6.7);

  static double dimen14 = getSize(14, 1.9);

  static double size(double factor) {
    return getSize(12, factor);
  }

  static double getSize(double defaultValue, double multiplier) {
    return SizeConfig.scaleFactor == 0.0
        ? defaultValue
        : SizeConfig.scaleFactor * multiplier * 1.9;
  }

  static double widthQuarter() {
    return (SizeConfig.screenWidth / 4.2);
  }

  static double widthCell() {
    return SizeConfig.screenWidth / 4;
  }
}
