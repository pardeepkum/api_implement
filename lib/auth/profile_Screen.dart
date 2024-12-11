import 'dart:io';
import 'package:api_testing/common_widgets/profile_picture_widget.dart';
import 'package:api_testing/utils/imports.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Declare  a textField for  for api calling the data variable to pass the data for api
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController mobile = TextEditingController();

  //variable declare for a image picker
  File? _profileImage;
  List<String> imagePaths = [];

  //method for the pick image
  Future<void> _pickImage(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        setState(() {
          _profileImage = File(pickedFile.path);
          imagePaths.add(pickedFile.path);
        });
      } else {
        if (kDebugMode) {
          print("User canceled image picker");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error picking image: $e");
      }
    }
  }

  // show the bottomSheet Modal sheet
  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Camera"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Gallery"),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RoundedButton(
              onTap: () {},
              buttonName: "Submit",
              child: Text("Submit",
                  style: MyTexts.medium16.copyWith(color: MyColors.white)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ProfilePicWidget(
                    profileImage:
                        _profileImage != null ? _profileImage!.path : '',
                    heroTag: "profilePic",
                    firstName: "John",
                    lastName: "Doe",
                    userName: "",
                    subInfo: "",
                    picSize: 100,
                    onCameraTap: () => _showImagePickerOptions(context),
                    onEditTap: () => _showImagePickerOptions(context),
                    onPicTap: () {
                      if (kDebugMode) {
                        print("Profile picture tapped");
                      }
                    },
                    showBgCurves: true,
                    showCameraIconOnCorner: true,
                    isEditIcon: false,
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextField("Name", name),
                _buildTextField("Password", password, isPassword: true),
                _buildTextField("Email", email),
                _buildTextField("Mobile", mobile),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Visibility(
                        visible: index < imagePaths.length + 1,
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                            image: index < imagePaths.length
                                ? DecorationImage(
                                    image: FileImage(File(imagePaths[index])),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: index < imagePaths.length
                              ? Container()
                              : IconButton(
                                  icon: const Icon(Icons.add_a_photo, size: 30),
                                  onPressed: () async {
                                    _showImagePickerOptions(context);
                                  },
                                ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: MyTexts.medium16),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              hintText: "Enter your $label",
            ),
          ),
        ],
      ),
    );
  }
}
