import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/datamodel.dart';
import '../data/datamanager.dart';

class OrderPage extends StatefulWidget {
  final DataManager dataManager;
  const OrderPage({super.key, required this.dataManager});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.dataManager.cart.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Your order is empty"),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: widget.dataManager.cart.length,
                itemBuilder: (context, index) {
                  var item = widget.dataManager.cart[index];
                  return OrderItem(
                      item: item,
                      onRemove: (product) {
                        setState(() {
                          widget.dataManager.cartRemove(product);
                        });
                      });
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "Total: \$${widget.dataManager.cartTotal().toStringAsFixed(2)}"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade900),
                    onPressed: () {
                      //TODO:
                    },
                    child: const Text("Send Order")),
              ),
            )
          ],
        ),
      );
    }
  }
}

class OrderItem extends StatefulWidget {
  final ItemCart item;
  final Function onRemove;
  const OrderItem({super.key, required this.item, required this.onRemove});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("${widget.item.quantity}x"),
                )),
            Expanded(
                flex: 6,
                child: Text(
                  widget.item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
                flex: 2,
                child: Text(
                    "\$${(widget.item.product.price * widget.item.quantity).toStringAsFixed(2)}")),
            Expanded(
              flex: 1,
              child: IconButton(
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                    widget.onRemove(widget.item.product);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
