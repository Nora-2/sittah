import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glasses/core/routing/routes.dart';
import 'package:glasses/core/utils/widgets/geustlayout.dart';
import 'package:glasses/core/utils/widgets/mainlayout.dart';
import 'package:glasses/features/authantication/presentation/cubit/authantication_cubit.dart';
import 'package:glasses/features/authantication/presentation/pages/auth_screen.dart';
import 'package:glasses/features/authantication/presentation/widgets/new_password.dart';
import 'package:glasses/features/authantication/presentation/widgets/otp_password.dart';
import 'package:glasses/features/authantication/presentation/widgets/password.dart';
import 'package:glasses/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:glasses/features/cart/presentation/pages/cartscreen.dart';
import 'package:glasses/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:glasses/features/checkout/presentation/pages/checkout.dart';
import 'package:glasses/features/home/presentation/pages/notification_list_screen.dart';
import 'package:glasses/features/home/presentation/widgets/one_category_view.dart';
import 'package:glasses/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:glasses/features/onboarding/presentation/pages/on_boarding_screen.dart';
import 'package:glasses/features/onboarding/presentation/pages/signin_signup.dart';
import 'package:glasses/features/product/presentation/pages/Lens_Prescription_Order_Flow.dart';
import 'package:glasses/features/product/presentation/pages/frame_choose.dart';
import 'package:glasses/features/product/presentation/pages/product_details_screen.dart';
import 'package:glasses/features/product/presentation/widgets/tryit.dart';
import 'package:glasses/features/search/presentation/cubit/search_cubit.dart';
import 'package:glasses/features/search/presentation/pages/search.dart';
import 'package:glasses/features/spalsh/presentation/pages/spalshscreen.dart';

class AppRouter {
  

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => SplashScreen()
        );
        case Routes.lensTypeScreen:
        return MaterialPageRoute(
          builder: (_) => const LensTypeScreen(stepNumber: 1,), 
        );
         case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const Signin_Signup(), 
        );
               case Routes.category:
        return MaterialPageRoute(
          builder: (_) => const CustomCategoryScreen(), 
        );
              case Routes.prescription:
        return MaterialPageRoute(
          builder: (_) => PrescriptionStepScreen(stepNumber: 1,), 
        );
                case Routes.framechoose:
        return MaterialPageRoute(
          builder: (_) => PrescriptionStepScreen(stepNumber: 2,), 
        );
               case Routes.glassesProductScreen:
        return MaterialPageRoute(
          builder: (_) => const GlassesProductScreen(), 
        );
               case Routes.notification:
        return MaterialPageRoute(
          builder: (_) => const NotificationListScreen(), 
        );
                case Routes.productdetailesscreen:
        return MaterialPageRoute(
          builder: (_) => const ProductDetailsScreen(), 
        );
      case Routes.layout:
       return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CartCubit()..loadDemoData(), // Create a new cubit for onboarding
            child: const MainLayout(),
          ),
        );
        case Routes.layoutgust:
        return MaterialPageRoute(
          builder: (_) => const GuestLayout (), 
        );
        
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                OnboardingCubit(), // Create a new cubit for onboarding
            child: const OnboardingScreen(),
          ),
        );
        case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CheckoutCubit(),
            child: const CheckoutScreen(),
          ),
        );
           case Routes.search:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (context) => SearchCubit(),
            child: const SearchScreen(),
          ),
        );
         case Routes.cart:
        return MaterialPageRoute(
          builder: (_) =>BlocProvider(
          create: (context) => CartCubit(),
           
          child: const CartScreen(),
          
          )
        );
         case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthanticationCubit(), // Create a new cubit for onboarding
            child: const AuthScreen(),
          ),
        );
           case Routes.passwordforget:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthanticationCubit(), // Create a new cubit for onboarding
            child: const PasswordScreen(),
          ),
        );
         case Routes.otp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthanticationCubit(), // Create a new cubit for onboarding
            child:  OtpPasswordScreen(),
          ),
        );
          case Routes.newpassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                AuthanticationCubit(), // Create a new cubit for onboarding
            child:  NewPasswordScreen(),
          ),
        );
    }
    return null;
  }
}
