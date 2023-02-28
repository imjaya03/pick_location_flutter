library pick_location;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> pickLocation({
  required BuildContext context,
  required String googleApiKey,
}) async {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) {
        return const _DialogScreen();
      },
      fullscreenDialog: true,
    ),
  );
}

class _DialogScreen extends StatefulWidget {
  const _DialogScreen({super.key});

  @override
  State<_DialogScreen> createState() => _DialogScreenState();
}

class _DialogScreenState extends State<_DialogScreen> {
  void _handleUseCurrentLocation() async {
    if (kDebugMode) {
      print("_handleUseCurrentLocation() called");
    }
  }

  void _handleSelectLocation() async {
    if (kDebugMode) {
      print("_handleSelectLocation() called");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(Icons.keyboard_arrow_down, size: 40.0),
                ),
                const Text(
                  "Select location",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.refresh),
                hintText: "Search area, street name & etc",
                constraints: const BoxConstraints(maxHeight: 45),
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: _handleUseCurrentLocation,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                // color: Colors.grey[50],
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.my_location_sharp, color: Colors.grey),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Use current location",
                              style: TextStyle(
                                color: Colors.black,
                                // fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "Ramchandranagar",
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: _handleSelectLocation,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 10.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(width: double.infinity),
                                Text(
                                  "${index + 1} Baruipur kachari bazar",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  "Near Baruipur Rail Gate, Kolkata - 700144, West Bengal",
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(height: 1.0, thickness: 1.0),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
