part of 'panchang_widgets.dart';

class PanchangList extends StatelessWidget {
  final Data panchang;
  const PanchangList({
    Key? key,
    required this.panchang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tithi tithi = panchang.tithi;
    Nakshatra nakshatra = panchang.nakshatra;
    Yog yog = panchang.yog;
    Karan karan = panchang.karan;
    HinduMaah hinduMaah = panchang.hinduMaah;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Heading(text: "Tithi"),
        PanchangDataTable(
          data: [
            {"Tithi Number": "${tithi.details.tithiNumber}"},
            {"Tithi Name": "${tithi.details.tithiName}"},
            {"Special": "${tithi.details.special}"},
            {"Summary": "${tithi.details.summary}"},
            {"Deity": "${tithi.details.deity}"},
          ],
        ),
        const Heading(text: "Nakshatra"),
        PanchangDataTable(
          data: [
            {"Nakshatra Number": "${nakshatra.details.nakNumber}"},
            {"Nakshatra Name": "${nakshatra.details.nakName}"},
            {"Ruler": "${nakshatra.details.ruler}"},
            {"Special": "${nakshatra.details.special}"},
            {"Summary": "${nakshatra.details.summary}"},
            {"Deity": "${nakshatra.details.deity}"},
          ],
        ),
        const Heading(text: "Yog"),
        PanchangDataTable(
          data: [
            {"Yog Number": "${yog.details.yogNumber}"},
            {"Yog Name": "${yog.details.yogName}"},
            {"Special": "${yog.details.special}"},
            {"Meaning": "${yog.details.meaning}"},
          ],
        ),
        const Heading(text: "Karan"),
        PanchangDataTable(
          data: [
            {"Karan Number": "${karan.details.karanNumber}"},
            {"Karan Name": "${karan.details.karanName}"},
            {"Special": "${karan.details.special}"},
            {"Deity": "${karan.details.deity}"},
          ],
        ),
        const Heading(text: "Hindu Maah"),
        PanchangDataTable(
          data: [
            {"Adhik Status": "${hinduMaah.adhikStatus}"},
            {"Amanta Id": "${hinduMaah.amantaId}"},
            {"Amanta": "${hinduMaah.amanta}"},
            {"Purnimanta Id": "${hinduMaah.purnimantaId}"},
            {"Purnimanta": "${hinduMaah.purnimanta}"},
          ],
        ),
      ],
    );
  }
}

class Heading extends StatelessWidget {
  final String text;
  const Heading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(fontWeight: FontWeight.bold),
    ).py8();
  }
}
