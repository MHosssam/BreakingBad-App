import 'package:breaking_bad/common.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperWidget extends StatelessWidget {
  const CardSwiperWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Swiper(
        itemCount: images.length,
        loop: true,
        autoplay: true,
        scale: 0.8,
        viewportFraction: 0.8,
        duration: 5,
        itemBuilder: (context, index) {
          final image = images[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
