import 'package:elegant_media_project/models/hotel.dart';
import 'package:elegant_media_project/styles/assets.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:elegant_media_project/utils/helper_util.dart';
import 'package:elegant_media_project/utils/map_util.dart';
import 'package:elegant_media_project/utils/screen_util.dart';
import 'package:flutter/material.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Text(
            widget.hotel.title ?? "",
            style: const TextStyle(color: AppColors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                printLogs(double.parse(widget.hotel.latitude ?? ""));
                printLogs(double.parse(widget.hotel.longitude ?? ""));
                await MapUtils.openMap(
                    double.parse(widget.hotel.latitude ?? ""),
                    double.parse(widget.hotel.longitude ?? ""));
              },
              icon: const Icon(Icons.location_on))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
                height: getScreenHeight(context) * 0.4,
                child: Image.asset(
                  splashLogo,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 30,
            ),
            Text(
              widget.hotel.title ?? "",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.hotel.description ?? "",
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
