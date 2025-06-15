import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/vedio_model.dart';
import 'package:flutter_application_1/provider/theme_provider.dart';
import 'package:flutter_application_1/screen/detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      'All',
      'Music',
      'Gaming',
      'News',
      'Movies',
      'Live',
      'Sports',
      'Learning',
      'Fashion & Beauty',
      'Entertainment',
      'Autos & Vehicles',
    ];
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset('assets/icons/yt.png', scale: 12),
            SizedBox(width: 10),
            Text(
              'Youtube ',
              style: Theme.of(context).appBarTheme.titleTextStyle!.copyWith(
                color: themeProvider.isDarkMode ? Colors.black : Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),

            SizedBox(width: 10),
            IconButton(
              icon: Icon(
                Icons.cast,
                // ✅ reversed
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.notifications,
                size: 30,
                // ✅ reversed
              ),
              onPressed: () {},
            ),
            SizedBox(width: 10),

            Icon(Icons.search,size: 30,),
            const SizedBox(width: 20),
            const CircleAvatar(
              backgroundImage: NetworkImage(
                'https://i.pinimg.com/564x/65/fc/fd/65fcfdb6d3aca66178d226be5b42165b.jpg',
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              SizedBox(
                height: 50,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: i == 0
                            ? Colors.black
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          tabs[i],
                          style: i == 0
                              ? const TextStyle(color: Colors.white)
                              : Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),

              Column(
                children: List.generate(videoList.length, (i) {
                  final data = videoList[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(model: data),
                            ),
                          ),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(data.thumnailImg),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(data.profileImg),
                              ),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),

                                    const SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          data.username +
                                              " - " +
                                              data.dayAgo +
                                              " - " +
                                              data.viewCount,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.headlineMedium,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(Icons.more_vert,
                                  color: Theme.of(context).colorScheme.onSurface,
                                  size: 25,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
