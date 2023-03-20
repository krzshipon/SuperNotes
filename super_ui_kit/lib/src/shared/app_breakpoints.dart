import 'package:responsive_framework/responsive_framework.dart';

enum DeviceScreenType {
  mobileS,
  mobileM,
  mobileL,
  tabletS,
  tabletM,
  tabletL,
  webS,
  webM,
  webL
}

List<ResponsiveBreakpoint> appBreakPoints = [
  ResponsiveBreakpoint.resize(320, name: DeviceScreenType.mobileS.name),
  ResponsiveBreakpoint.autoScale(400, name: DeviceScreenType.mobileM.name),
  ResponsiveBreakpoint.resize(425, name: DeviceScreenType.mobileL.name),
  ResponsiveBreakpoint.autoScale(550, name: DeviceScreenType.tabletS.name),
  ResponsiveBreakpoint.resize(600, name: DeviceScreenType.tabletM.name),
  ResponsiveBreakpoint.autoScale(900, name: DeviceScreenType.tabletL.name),
  ResponsiveBreakpoint.resize(1024, name: DeviceScreenType.webS.name),
  ResponsiveBreakpoint.autoScale(1440, name: DeviceScreenType.webM.name),
  ResponsiveBreakpoint.resize(1500, name: DeviceScreenType.webL.name),
];
