import 'package:breaking_bad/common.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    Key? key,
    required this.endIndent,
  }) : super(key: key);

  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: AppUi.colors.appGreen,
      thickness: 2,
    );
  }
}
