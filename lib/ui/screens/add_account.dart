import 'dart:ui';

import 'package:credit_hub_app/core/button/app_button.dart';
import 'package:credit_hub_app/core/components/text_field/app_text_field.dart';
import 'package:credit_hub_app/core/constant/app_string.dart';
import 'package:credit_hub_app/core/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/add_account/custom_dropdown_button.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController accountController = TextEditingController();
    final TextEditingController nameAccountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        
          
        ),
        centerTitle: true,
        title: const Text(
          titleTextAdd,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: titleNumberAccount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),
              CustomTextField(label: labelAddAccount, controller: accountController,),
              h(22),
              RichText(
                text: TextSpan(
                  text: titleNameAccount,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),
              CustomTextField(label: labelNameAccount, controller: nameAccountController,),
              h(22),
              RichText(
                text: TextSpan(
                  text: titlebank,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: richTextTitle01,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              h(9),
              CustomDropdownButton(
                options: [
                 
                ],
                initialValue: 'TECHCOMBANK',
                onChanged: (value) {
                  // Xử lý sự kiện chọn ngân hàng
                  print('Ngân hàng đã chọn: $value');
                },
              ),
              h(22),
              Container(
                width: double.infinity,
                child: AppButton(
                  label: "Thêm Mới",
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
