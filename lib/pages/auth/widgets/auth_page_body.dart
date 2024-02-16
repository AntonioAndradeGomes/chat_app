import 'package:flutter/material.dart';
import 'package:get/get.dart';

//26:00
class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;
    return Container(
      padding: const EdgeInsets.all(20),
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Entrar',
                                style: isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                width: isLogin.value ? 110 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width / 2.8,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Cadastrar',
                                style: !isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              AnimatedContainer(
                                duration: const Duration(
                                  milliseconds: 200,
                                ),
                                width: !isLogin.value ? 110 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
