
import 'package:flutter/material.dart';
import 'package:step_in_style/core/components/buttons/full_button.dart';
import 'package:step_in_style/core/utility/size_calculator.dart';
import 'package:step_in_style/presentation/styles/app_colors.dart';
import 'package:step_in_style/presentation/styles/spacings.dart';
import 'package:step_in_style/presentation/styles/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardDescriptionWidget extends StatefulWidget {
  const CardDescriptionWidget({
    super.key, required this.productName, required this.price, required this.description, this.addToCart,
  });
  final String productName;
  final String price;
  final String description;
  final VoidCallback? addToCart;


  @override
  State<CardDescriptionWidget> createState() => _CardDescriptionWidgetState();
}

class _CardDescriptionWidgetState extends State<CardDescriptionWidget> {

   String? selectedChipValue;
  @override
  Widget build(BuildContext context) {
    return Card(
      // color: AppColors.orange,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            AppLocalizations.of(context)!.full_name,
            textAlign: TextAlign.start,
            style: AppTextStyle.bodyThree.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w300,
              fontSize: sizer(true, 12, context),
            ),
          ),
          Text(
            widget.productName,
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$${widget.price}.00',
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.sizes,
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: [
              _buildChip('40'),
              _buildChip('41'),
              _buildChip('42'),
              _buildChip('43'),
              _buildChip('44'),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context)!.description,
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.description,
            style: AppTextStyle.bodyThree.copyWith(
              fontWeight: FontWeight.w300,
            ),
          ),

          VSpace.large,

          // add add to cart button
          SizedBox(
            // height: sizer(true, 50, context),
            child: FullButton(
              buttonFunction: () {
                widget.addToCart!();
               
              },
              buttonText: AppLocalizations.of(context)!.add_to_cart,
              online: selectedChipValue != null ? true : false,
            ),
          ),

          VSpace.large,
        ]),
      ),
    );
  }
  Widget _buildChip(String label) {
    return ChoiceChip(
      label: Text(label),
      selected: selectedChipValue == label,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            selectedChipValue = label;
          } else {
            selectedChipValue = null;
          }
        });
      },
    );
  }
}



