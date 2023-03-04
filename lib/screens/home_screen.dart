import 'package:elegant_media_project/common_widgets/list_component.dart';
import 'package:elegant_media_project/models/hotel.dart';
import 'package:elegant_media_project/parameters.dart';
import 'package:elegant_media_project/routes.dart';
import 'package:elegant_media_project/services/access_to_app_provider.dart';
import 'package:elegant_media_project/services/api_service.dart';
import 'package:elegant_media_project/styles/theme.dart';
import 'package:elegant_media_project/utils/helper_util.dart';
import 'package:elegant_media_project/utils/navigation_util.dart';
import 'package:elegant_media_project/utils/screen_util.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = false;
  List<Hotel> hotels = [];

  @override
  void initState() {
    getAllHotels();
    super.initState();
  }

  Future<void> getAllHotels() async {
    setState(() {
      _loading = true;
    });
    await makeApiRequest(
      ApiConstants.getAllHotelData,
      success: (title, message, data) {
        final hotelData = data['data'] as List;
        setState(() {
          hotels = hotelData.map((hotel) => Hotel.fromJson(hotel)).toList();
        });
      },
      failed: (title, message, data) {},
      complete: () {
        setState(() {
          _loading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    printLogs(getAppState(context).user);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hotel Listview"),
      ),
      body: Container(
          height: getScreenHeight(context),
          margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getAppState(context).user ?? ""),
              const SizedBox(
                height: 10,
              ),
              Text(getAppState(context).email ?? ""),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 241, 239, 239),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                height: 37,
                width: 100,
                child: TextButton(
                  onPressed: () {
                    moveToScreen(context, ScreenRoutes.toSignInScreen);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: AppColors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              _loading
                  ? const Expanded(
                      child: Center(
                      child: CircularProgressIndicator(),
                    ))
                  : hotels.isEmpty
                      ? const Text(
                          " No Records Found !",
                          style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: hotels.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigate to hotel detail screen
                                  pushScreen(
                                    context,
                                    ScreenRoutes.toHotelDetailScreen,
                                    arguments: {"hotel": hotels[index]},
                                  );
                                },
                                child: ListComponent(
                                  image: hotels[index].smallImage ?? "",
                                  address: hotels[index].address ?? "",
                                  title: hotels[index].title ?? "",
                                ),
                              );
                            },
                          ),
                        ),
              const SizedBox(
                height: 15,
              )
            ],
          )),
    );
  }
}
