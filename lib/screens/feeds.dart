import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shop_firebase/widgets/feeds_products.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/Feeds';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => new FeedProducts(),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(3, index.isEven ? 4 : 5),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      ),
      // body: GridView.count(
      //   crossAxisCount: 2,
      //   childAspectRatio: 240 / 290,
      //   crossAxisSpacing: 8,
      //   mainAxisSpacing: 8,
      //   children: List.generate(100, (index) {
      //     return FeedProducts();
      //   }),
      // ),
    );
  }
}
