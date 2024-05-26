import 'package:flutter/material.dart';
import 'package:ui_elements/amount/num_button.dart';
import 'package:ui_elements/colors.dart';

import '../button/button.dart';
import '../sizes.dart';
import '../text_styles.dart';

class EditAmountScreen extends StatefulWidget{
  final String title;
  final String? name,uuid;
  final bool popOnProceed;
  final TextEditingController controller = TextEditingController();
  final void Function(double?) onProceed;
  EditAmountScreen({super.key,
      this.title = "Enter Amount",
    this.name,
    this.uuid,
    this.popOnProceed = false,
    required this.onProceed,

  });

  @override
  State<StatefulWidget> createState() {
    return _EditAmountState();
  }
}
class _EditAmountState extends State<EditAmountScreen>{
  List<String> numbers = ["1","2","3","4","5","6","7","8","9",".","0"];
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.size20,vertical: AppSizes.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            if(widget.name != null)
              Text(widget.name!,style: AppTextStyle.regular(
                  fontSize: AppSizes.size22,
                  color: AppColor.subtitleTextColor
              ),),
            if(widget.uuid!=null)
              Text("UUID: ${widget.uuid}",style: AppTextStyle.regular(
                  fontSize: AppSizes.size22,
                color: AppColor.subtitleTextColor
              ),),

            const SizedBox(height: AppSizes.size8),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: AppSizes.size8,horizontal: AppSizes.size10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(AppSizes.size16)),
                color: AppColor.textFieldBackgroundColor
              ),
              child: TextFormField(
                controller: widget.controller,
                readOnly: true,
                textAlign: TextAlign.center,
                style : AppTextStyle.semiBold(fontSize: AppSizes.size38),
                decoration: const InputDecoration(
                  hintText: "0",
                  border: InputBorder.none
                ),

                //widget.controller.text.isEmpty?"0":widget.controller.text,style: AppTextStyle.semiBold(fontSize: AppSizes.size38),
              ),
            ),
            GridView.count(physics: const NeverScrollableScrollPhysics(),crossAxisCount: 3,shrinkWrap: true,children: numbers.map((String number){
              return  NumButton(controller: widget.controller,number: number,);
            }).toList()..add(NumButton(controller: widget.controller,icon:Icons.backspace_outlined,number: "",),),),
            AppButton.primary(
              onPressed: (){
                widget.onProceed.call(double.parse(widget.controller.text));
                if(widget.popOnProceed) {
                  Navigator.of(context).pop();
                }
              },
              title: "Proceed",
            )
          ],
        ),
      ),
    );
  }
}