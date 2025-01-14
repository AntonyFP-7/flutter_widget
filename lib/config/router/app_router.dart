// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:widget_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  //initialLocation: '/',
  routes: [
    GoRoute(
      name: HomeScreen.name,
      path: '/',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      name: ButtonsScreen.name,
      path: '/buttons',
      builder: (context, state) => ButtonsScreen(),
    ),
    GoRoute(
      name: CardsScreen.name,
      path: '/cards',
      builder: (context, state) => CardsScreen(),
    ),
    GoRoute(
        name: ProgressScreend.name,
        path: '/progress',
        builder: (context, state) => ProgressScreend()),
    GoRoute(
        name: SnackbarScreend.name,
        path: '/snackbars',
        builder: (context, state) => SnackbarScreend()),
    GoRoute(
        name: AnimatedScreen.name,
        path: '/animated',
        builder: (context, state) => AnimatedScreen()),
    GoRoute(
        name: ControlsScreend.name,
        path: '/ui-controls',
        builder: (context, state) => ControlsScreend()),
    GoRoute(
        name: AppTutorialScreen.name,
        path: '/tutorial',
        builder: (context, state) => AppTutorialScreen()),
    GoRoute(
        name: InfiniteScrollScrean.name,
        path: '/infinite',
        builder: (context, state) => InfiniteScrollScrean()),
    GoRoute(
        name: CounterScreend.name,
        path: '/counter',
        builder: (context, state) => CounterScreend()),
    GoRoute(
        name: TeamChanger.name,
        path: '/theme-changer',
        builder: (context, state) => TeamChanger()),
  ],
);
