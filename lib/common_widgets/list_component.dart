import 'package:elegant_media_project/styles/assets.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:elegant_media_project/utils/screen_util.dart';
import 'package:flutter/material.dart';

class ListComponent extends StatelessWidget {
  const ListComponent({
    super.key,
    required this.image,
    required this.address,
    this.address2,
    required this.title,
  });
  final String image;
  final String title;
  final String address;
  final String? address2;

  String formatName(String text) {
    return text.length > 35 ? "${text.substring(0, 35)}..." : text;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getCalaculatedHeight(context, 0.1),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                  radius: 30, backgroundImage: AssetImage(splashLogo)
                  //  NetworkImage(image),
                  ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatName(title),
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(address,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.grey)),
                    Visibility(
                      visible: address2 != null,
                      child: Text(address2 ?? ""),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Container(
            height: 1,
            color: AppColors.grey,
            width: getScreenWidth(context) * 0.8,
          )
        ],
      ),
    );
  }
}
