import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:step_in_style/core/components/cards/product_card.dart';
import 'package:step_in_style/core/providers/wishlist_provider.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteItems = ref.watch(wishlistProvider).wishlistItems;
    return Scaffold(

      body: favoriteItems.isEmpty
          ?  Center(

              child: Text(AppLocalizations.of(context)!.no_favorite_items_yet))
          : Padding(
            padding: EdgeInsets.symmetric(horizontal: sizer(true, 17, context), vertical: sizer(false, 10, context), ),
            child: ListView.separated(

                  itemCount: favoriteItems.length,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                    itemBuilder: (context, index) {
                      return   product_card(title:favoriteItems[index].title, price: favoriteItems[index].price, image: favoriteItems[index].image, isFavoritePage: true, addToWishlist: () {
                        ref.read(wishlistProvider.notifier).removeProductFromWishlist(favoriteItems[index]);
                      },);
                    },
)
              
                  ),
            
          
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String item, image;
  final VoidCallback onDeleted;
  final double price;

  const FavoriteCard({
    super.key,
    required this.item,
    required this.image,
    required this.onDeleted,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item),
      leading: SizedBox(
        width: 50,
        height: 50,
        child: Image.asset(image),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDeleted,
        //  () {
        //   // ref.read(favoriteProvider.notifier).remove(item);
        // },
      ),
    );
  }
}
