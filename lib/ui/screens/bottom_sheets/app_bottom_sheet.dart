import 'package:flutter/material.dart';
import 'package:todo/ui/comman/my_text_field.dart';
import 'package:todo/ui/utilts/AppTheme.dart';
import 'package:todo/ui/utilts/app_colors.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        height: MediaQuery.of(context).size.height*0.4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Add New task",textAlign: TextAlign.center,style: AppTheme.bottomSheetTitleTextStyle,),
            const SizedBox(height: 16,),
            MyTextField(hintText: "Enter Task title",),
            const SizedBox(height: 8,),
             MyTextField(hintText: "Enter Task description",),
            const SizedBox(height: 16,),
            Text("Select date",style: AppTheme.bottomSheetTitleTextStyle.copyWith(fontWeight: FontWeight.w600),),
            Text("24/9/2023",textAlign: TextAlign.center,style: AppTheme.bottomSheetTitleTextStyle.copyWith(fontWeight: FontWeight.normal,color: AppColors.gray),),
            const Spacer(),
            ElevatedButton(onPressed: (){}, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
