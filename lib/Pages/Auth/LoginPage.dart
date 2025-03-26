import 'package:parking_system_map/ConstData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../Controller/AuthController.dart';
import 'LoginWidget.dart';
import 'SignUpWidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(children: [
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(AppLogo)),
                  SizedBox(height: 20),
                  Text(AppName,
                      style: Theme.of(context).textTheme.headlineMedium)
                ],
              ),
              const SizedBox(height: 20),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("WELCOME 😍 ",
                                style:
                                    Theme.of(context).textTheme.headlineSmall)
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    authController.isLogin.value = true;
                                  },
                                  child: Obx(
                                    () => Container(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Text("Login",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: authController
                                                            .isLogin.value
                                                        ? Theme.of(context)
                                                            .colorScheme
                                                            .primary
                                                        : Theme.of(context)
                                                            .colorScheme
                                                            .onSurface)),
                                            const SizedBox(height: 10),
                                            AnimatedContainer(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                              ),
                                              duration: const Duration(
                                                  milliseconds: 200),
                                              height: 4,
                                              width:
                                                  authController.isLogin.value
                                                      ? 100
                                                      : 0,
                                            )
                                          ],
                                        )),
                                  )),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  authController.isLogin.value = false;
                                },
                                child: Obx(
                                  () => Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color:
                                                  authController.isLogin.value
                                                      ? Theme.of(context)
                                                          .colorScheme
                                                          .onSurface
                                                      : Theme.of(context)
                                                          .colorScheme
                                                          .primary),
                                        ),
                                        SizedBox(height: 10),
                                        AnimatedContainer(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                          duration: Duration(milliseconds: 200),
                                          height: 4,
                                          width: authController.isLogin.value
                                              ? 0
                                              : 100,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Obx(() => authController.isLogin.value
                            ? LoginForm()
                            : SignupForm())
                      ],
                    ))
                  ],
                ),
              ),
              SizedBox(height: 50),
            ]),
          ),
        ),
      ),
    );
  }
}
