import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../data/models/product_model.dart';

class ProductCommandeItem extends StatelessWidget {
  final ProductModel product;
  const ProductCommandeItem({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.r),
            child: Stack(
              children: [
                Container(
                  color: Colors.white,
                  width: 105.w,
                  height: 125.h,
                  child: Image.network(
                    product.images!.first,
                    //  height: 250.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          20.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              5.verticalSpace,
              SizedBox(
                width: 150.w,
                child: Text(
                  product.name!,
                  style: theme.textTheme.displayMedium,
                  overflow: TextOverflow.fade,
                ),
              ),
              5.verticalSpace,
              Text('Type: ${product.type ?? ""}',
                  style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp)),
              5.verticalSpace,
              Text(
                '${product.promoPrice ?? product.price}DZD',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: 18.sp,
                ),
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  10.horizontalSpace,
                  Text('Qte : ${product.quantity}',
                      style: theme.textTheme.displaySmall),
                  10.horizontalSpace,
                ],
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
