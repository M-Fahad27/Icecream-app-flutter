import 'package:calculator/model/icecream.dart';
import 'package:calculator/pages/icecream_detailedview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Icecreamview extends StatefulWidget {
  const Icecreamview({super.key});

  @override
  State<Icecreamview> createState() => _IcecreamviewState();
}

class _IcecreamviewState extends State<Icecreamview> {
  Item? selectedIcecream;
  List<Item>? icecreams;

  Future<List<Item>> loadIcecream() async {
    final rawIcecream = await rootBundle.loadString(
      "lib/assets/icecreamdata.json",
    );
    await Future.delayed(const Duration(seconds: 1));

    // Decode the raw JSON and convert to Icecreamdata object
    final icecreams = Icecreamdata.fromJson(rawIcecream);
    return icecreams.items;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fahad 's IceCream",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.greatVibes().fontFamily,
            ),
          ),
          Text(
            "Love At First Bite",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.heebo().fontFamily,
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<List<Item>>(
                  future: loadIcecream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      icecreams = snapshot.data!;
                      if (selectedIcecream == null && icecreams!.isNotEmpty) {
                        selectedIcecream = icecreams![0];
                      }

                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            final icecream = icecreams![index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: 
                                (context) =>
                                 icecream_detailedview(icecream: icecream)));
                                
                              },
                              child: IcecreamCard(icecream: icecream));
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: icecreams!.length,
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class IcecreamCard extends StatelessWidget {
  const IcecreamCard({super.key, required this.icecream});

  final Item icecream;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(icecream.image, fit: BoxFit.cover),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      icecream.flavour,
                      style: TextStyle(
                        fontFamily: GoogleFonts.lora().fontFamily,
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${icecream.price.toString()}",
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


