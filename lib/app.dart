/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-18 09:27:37
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-25 16:13:46
 * @FilePath: /flutter_clone_github/lib/app.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */

import 'package:flutter/material.dart';
import 'package:flutter_clone_github/provider/user_provider.dart';
import 'package:flutter_clone_github/router/router.dart';
import 'package:provider/provider.dart';

class FlutterReduxApp extends StatefulWidget {
  const FlutterReduxApp({super.key});

  @override
  State<FlutterReduxApp> createState() => _FlutterReduxAppState();
}

class _FlutterReduxAppState extends State<FlutterReduxApp>
    with NavigatorObserver {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => UserProvider()))
      ],
      child: MaterialApp(
        navigatorObservers: [this],
        routes: Routers.getRoutes(context),
      ),
    );
    // return StoreProvider(
    //     store: store,
    //     child:
    //         StoreBuilder<GithubState>(builder: (BuildContext context, store) {
    //       Widget app = MaterialApp(
    //         navigatorObservers: [this],
    //         routes: Routers.getRoutes(context),
    //       );
    //       if (store.state.grey) {
    //         app = ColorFiltered(
    //             colorFilter:
    //                 const ColorFilter.mode(Colors.grey, BlendMode.saturation),
    //             child: app);
    //       }
    //       return app;
    //     }));
  }
}
