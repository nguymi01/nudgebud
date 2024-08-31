import 'package:flutter/material.dart';
import 'package:flutterdemo/base/pages/available_friends_page/available_friends_page.dart';
import 'package:flutterdemo/base/pages/calendar_expanded_page/calendar_expanded_page.dart';
import 'package:flutterdemo/base/pages/calendar_expanded_page/nudge_filter_page/nudge_filter_page.dart';
import 'package:flutterdemo/base/pages/calendar_landing_page/calendar_landing_page.dart';
import 'package:flutterdemo/base/pages/event_rsvp_details_page/event_rsvp_detail_page.dart';
import 'package:flutterdemo/base/pages/homepage/homepage.dart';
import 'package:flutterdemo/base/pages/inbox_views_page/inbox_view_page.dart';
import 'package:flutterdemo/base/pages/login_page/login_page.dart';
import 'package:flutterdemo/base/pages/login_page/login_screen/login_screen.dart';
import 'package:flutterdemo/base/pages/nudges_inbox_page/nudge_inbox_page.dart';
import 'package:flutterdemo/base/pages/send_nudge_page/send_nudge_page.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/birthday/birthday_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/gender_form/gender_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/location/location_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/sign_up_form.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_page.dart';
import 'package:flutterdemo/base/pages/sign_up_page/sign_up_form/photo_form/profile_photo_form.dart';
import 'package:flutterdemo/base/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();

  runApp(App());
}

class App extends StatelessWidget {
  // const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'home',

      onGenerateRoute: (RouteSettings settings) => routeSettings(settings),
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const<LocalizationsDelegate<dynamic>>[
      //   GlobalM
      // ],
    );
  }
}

MaterialPageRoute<dynamic> routeSettings(RouteSettings settings) {
  final Map<String, dynamic> data =
      settings.arguments as Map<String, dynamic>? ?? {};
  switch (settings.name) {
    case RoutesName.calendarLandingPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CalendarLandingPage(
          numEvents: data['numEvents'],
          today: data['today'],
        ),
        settings: const RouteSettings(name: RoutesName.calendarLandingPage),
      );
    case RoutesName.calendarExpandedPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => CalendarExpandedPage(
          numEvents: data['numEvents'],
          today: data['today'],
        ),
        settings: const RouteSettings(name: RoutesName.calendarExpandedPage),
      );
    case RoutesName.nudgeFilterPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => NudgeFilter(),
        settings: const RouteSettings(name: RoutesName.nudgeFilterPage),
      );
    case RoutesName.nudgeInboxPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => NudgeInboxPage(),
        settings: const RouteSettings(name: RoutesName.nudgeInboxPage),
      );
    case RoutesName.availableFriendsPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => AvailableFriendsPage(),
        settings: const RouteSettings(name: RoutesName.availableFriendsPage),
      );
    case RoutesName.sendNudgePage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => SendNudgePage(
          selectedFriends: data['selectedFriends'],
        ),
        settings: const RouteSettings(name: RoutesName.sendNudgePage),
      );
    case RoutesName.inboxViewPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => InboxViewPage(),
        settings: const RouteSettings(name: RoutesName.inboxViewPage),
      );
    case RoutesName.eventRSVPDetailPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => EventRSVPDetailPage(
          nudge: data['nudgeWidget'],
        ),
        settings: const RouteSettings(name: RoutesName.eventRSVPDetailPage),
      );
    case RoutesName.signUpPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => SignUpPage(),
        settings: const RouteSettings(name: RoutesName.signUpPage),
      );
    case RoutesName.loginPage:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => LoginPage(),
        settings: const RouteSettings(name: RoutesName.loginPage),
      );
    case RoutesName.loginView:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => LoginScreen(),
        settings: const RouteSettings(name: RoutesName.loginView),
      );
    case RoutesName.signUpForm:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => SignUpForm(),
        settings: const RouteSettings(name: RoutesName.signUpForm),
      );
    case RoutesName.signUpGenderForm:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => GenderForm(),
        settings: const RouteSettings(name: RoutesName.signUpGenderForm),
      );
    case RoutesName.signUpBirthdayForm:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => BirthdayForm(),
        settings: const RouteSettings(name: RoutesName.signUpBirthdayForm),
      );
    case RoutesName.signupLocationForm:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => LocationForm(),
        settings: const RouteSettings(name: RoutesName.signupLocationForm),
      );
    case RoutesName.signupProfilePhotoForm:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => ProfilePhotoForm(),
        settings: const RouteSettings(name: RoutesName.signupProfilePhotoForm),
      );
    default:
      return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => HomePage(),
        settings: const RouteSettings(name: 'home'),
      );
  }
}
