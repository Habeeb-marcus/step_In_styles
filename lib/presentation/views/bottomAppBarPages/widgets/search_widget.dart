import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:step_in_style/core/extensions/image_path.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 15,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Search',
          style: AppTextStyle.headerFive,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Cancel',
              style: AppTextStyle.bodyTwo,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VSpace.large,
          const SearchTextfFeld(),
          VSpace.large,
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              'Shoes',
              style: AppTextStyle.headerFour,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, __) => const SearchResultItems(),
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultItems extends StatelessWidget {
  const SearchResultItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      minLeadingWidth: 5,
      leading: Image.asset(
        'history'.ipng,
        width: 15,
      ),
      title: Text(
        'Nike Air Max Shoes',
        style: AppTextStyle.bodyThree,
      ),
    );
  }
}

class SearchTextfFeld extends StatelessWidget {
  const SearchTextfFeld({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search Your Shoes',
          prefixIcon: Transform.scale(
            scale: .4,
            child: SvgPicture.asset(
              'search'.isvg,
            ),
          ),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}
