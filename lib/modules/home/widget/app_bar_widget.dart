import 'package:flutter/material.dart';

import '../../../core/assets_manager.dart';

class HomeAppBarWidget {
  final BuildContext context;
  final String title;
  final bool isAutomaticallyImplyLeading;

  HomeAppBarWidget(
      {required this.context,
      required this.title,
      required this.isAutomaticallyImplyLeading});

  PreferredSize getAppBar() => PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 1 / 8),
        child: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).primaryColor,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isAutomaticallyImplyLeading
                      ? InkWell(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 22))
                      : const SizedBox(
                          width: 25,
                        ),
                  Text(
                    title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        fontFamily: FontsAssets.alexandriaFont),
                  ),
                  const SizedBox(
                    width: 25,
                  )
                ],
              ),
            ),
          ),
        ),
      );
}

/*
Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
                fontFamily: FontsAssets.alexandriaFont),
          )
*/
