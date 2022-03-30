import 'package:flutter/material.dart';
import '../my_themes.dart';
class CustomButton extends StatefulWidget {
  final  onTap;
  final String? btnTxt;
  final Color? backgroundColor;
  final bool? onPressed;
   CustomButton({ this.onTap,  required this.btnTxt,this.backgroundColor, this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: widget.onTap==null? AppColors.darkGrey:AppColors.accentColor ,
      minimumSize: Size(MediaQuery.of(context).size.width, 52),
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return  ElevatedButton(
      onPressed:  widget.onTap,
      style: flatButtonStyle,
      child:
          widget.onPressed==true?const CircularProgressIndicator(strokeWidth: 2.5,):
      Text(widget.btnTxt!,
          style: Theme.of(context).textTheme.headline3?.copyWith(color: AppColors.whiteColor, fontSize: 16)),
    );
  }
}