import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_7th_bookhub/Config/Colors.dart';


class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset("Assets/Icons/dashboard.svg"),
        Text(
          "BookHub",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Theme.of(context).colorScheme.background
          ),
        ),
        CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.background,
          child: const Text(
            "B",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
