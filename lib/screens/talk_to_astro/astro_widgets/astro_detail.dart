part of 'astro_widgets.dart';

class AstroDetail extends StatelessWidget {
  final Datum astro;

  const AstroDetail({Key? key, required this.astro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          astro.images?.medium.imageUrl != null
              ? CachedNetworkImage(
                  imageUrl: astro.images!.medium.imageUrl!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: 80,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  fit: BoxFit.cover,
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  astro.firstName! + " " + astro.lastName!,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                AstroDetailRow(
                  icon: Icons.person,
                  text: _getSkills(),
                ),
                AstroDetailRow(
                  icon: Icons.language_outlined,
                  text: _getLanguages(),
                ),
                AstroDetailRow(
                  icon: Icons.monetization_on,
                  text: "${astro.minimumCallDurationCharges.toInt()}/ Min",
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PrimaryButton(
                  onPressed: () {},
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: const [
                      Icon(Icons.call),
                      WidthBox(8),
                      Text("Talk on Call"),
                    ],
                  ),
                ),
                const HeightBox(10),
              ],
            ).px16(),
          ),
          Text("${astro.experience.toInt()} Years"),
        ],
      ),
    );
  }

  _getSkills() {
    List skills = [];
    for (var skill in astro.skills!) {
      skills.add(skill.name);
    }
    return skills.join(", ");
  }

  _getLanguages() {
    List languages = [];
    for (var language in astro.languages!) {
      languages.add(language.name);
    }
    return languages.join(", ");
  }
}
