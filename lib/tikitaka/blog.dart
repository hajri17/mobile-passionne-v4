import 'package:flutter/material.dart';
import 'package:passione_app/tikitaka/blog-detail.dart';
import 'package:passione_app/widget/colors_page.dart';
import 'package:passione_app/widget/widget_page.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader('blog et actualités', ''),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              color: AppColors.cardBackground,
              child: Column(
                children: [
                  const Text(
                    'INFOS FRAÎCHES',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Build rows of 2 cards per line
                  Column(
                    children: List.generate((4 / 2).ceil(), (rowIndex) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(2, (colIndex) {
                          // int index = rowIndex * 2 + colIndex;

                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () => {
                                  // Navigate to a new page for the selected team
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const BlogDetailsPage(blogId: "1"),
                                    ),
                                  )
                                },
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        'https://storage.googleapis.com/a1aa/image/oNYHXB7qIGtZccZyLQHhk1_CdskvmkVuUffuPEV3Unk.jpg',
                                        width: double.infinity,
                                        height: 135,
                                        fit: BoxFit.cover,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Qatar WorldCup 2022',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              'Best of Portugal goals against Switzerland',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 8,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(8),
              color: AppColors.cardBackground,
              child: Column(
                children: [
                  const Text(
                    'LEAGUE TN',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BebasNeue',
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: GestureDetector(
                            onTap: () => {
                              // Navigate to a new page for the selected team
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BlogDetailsPage(blogId: "1"),
                                ),
                              )
                            },
                            child: Container(
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.network(
                                      'https://storage.googleapis.com/a1aa/image/oNYHXB7qIGtZccZyLQHhk1_CdskvmkVuUffuPEV3Unk.jpg',
                                      width: 80,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Qatar WorldCup 2022',
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'BebasNeue',
                                            height: 1,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Best of Portugal goals against Switzerla goals against Switzerla goals against Switzerland',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 8,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
