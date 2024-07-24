import 'package:chance_app/ui/pages/chat_page/blocs/room_cubit/room_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/blocs/select_cubit/select_cubit.dart';
import 'package:chance_app/ui/pages/chat_page/change_group_page.dart';
import 'package:chance_app/ui/pages/chat_page/chat_page.dart';
import 'package:chance_app/ui/pages/chat_page/chat_settings_page.dart';
import 'package:chance_app/ui/pages/chat_page/group_settings_page.dart';

import 'package:chance_app/ui/pages/chat_page/create_chat_page.dart';
import 'package:chance_app/ui/pages/chat_page/create_group_page.dart';
import 'package:chance_app/ui/pages/chat_page/new_chat_page.dart';
import 'package:chance_app/ui/pages/chat_page/new_group_page.dart';
import 'package:chance_app/ui/pages/chat_page/search_chat_page.dart';
import 'package:chance_app/ui/pages/chat_page/search_group_page.dart';
import 'package:chance_app/ui/pages/chats_page/chats_page.dart';
import 'package:chance_app/ui/pages/main_page/main_page.dart';
import 'package:chance_app/ui/pages/menu/menu_page.dart';
import 'package:chance_app/ui/pages/menu/pages/my_information.dart';
import 'package:chance_app/ui/pages/navigation/add_ward/add_ward.dart';
import 'package:chance_app/ui/pages/navigation/invitations/check_my_invitation/check_my_invitation.dart';
import 'package:chance_app/ui/pages/navigation/invitations/enter_accept_code/enter_accept_code.dart';
import 'package:chance_app/ui/pages/navigation/navigation_page/navigation_page.dart';
import 'package:chance_app/ui/pages/onboarding/onboarding_page.dart';
import 'package:chance_app/ui/pages/onboarding/onboarding_tutorial.dart';
import 'package:chance_app/ui/pages/reminders_page/reminders_page.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/calendar_task_page.dart';
import 'package:chance_app/ui/pages/reminders_page/tasks/tasks_for_today.dart';
import 'package:chance_app/ui/pages/sign_in_up/log_in/log_in_page.dart';
import 'package:chance_app/ui/pages/sign_in_up/log_in/reset_password.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/enter_code_for_register.dart';
import 'package:chance_app/ui/pages/sign_in_up/registration/registration_page.dart';

// import 'package:chance_app/ui/pages/sign_in_up/registration/subscription_page.dart';
import 'package:chance_app/ui/pages/sign_in_up/sign_in_up_page.dart';
import 'package:chance_app/ui/pages/sos_page/add_contact_screen.dart';
import 'package:chance_app/ui/pages/sos_page/add_group_screen.dart';
import 'package:chance_app/ui/pages/sos_page/main_page_sos.dart';
import 'package:chance_app/ui/pages/sos_page/replace_contact_sos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class AppRouter {
  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/main_page":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainPage(),
        );
      case "/signinup":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInUpPage(),
        );

      case "/registration":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegistrationPage(),
        );
      case "/login":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const LoginPage(),
        );
      case "/enter_code":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EnterCodeForRegister(),
        );
      // case "/subscription_page":
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const SubscriptionPage(),
      //   );
      case "/reminders":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RemindersPage(),
        );
      case "/date_picker_for_tasks":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CalendarTaskPage(),
        );
      // case "/add_medicine":
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => BlocProvider(
      //       create: (context) => AddMedicineBloc(),
      //       child: const AddMedicinePage(),
      //     ),
      //   );
      case "/reset_password":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ResetPassword(),
        );
      case "/tasks_for_today":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TasksForToday(),
        );
      case "/menu":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MenuPage(),
        );
      case "/sos":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainPageSos(),
        );
      case "/add_contact":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddContactScreen(),
        );
      case "/add_group":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddGroupScreen(),
        );
      case "/onboarding_page":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingPage(),
        );
      case "/onboarding_tutorial":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingTutorial(),
        );
      // case "/delete_edit_contact_sos":
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => const DeleteContactsPage(),
      //   );
      case "/my_information":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyInformation(),
        );
      case "/replace_contact_sos":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReplaceContactSosScreen(),
        );
      case "/navigation_page":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NavigationPage(),
        );
      case "/add_ward":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AddWard(),
        );
      case "/check_my_invitation":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CheckMyInvitation(),
        );
      case "/enter_accept_code":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EnterAcceptCode(),
        );
      case "/chats":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChatsPage(),
        );
      case "/create_chat":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateChatPage(),
        );
      case "/new_group":
        types.Room? room = args as types.Room?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => SelectCubit(
              list: room?.users ?? [],
            ),
            child: NewGroupPage(room: room),
          ),
        );
      case "/new_chat":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const NewChatPage(),
        );
      case "/chat":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider(
            create: (_) => RoomCubit(args as types.Room),
            child: const ChatPage(),
          ),
        );
      case "/search_chat":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SearchChatPage(),
        );

      case "/search_group":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => SelectCubit(list: args as List<types.User>),
              ),
            ],
            child: const SearchGroupPage(),
          ),
        );
      case "/create_group":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateGroupPage(
            selectedUsers: args as List<types.User>,
          ),
        );
      case "/chat_settings":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => ChatSettingsPage(
            room: args as types.Room,
          ),
        );
      case "/group_settings":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: args as RoomCubit,
            child: const GroupSettingsPage(),
          ),
        );
      case "/change_group":
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => BlocProvider.value(
            value: args as RoomCubit,
            child: const ChangeGroupPage(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Scaffold(),
        );
    }
  }
}
