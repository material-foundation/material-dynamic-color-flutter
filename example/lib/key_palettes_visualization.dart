import 'package:dynamic_colors/key_palettes.dart';
import 'package:flutter/material.dart';

class KeyPalettesVisualization extends StatelessWidget {
  const KeyPalettesVisualization({Key? key}) : super(key: key);

  static const title = 'KeyPalettes Visualization';

  @override
  Widget build(BuildContext context) {
    const sampleKeyPalettes = KeyPalettes(
      primary: KeyPalette(
        Color(0xFF000000),
        Color(0xFF21005E),
        Color(0xFF380094),
        Color(0xFF5200CE),
        Color(0xFF6D23F8),
        Color(0xFF8752FF),
        Color(0xFF9F79FF),
        Color(0xFFB79BFF),
        Color(0xFFD0BCFF),
        Color(0xFFEADDFF),
        Color(0xFFF6EEFF),
        Color(0xFFFFFBFE),
        Color(0xFFFFFFFF),
      ),
      secondary: KeyPalette(
        Color(0xFF000000),
        Color(0xFF1E1635),
        Color(0xFF332B4B),
        Color(0xFF4B4263),
        Color(0xFF63597C),
        Color(0xFF7C7296),
        Color(0xFF968BB1),
        Color(0xFFB1A5CD),
        Color(0xFFCCC0E8),
        Color(0xFFE9DDFF),
        Color(0xFFF6EEFF),
        Color(0xFFFFFBFE),
        Color(0xFFFFFFFF),
      ),
      tertiary: KeyPalette(
        Color(0xFF000000),
        Color(0xFF31101D),
        Color(0xFF492532),
        Color(0xFF633b48),
        Color(0xFF7D5260),
        Color(0xFF996A79),
        Color(0xFFB48392),
        Color(0xFFD29DAD),
        Color(0xFFEFB7C8),
        Color(0xFFFFD8E4),
        Color(0xFFFFECF1),
        Color(0xFFFCFCFC),
        Color(0xFFFFFFFF),
      ),
      neutral: KeyPalette(
        Color(0xFF000000),
        Color(0xFF1C1A22),
        Color(0xFF322F38),
        Color(0xFF48454E),
        Color(0xFF615D67),
        Color(0xFF79757F),
        Color(0xFF948F99),
        Color(0xFFAEA9B4),
        Color(0xFFCAC4D0),
        Color(0xFFE6E0EB),
        Color(0xFFF5EEFA),
        Color(0xFFFFFBFE),
        Color(0xFFFFFFFF),
      ),
      neutralVariant: KeyPalette(
        Color(0xFF000000),
        Color(0xFF1C1B1E),
        Color(0xFF313033),
        Color(0xFF484649),
        Color(0xFF605D62),
        Color(0xFF79767A),
        Color(0xFF938F94),
        Color(0xFFAEAAAE),
        Color(0xFFCAC5CA),
        Color(0xFFE6E1E6),
        Color(0xFFF4EFF3),
        Color(0xFFFFFBFE),
        Color(0xFFFFFFFF),
      ),
    );

    return ListView(
      scrollDirection: Axis.horizontal,
      children: const [
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: _RenderKeyPalettes(sampleKeyPalettes),
        )
      ],
    );
  }
}

class _RenderKeyPalettes extends StatelessWidget {
  const _RenderKeyPalettes(this.kps, {Key? key}) : super(key: key);

  final KeyPalettes kps;

  static const keyPaletteLabels = [
    'Primary',
    'Secondary',
    'Tertiary',
    'Neutral',
    'Neutral Variant',
  ];

  @override
  Widget build(BuildContext context) {
    final captionStyle = Theme.of(context).textTheme.caption;
    List<List<Color>> tones = [
      kps.primary.allTones,
      kps.secondary.allTones,
      kps.tertiary.allTones,
      kps.neutral.allTones,
      kps.neutralVariant.allTones,
    ];
    return Column(
      children: tones.mapIndexed(
        (List<Color> tones, int i) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  keyPaletteLabels[i],
                  style: captionStyle,
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(width: 16),
              ...tones.mapIndexed((Color color, int i) {
                final toneValue = KeyPalette.toneValues[i];
                return Container(
                  constraints: BoxConstraints.tightFor(height: 80, width: 60),
                  color: color,
                  child: Center(
                    child: Text(
                      toneValue.toString(),
                      style: captionStyle!.copyWith(
                        color: toneValue > 50 ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ).toList(),
    );
  }
}

extension ExtendedIterable<E> on Iterable<E> {
  /// Like Iterable<T>.map but callback have index as second argument
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }

  void forEachIndexed(void Function(E e, int i) f) {
    var i = 0;
    forEach((e) => f(e, i++));
  }
}
