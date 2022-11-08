import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_video/assets/data.dart';
import 'package:flutter_cubit_video/cubit/home_cubit.dart';
import 'package:flutter_cubit_video/repository/home_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (context) => HomeCubit(HomeRepository()),
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<HomeCubit>();
      cubit.fetchList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeInitialState || state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedListState) {
            final homeLists = state.homes;
            return ListView.builder(
              itemCount: homeLists.length,
              itemBuilder: (context, index) {
                final homes = homeLists[index];
                return ListTile(
                  title: Text('e'),
                );
              },
            );
          }
          return Center(
            child: Text(
              state.toString(),
            ),
          );
        },
      ),
    );
  }
}
