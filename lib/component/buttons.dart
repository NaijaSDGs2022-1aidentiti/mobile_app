import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';


class BackButtonWithHeader extends StatelessWidget {
  final String text;

  const BackButtonWithHeader({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back)),
      Padding(
        padding: EdgeInsets.only(right: 32.0),
        child: Text(text,
            textAlign: TextAlign.center,
            style:
                AppFonts.body1.copyWith(fontSize: 16, color: Pallete.black)),
      ),
      Text('', textAlign: TextAlign.center, style: AppFonts.smallWhite)
    ]);
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? textColor;
  final FontWeight? fontWeight;
  final Color? borderColor;
  final Widget? icon;
  final bool isOutline;
  final double? fontSize;
  final bool enabled;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onpressed,
    this.fontSize,
    this.width,
    this.height,
    this.isOutline = false,
    this.icon,
    this.color,
    this.textColor,
    this.fontWeight,
    this.borderColor = Pallete.black,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: width ?? size.width * 0.9,
      child: MaterialButton(
        elevation: 0,
        height: height ?? 45,
        minWidth: width ?? size.width * 0.9,
        color: !enabled
            ? Color(0x11004269)
            : isOutline
                ? Colors.white
                : color ?? Pallete.primaryColor,
        splashColor: Colors.white10,
        shape: RoundedRectangleBorder(
            side: isOutline ? BorderSide(color: borderColor!) : BorderSide.none,
            borderRadius: BorderRadius.circular(8)),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : const SizedBox(),
            SizedBox(width: MediaQuery.of(context).size.width * 0.1),
            Text(text,
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight ?? FontWeight.normal,
                    color: !enabled
                        ? Colors.black
                        : isOutline
                            ? textColor
                            : Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
class ButtonWithFuction extends StatelessWidget {const ButtonWithFuction({
    Key? key,
    required this.text,
    required this.onPressed,  this.enabled=true,
  }) : super(key: key);

  final String text;
    final bool enabled;
  //this calls the onpressed widget
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient:
                const LinearGradient(colors: [Color(0xFF0095ff), Color(0xFF0260ff)])
            ),
        width: MediaQuery.of(context).size.width,
        child: OutlinedButton(
            child: Text(
              text,
            ),
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                primary: Colors.white,
                backgroundColor: Color.fromARGB(0, 137, 200, 140),
                shadowColor: Color.fromARGB(100, 0, 149, 255),
                elevation: 5,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 16)),
            onPressed: onPressed));
  }
}
class Button extends StatelessWidget {
  Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  //this calls the onpressed widget
  final String onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
                  decoration: BoxDecoration(
           borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient:
                const LinearGradient(colors: [Color(0xFF0095ff), Color(0xFF0260ff)])
            ),
        width: MediaQuery.of(context).size.width,
          child: OutlinedButton(
              child: Text(text),
              style: OutlinedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  primary: Colors.white,
                 // backgroundColor: Pallete.primaryColor,
                  shadowColor: Pallete.text,
                  elevation: 0,
                  textStyle: AppFonts.headerBlack.copyWith(fontSize: 14)),
              onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(onPressed, (route) => false)),
        ));
  }
}
