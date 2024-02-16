import 'package:chat_app/config/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class WelcomeFooterButton extends StatelessWidget {
  const WelcomeFooterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideAction(
      onSubmit: () async {
        print('submit');
      },
      sliderButtonIcon: SizedBox(
        width: 25,
        height: 25,
        child: SvgPicture.asset(
          AssetsImages.plugSVG,
          width: 25,
        ),
      ),
      text: 'Deslize para começar agora',
      textStyle: Theme.of(context).textTheme.labelLarge,
      submittedIcon: SvgPicture.asset(
        AssetsImages.connetSVG,
        width: 25,
      ),
      innerColor: Theme.of(context).colorScheme.primary,
      outerColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 0,
    );
  }
}
