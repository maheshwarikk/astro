part of 'panchang_widgets.dart';

class Filters extends StatelessWidget {
  const Filters({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent.withOpacity(0.2),
      padding: const EdgeInsets.all(28),
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: const Text(
                  "Date",
                ).p8(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "17 Dec, 2021".text.make(),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
            ],
          ).py8(),
          Row(
            children: [
              SizedBox(
                width: 100,
                child: const Text(
                  "Location",
                ).p8(),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: "Delhi, India".text.make(),
                ),
              ),
            ],
          ).py8(),
        ],
      ),
    );
  }
}
