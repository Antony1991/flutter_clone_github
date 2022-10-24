/*
 * @Author: Antony vic19910108@gmail.com
 * @Date: 2022-10-24 10:08:41
 * @LastEditors: Antony vic19910108@gmail.com
 * @LastEditTime: 2022-10-24 10:21:36
 * @FilePath: /flutter_clone_github/lib/redux/reducers/app_reducer.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter_clone_github/redux/app_state.dart';
import 'package:flutter_clone_github/redux/reducers/user_reducer.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<GithubState>([...userReducer]);
