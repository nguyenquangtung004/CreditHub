import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:credit_hub_app/ui/widgets/add_width_drawal_request/custom_rich_text.dart';
import 'package:credit_hub_app/ui/widgets/add_width_drawal_request/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/app_string.dart';
import '../../../core/constant/constant.dart';
import '../../../data/model/add_without/add_without.dart';
import '../../widgets/add_width_drawal_request/custom_dotted_border_box.dart';
import 'cubit/add_withdrawal_request_cubit.dart';

class AddWithDrawalRequestScreen extends StatefulWidget {
  const AddWithDrawalRequestScreen({super.key});

  @override
  State<AddWithDrawalRequestScreen> createState() =>
      _AddWithDrawalRequestScreenState();
}

class _AddWithDrawalRequestScreenState extends State<AddWithDrawalRequestScreen> {
  /* ------------------- Khai báo các thuộc tính thành phần ------------------- */
  final TextEditingController _lotNoController = TextEditingController();
  final TextEditingController _moneyRequestController = TextEditingController();
  File? _selectedImage; // Ảnh đã chọn
  String? _uploadedImageName;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false; // Trạng thái đang tải ảnh lên server

  /* ----------------- Chọn ảnh và upload server ngay lập tức ----------------- */
  Future<void> _pickImage(ImageSource source) async {
  final pickedFile = await _picker.pickImage(source: source, imageQuality: 80);

  if (pickedFile != null) {
    setState(() {
      _selectedImage = File(pickedFile.path);
    });

    // ✅ Gọi API upload ảnh ngay lập tức mà không hiển thị loading
    _uploadImageToServer();
  }
}

  /// ✅ Gọi API upload ảnh, nhận về URL và trích xuất tên file
  Future<void> _uploadImageToServer() async {
  if (_selectedImage == null) return;

  try {
    final imageUrl = await context.read<AddWithdrawalRequestCubit>().uploadImage(_selectedImage!);


   if (imageUrl != null && imageUrl.isNotEmpty) {
  Uri uri = Uri.parse(imageUrl);

      String fileName = uri.pathSegments.last;

      setState(() {
        _uploadedImageName = fileName; // ✅ Lưu tên file để gửi lên API
      });
      Get.snackbar("Thành công", "Upload ảnh thành côg lên server $_uploadedImageName");
    
    }
  } catch (e) {
    Get.snackbar("Lỗi", "Lỗi upload ảnh");
  
  }
}

  /* --------------------- Gửi yêu cầu rút tiền lên server -------------------- */
  void _submitRequest() {
    final lotNo = _lotNoController.text.trim();
    final moneyRequest =
        double.tryParse(_moneyRequestController.text.trim()) ?? 0.0;

    if (lotNo.isEmpty || moneyRequest <= 0) {
      Get.snackbar("Lỗi", "Vui lòng nhập đầy đủ thông tin");
      return;
    }

    setState(() {
      _isUploading = true; // ✅ Bắt đầu loading khi gửi request
    });

    final request = AddWithout(
      lot_no: lotNo,
      money_request: moneyRequest,
      image_link: _uploadedImageName ?? "", // ✅ Gửi URL ảnh
    );

    context.read<AddWithdrawalRequestCubit>().addWithdrawalRequest(
          requestItem: request,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 25,
        centerTitle: true,
        title: const Text(
          textAddWithdrawal,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<AddWithdrawalRequestCubit, AddWithdrawalRequestState>(
        listener: (context, state) {
          if (state is Loading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is Success) {
            Navigator.pop(context);
            setState(() {
              _isUploading = false; // ✅ Dừng loading khi thành công
            });
            Get.snackbar("Thành công", "Gửi dữ liệu để quyết toán thành công");
          } else if (state is Failure) {
            Get.back();
            setState(() {
              _isUploading = false; // ✅ Dừng loading khi lỗi xảy ra
            });
           
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              h(20),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextTitleLot, textTitle01: richTextTitle01)
                ],
              ),
              h(10),
              CustomTextField(
                hintText: textHintLot,
                controller: _lotNoController,
              ),
              h(22),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextTitlePrice,
                      textTitle01: richTextTitle01)
                ],
              ),
              h(10),
              CustomTextField(
                hintText: textHintPrice,
                controller: _moneyRequestController,
              ),
              h(22),
              const Row(
                children: [
                  CustomRichText(
                      textTitle: richTextImage, textTitle01: richTextTitle01)
                ],
              ),
              h(22),
              GestureDetector(
                onTap: () => _showImagePickerOptions(),
                child: _isUploading
                    ? const Center(
                        child:
                            CircularProgressIndicator()) // ✅ Hiển thị loading khi đang tải ảnh
                    : _selectedImage == null
                        ? const DottedBorderBox() // ✅ Hiển thị nút chọn ảnh nếu chưa chọn
                        : Image.file(
                            _selectedImage!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
              ),
              h(48),
              SizedBox(
                width: double.infinity,
                height: 65,
                child: ElevatedButton(
                  onPressed: _submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.5),
                    ),
                  ),
                  child: const Text(
                    "Gửi Yêu Cầu",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Hiển thị lựa chọn: Chụp ảnh hoặc chọn từ thư viện
  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Chọn từ thư viện"),
                onTap: () {
                  Get.back();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Chụp ảnh"),
                onTap: () {
                  Get.back();
                  _pickImage(ImageSource.camera);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _lotNoController.dispose();
    _moneyRequestController.dispose();
    super.dispose();
  }
}
