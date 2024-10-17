import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool _isPrivate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 175,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/flutter background.png',
                      fit: BoxFit.cover,
                    ),
                  ),

                  //--------------------------------------------------------------------

                  const Positioned(
                    left: 180,
                    top: 60,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey,
                    ),
                  ),

                  //--------------------------------------------------------------------

                  Positioned(
                    left: 15,
                    top: 10,
                    child: Image.asset(
                      'assets/icons/camera.png',
                      height: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              //--------------------------------------------------------------------
              const SizedBox(height: 15),

              SettingsItem(
                identifier: 'Name',
                onPressed: () {},
                value: 'RJ',
              ),

              //--------------------------------------------------------------------
              const SizedBox(height: 15),

              SettingsItem(
                identifier: 'Handle',
                onPressed: () {},
                value: 'rj@00',
              ),

              //--------------------------------------------------------------------
              const SizedBox(height: 15),

              SettingsItem(
                identifier: 'Description',
                onPressed: () {},
                value: '',
              ),

              //--------------------------------------------------------------------

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Keep all my subscribers PRIVATE'),

                    //--------------------------------------------------------------------

                    Switch(
                      value: _isPrivate,
                      onChanged: (value) => setState(() {
                        _isPrivate = value;
                      }),
                    ),
                  ],
                ),
              ),

              //--------------------------------------------------------------------

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Text(
                  'Changes made on your names and profile pictures are visible only to YouTube and NOT to other Google Services',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
