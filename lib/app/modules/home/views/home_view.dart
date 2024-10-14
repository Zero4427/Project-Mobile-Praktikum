import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final HomeController _controller = Get.put(HomeController());
  File? _image; // Variabel untuk menyimpan gambar yang diambil

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path); // Simpan gambar ke variabel
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          '9:41',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Splash some color',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text('White', style: TextStyle(color: Colors.grey, fontSize: 18)),
            SizedBox(height: 8),
            Text(
              'Rp.330.000,-',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickImage, // Panggil fungsi _pickImage
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  'Pick an image',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 24),
            if (_image != null) ...[
              SizedBox(height: 16),
              Image.file(
                _image!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ],
            SizedBox(height: 24),
            Text(
              'Reviews',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  '4,5',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                Text(
                  '/5',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                SizedBox(width: 16),
                Icon(Icons.star, color: Colors.yellow, size: 30),
                Icon(Icons.star, color: Colors.yellow, size: 30),
                Icon(Icons.star, color: Colors.yellow, size: 30),
                Icon(Icons.star, color: Colors.yellow, size: 30),
                Icon(Icons.star_half, color: Colors.yellow, size: 30),
              ],
            ),
            SizedBox(height: 8),
            Text('999+ reviews', style: TextStyle(color: Colors.grey)),
            SizedBox(height: 24),
            Text(
              'Most Mentioned:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                _buildTag('Comfortable'),
                SizedBox(width: 8),
                _buildTag('Best'),
                SizedBox(width: 8),
                _buildTag('Fast Delivery'),
              ],
            ),
            SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildReview('4,2', 'Amat', '1 Jan 2024', 'Recommended item and according to order'),
                  _buildReview('4,7', 'Amat', '10 Jan 2024', 'Best stuff!!!'),
                  _buildReview('4,4', 'Agus', '17 Jan 2024', 'Very Fast Shipping!'),
                  _buildReview('4,0', 'Ijay', '30 Jan 2024', 'The courier was not friendly, but the goods arrived safely!'),
                  _buildReview('3,0', 'Asrul', '5 Apr 2024', 'The expedition was very long and unfriendly'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.black,
      labelStyle: TextStyle(color: Colors.white),
    );
  }

  Widget _buildReview(String rating, String reviewer, String date, String comment) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              rating,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '/5',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(width: 16),
            Text(
              'By $reviewer',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(date, style: TextStyle(color: Colors.grey)),
        SizedBox(height: 8),
        Text(comment),
        SizedBox(height: 24),
      ],
    );
  }
}
