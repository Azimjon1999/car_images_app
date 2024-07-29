import 'package:flutter/material.dart';

class MainPageCardWidget extends StatelessWidget {
  const MainPageCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                'https://top-tuning.ru/w1200h627/upload/images/news/106318/g5m_cs_bi-turbo_05.jpg',
                height: 190,
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.threed_rotation,
                  color: Colors.orange,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Color(0xffFF5C00),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Audi e-tron Premium',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Rs. 54,77,823.73',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xff040415),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
