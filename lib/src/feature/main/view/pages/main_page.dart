import 'package:car_images_app/src/feature/main/view_model/data/repository/main_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/main_page_card_widget.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:const Text("CarStore", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Color(0xFFFF5C00),
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
              ),
             const Positioned(
                right: 15,
                top: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 4,
                ),
              ),
            ],
          ),
        ],
        leading:IconButton(onPressed: () {}, icon: const Icon(Icons.menu))),



      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffEDEEEF),
                      hintText: 'Search',
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Color(0xff8C9199),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                Expanded(
                    flex: 1,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.line_style),)),
                    // child: MaterialButton(onPressed: (){}, child: SvgPicture.asset("assets/icons/filter_icon.svg", color: Colors.black,),))
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Container(
                    margin: EdgeInsets.only(right: 8),
                    width: 300,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: NetworkImage(
                          'https://top-tuning.ru/w1200h627/upload/images/news/106318/g5m_cs_bi-turbo_05.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // color: Colors.red,
                  );
                },
              ),
            ),
            const SizedBox(height: 36),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(
                    color: Color(0xff040415),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Color(0xff8C9199),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, _) {
                final con = ref.watch(mainFetchData);
                return con.when(
                  data: (data) =>Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.60,
                      ),
                      itemCount: 6,
                      itemBuilder: (_, i) {
                        return MainPageCardWidget();
                      },
                    ),
                  ),
                 error: ( error, StackTrace stackTrace) => Text("Error: $error"),
                    loading: () => const CircularProgressIndicator());
              },

            ),
          ],
        ),
      ),

    );
  }
}
