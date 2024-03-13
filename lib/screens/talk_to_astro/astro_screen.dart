import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_today/model/astro_response.dart';
import 'package:india_today/screens/talk_to_astro/astro_cubit/astro_cubit.dart';
import 'package:india_today/screens/talk_to_astro/astro_widgets/astro_widgets.dart';
import 'package:india_today/widgets/my_scaffold.dart';
import 'package:velocity_x/velocity_x.dart';

class AstroScreen extends StatefulWidget {
  const AstroScreen({Key? key}) : super(key: key);

  @override
  _AstroScreenState createState() => _AstroScreenState();
}

class _AstroScreenState extends State<AstroScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      BlocProvider.of<AstroCubit>(context).getAstro();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      child: SingleChildScrollView(
        child: BlocBuilder<AstroCubit, AstroState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Talk to an Astrologer",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.merge(const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 18,
                      child: Row(
                        children: [
                          Image.asset('images/icons/search.png').px4(),
                          Image.asset('images/icons/filter.png').px4(),
                          Image.asset('images/icons/sort.png').px4(),
                        ],
                      ),
                    )
                  ],
                ),
                const HeightBox(8),
                state is AstroLoaded
                    ? Builder(builder: (context) {
                        List<Datum> astros = state.astros.data!;
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: astros.length,
                          itemBuilder: (context, index) {
                            return AstroDetail(astro: astros[index]);
                          },
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const VxDivider(),
                        );
                      })
                    : SizedBox(
                        height: context.screenHeight * 0.8,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ],
            );
          },
        ).p16(),
      ),
    );
  }
}
