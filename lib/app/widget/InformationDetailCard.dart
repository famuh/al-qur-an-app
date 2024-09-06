import 'package:flutter/material.dart';

import '../../common/colors.dart';
 
  Card InformationDetailCard(String title, String subtitle, String rowInfo1, String rowInfo2) {
    return Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                        colors: [appPurpleLight1, appPurpleDark])),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: appWhite),
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                            // fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: appWhite),
                      ),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            rowInfo1,
                            style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                color: appWhite,
                                fontSize: 16),
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appWhite,
                            ),
                          ),
                          Text(
                            rowInfo2,
                            style: TextStyle(
                                // fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: appWhite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
  }

