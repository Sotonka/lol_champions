import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lol_champions/common/app_colors.dart';
import 'package:lol_champions/feature/presentation/bloc/champion_info_cubit/champion_info_cubit.dart';
import 'package:lol_champions/feature/presentation/bloc/champions_list_cubit/champions_list_cubit.dart';
import 'package:lol_champions/feature/presentation/pages/champions_detail_screen.dart';
import 'package:lol_champions/feature/presentation/pages/champions_screen.dart';
import 'package:lol_champions/locator_service.dart' as di;
import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ChampionCubit>(
              create: (context) => sl<ChampionCubit>()..loadChampion()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColors.mainColor,
          ),
          home: HomePage(),
        ));
  }
}
