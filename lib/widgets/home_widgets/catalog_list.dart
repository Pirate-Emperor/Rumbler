import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../../pages/home_detail_page.dart';
import '../theme.dart';
import 'add_to_cart.dart';
import 'catalog_image.dart';
import '../../core/store.dart';

class CatalogList extends StatelessWidget {
  final store = VxState.store as MyStore;
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      showTrackOnHover: false,
      child: VxBuilder(
        mutations: {SearchMutation},
        builder: (context, stor, status) => (!context.isMobile &&
                store.items != null)
            ? GridView.builder(
                primary: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                shrinkWrap: true,
                itemCount: store.items?.length,
                itemBuilder: (context, index) {
                  final catalog = store.items![index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(catalog: catalog),
                      ),
                    ),
                    child: CatalogItem(catalog: catalog),
                  );
                },
              )
            : ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: (store.items == null) ? 0 : store.items!.length,
                itemBuilder: (context, index) {
                  final catalog = store.items![index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeDetailPage(catalog: catalog),
                      ),
                    ),
                    child: CatalogItem(catalog: catalog),
                  );
                },
              ),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(context.accentColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
