import 'package:cached_network_image/cached_network_image.dart';
import 'package:calculator/model/icecream.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            
            Hero(
              tag:icecream.image,
              child: CachedNetworkImage(
                imageUrl:  icecream.image, fit: BoxFit.cover),
            ),
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
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${icecream.price.toString()}",
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 12,
                        color: Colors.white,
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
