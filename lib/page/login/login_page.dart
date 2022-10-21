import 'package:flutter/material.dart';
import 'package:flutter_clone_github/common/style/icons.dart';
import 'package:flutter_clone_github/common/style/styles.dart';
import 'package:flutter_clone_github/widgets/animated_background.dart';
import 'package:flutter_clone_github/widgets/flex_button.dart';
import 'package:flutter_clone_github/widgets/icon_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginBLoC {
  /// 渲染icon
  Widget _buildLogo() {
    return const Image(
        image: AssetImage(GlobalIcons.DEFAULT_USER_ICON),
        width: 90.0,
        height: 90.0);
  }

  /// 渲染user_input
  Widget _buildUserNameInput() {
    return IconInput(
      hintText: '请输入用户名',
      iconData: GlobalIcons.LOGIN_USER,
      onChanged: usernameChange,
      controller: userController,
    );
  }

  /// 渲染pwd_input
  Widget _buildPwdInput() {
    return IconInput(
      hintText: '请输入密码',
      obscureText: true,
      iconData: GlobalIcons.LOGIN_PW,
      onChanged: pwdChange,
      controller: pwdController,
    );
  }

  /// 渲染loginInBtn
  Widget _buildLoginInBtn() {
    return Expanded(
        child: FlexButton(
      text: '账号登录',
      color: Theme.of(context).primaryColor,
      textColor: GlobalColors.textWhite,
      fontSize: 16,
      onPress: () {
        print('--------------');
      },
    ));
  }

  /// 渲染loginInBtn
  Widget _buildOauthLoginInBtn() {
    return Expanded(
        child: FlexButton(
      text: '安全登录',
      color: Theme.of(context).primaryColor,
      textColor: GlobalColors.textWhite,
      fontSize: 16,
      onPress: () {
        print('--------------');
      },
    ));
  }

  /// 渲染按钮组
  Widget _buildBtnGroup() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          _buildLoginInBtn(),
          const SizedBox(width: 10.0),
          _buildOauthLoginInBtn()
        ],
      ),
    );
  }

  /// 渲染form
  Widget _buildForm() {
    return Center(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.00)),
            color: GlobalColors.cardWhite,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, top: 40.0, right: 30.0, bottom: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildLogo(),
                  const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  _buildUserNameInput(),
                  const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  _buildPwdInput(),
                  const Padding(padding: EdgeInsets.only(bottom: 10.0)),
                  _buildBtnGroup(),
                  const Padding(padding: EdgeInsets.only(bottom: 15.0)),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      '切换语言',
                      style: TextStyle(color: GlobalColors.subTextColor),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 15.0)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {},
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Stack(
            children: [
              Positioned.fill(child: AnimatedBackground()),
              _buildForm()
            ],
          ),
        ),
      ),
    );
  }
}

mixin LoginBLoC on State<LoginPage> {
  /// 用户名controller
  final TextEditingController userController = TextEditingController();

  /// 密码controller
  final TextEditingController pwdController = TextEditingController();

  String? userName = '';
  String? password = '';

  /// 用户名改变
  void usernameChange(value) {
    userName = userController.text;
  }

  /// 密码改变
  void pwdChange(value) {
    password = pwdController.text;
  }
}
