import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/model/panchang_response.dart';
import 'package:india_today/screens/panchang/panchang_cubit/panchang_cubit.dart';
import 'package:india_today/screens/panchang/panchang_widgets/panchang_widgets.dart';
import 'package:india_today/widgets/my_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class PanchangScreen extends StatefulWidget {
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  State<PanchangScreen> createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      BlocProvider.of<PanchangCubit>(context).getPanchang();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: SingleChildScrollView(
        child: BlocBuilder<PanchangCubit, PanchangState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Daily Panchang".text.bold.subtitle1(context).make(),
                const HeightBox(4),
                Text(
                  "India is country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates, we bring you the daily panchang.",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Filters(),
                state is PanchangLoaded
                    ? Builder(
                        builder: (context) {
                          Panchang panchang = state.panchang;
                          return panchang.data != null
                              ? Column(
                                  children: [
                                    Lunar(panchang: panchang.data!),
                                    const Divider(color: Colors.grey),
                                    PanchangList(panchang: panchang.data!)
                                  ],
                                )
                              : Container();
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            );
          },
        ).p16(),
      ),
    );
  }
}
