import 'package:flutter/material.dart';
import 'package:passione_app/widget/colors_page.dart';

class BlogDetailsPage extends StatelessWidget {
  final String blogId;

  const BlogDetailsPage({super.key, required this.blogId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Détails du blog et actualités",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontFamily: 'BebasNeue',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.network(
            'https://storage.googleapis.com/a1aa/image/RnYoX0UAk2iKLt0IZEF0yfGDnkdL3zWUnCV3aySeU3s.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'QATAR WORLD CUP 2022',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 24,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'BEST OF PORTUGAL GOALS AGAINST SWITZERLAND',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Horem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, ut tempor lorem. Curabitur et bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus.',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Curabitur tempor quis eros tempus lacinia. Nam bibendum pellentesque quam a convallis. Sed ut vulputate nisi. Integer in felis sed leo vestibulum venenatis. Suspendisse quis arcu sem. Aenean feugiat ex eu vestibulum vestibulum. Morbi a eleifend magna. Nam metus lacus, porttitor eu mauris a, blandit ultrices nibh. Mauris sit amet magna non ligula vestibulum ultricies. Nullam quis risus eget urna mollis ornare vel eu leo. Nunc vel accumsan ipsum. Nunc auctor ipsum eget magna consequat viverra. Nunc id ipsum fringilla, sollicitudin nisi in, interdum velit. Pellentesque id nibh tortor. Ut vel ante eget massa ornare placerat. Nunc sit amet ipsum laoreet, suscipit risus non, venenatis nisi. Proin vitae facilisis nisi, ac posuere leo.',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Image.network(
                      'https://storage.googleapis.com/a1aa/image/3CdnkP6C-MKKxYlUJh88SCeETRwqr6FRfNxeC1uS2Nk.jpg',
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 16),
                    Image.network(
                      'https://storage.googleapis.com/a1aa/image/3CdnkP6C-MKKxYlUJh88SCeETRwqr6FRfNxeC1uS2Nk.jpg',
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
