import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../utility/routes.dart';
import '../widgets/home_widgets/add_to_cart.dart';

class AddIntent extends Intent {}

class SubIntent extends Intent {}

class ZeroIntent extends Intent {}

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: Shortcuts(
          shortcuts: {
            LogicalKeySet(LogicalKeyboardKey.arrowUp): AddIntent(),
            LogicalKeySet(LogicalKeyboardKey.arrowDown): SubIntent(),
            LogicalKeySet(LogicalKeyboardKey.digit0): ZeroIntent(),
          },
          child: Actions(
            actions: {
              AddIntent: CallbackAction<AddIntent>(
                onInvoke: (intent) =>
                    ChangeQuantity(catalog, catalog.quantity + 1),
              ),
              SubIntent: CallbackAction<SubIntent>(
                onInvoke: (intent) =>
                    ChangeQuantity(catalog, catalog.quantity - 1),
              ),
              ZeroIntent: CallbackAction<ZeroIntent>(
                onInvoke: (intent) => ChangeQuantity(catalog, 0),
              )
            },
            child: VxBuilder(
              mutations: {ChangeQuantity},
              builder: (context, stor, status) {
                print(catalog.quantity);
                return Focus(
                  autofocus: true,
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.totalPrice}".text.bold.xl4.red800.make(),
                      VxStepper(
                        key: UniqueKey(),
                        defaultValue: catalog.quantity,
                        onChange: (value) => ChangeQuantity(catalog, value),
                      ),
                      10.heightBox,
                      AddToCart(
                        catalog: catalog,
                      ).wh(120, 50)
                    ],
                  ).p32(),
                );
              },
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.accentColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      10.heightBox,
                      "Lorem erat dolor sanctus kasd et justo invidunt voluptua, consetetur sit sanctus ipsum duo eirmod justo dolor, voluptua elitr dolores lorem amet ut kasd. Et rebum elitr nonumy eirmod nonumy..Kasd magna elitr eirmod nonumy dolor nonumy nonumy."
                          .text
                          .size(12)
                          .textStyle(context.captionStyle)
                          .make()
                          .px12(),
                    ],
                  ).py(50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
