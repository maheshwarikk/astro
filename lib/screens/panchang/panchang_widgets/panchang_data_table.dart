part of 'panchang_widgets.dart';

class PanchangDataTable extends StatelessWidget {
  final List<Map<String, String>> data;

  const PanchangDataTable({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.screenWidth / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in data)
                for (var heading in i.keys)
                  Text(
                    heading,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.w400,
                    ),
                  ).py4(),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i in data)
                for (var values in i.values)
                  Text(
                    values,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ).py4(),
            ],
          ),
        ),
      ],
    );
  }
}
