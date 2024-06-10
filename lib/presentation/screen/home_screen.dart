import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kitep/constants/constants.dart';
import 'package:kitep/presentation/widget/check_box.dart';
import 'package:kitep/presentation/widget/custom_button.dart';
import 'package:kitep/presentation/widget/text_field.dart';
import 'package:kitep/presentation/widget/text_field2.dart';
import 'package:kitep/presentation/widget/text_field_with_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController -----------------------------------------------------
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  final TextEditingController _controller5 = TextEditingController();
  final TextEditingController _controller6 = TextEditingController();

  bool isPdfFileUploaded = false;

  final List<String> placesRu = ['ИСТ', 'АССТ'];

  bool showAdd = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildBody(),
    );
  }

  @override
  void initState() {
    final dateFormatter = DateFormat('dd.MM.yyyy');
    String result = dateFormatter.format(DateTime.now());
    _controller1.text = result;
    super.initState();
  }

  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Комплект', style: MTextStyle.appBarTextStyle),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextFieldWithColumnText(
              title: 'Буйрутма',
              controller: _controller1,
              hintText: '01.02.2023',
              keyboardType: TextInputType.datetime,
              canEdit: false,
            ),
            const SizedBox(height: 24),
            _buildDropDown(),
            const SizedBox(height: 24),
            CustomTextFieldWithColumnText(
              title: 'Буйрутма беруу мөөнөтү',
              controller: _controller3,
              hintText: '01.02.2023',
            ),
            const SizedBox(height: 24),
            CustomTextFieldWithColumnText(
              title: 'Китеп фонду',
              controller: _controller2,
              hintText: '01.02.2023',
            ),
            const SizedBox(height: 24),
            _uploadPDF(),
            const SizedBox(height: 30),
            _buildForInformation(),
            const SizedBox(height: 24),
            _buildSupplyRatio(),
            const SizedBox(height: 24),
            _newBooksCame(),
            const SizedBox(height: 30),
            CustomButton(
              title: 'Жөнөтүү',
              onTap: () => isFulledFields()
                  ? MToast().showBrown('Жөнөтүлдү')
                  : MToast().showRed('Бардык талалар толтурулушу зарыл!'),
            )
          ],
        ),
      ),
    );
  }

  Widget _uploadPDF() {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      leading: TextButton(
        onPressed: takeFileFromPhone,
        child: Text('PDF жүктөө',
            style: GoogleFonts.inter(
              textStyle: MTextStyle.ui_16Medium(Colors.blue.shade900),
            )),
      ),
      trailing: CustomCheckBox(isPdfFileUploaded: isPdfFileUploaded),
    );
  }

  Widget _newBooksCame() {
    return ListTile(
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      horizontalTitleGap: 0,
      leading: TextButton(
        onPressed: takeFileFromPhone,
        child: Text(
          'Жаны келип тушкон китептер',
          style: GoogleFonts.inter(
            textStyle: MTextStyle.ui_16Medium(Colors.blue.shade900),
          ),
        ),
      ),
      trailing: CustomCheckBox(isPdfFileUploaded: isPdfFileUploaded),
    );
  }

  Widget _buildSupplyRatio() {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            hasText: true,
            title: 'Камсыздоо коэффициенти',
            controller: _controller5,
            hintText: '0 - 100',
            textFieldWidth: 100,
            keyboardType: TextInputType.number,
          ),
        ),
        Text(
          '  %',
          style: MTextStyle.ui_16Medium(Color(0xff000000)),
        )
      ],
    );
  }

  Widget _buildForInformation() {
    return Column(
      children: [
        Center(
          child: Text(
            'Маалымат учун',
            style: MTextStyle.ui_16Medium(MColor.black),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 5),
        Row(
          children: [
            Spacer(),
            Row(
              children: [
                Text(
                  'ст. с.',
                  style: MTextStyle.h3_14Regular(MColor.greenPrimary),
                ),
                SizedBox(width: 20),
                Text(
                  'кт. с.',
                  style: MTextStyle.h3_14Regular(MColor.greenPrimary),
                ),
              ],
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Негизги адабият',
              style: MTextStyle.h3_14Regular(MColor.black),
            ),
            Row(
              children: [
                Text('2'),
                SizedBox(width: 40),
                Text('1'),
                SizedBox(width: 8),
              ],
            )
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Кошумча адабият',
              style: MTextStyle.h3_14Regular(MColor.black),
            ),
            Row(
              children: [
                Text('3-5'),
                SizedBox(width: 40),
                Text('1'),
                SizedBox(width: 8),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _buildDropDown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Кафедра',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              height: 14.52 / 12,
              color: Color(0xFF666666),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            !showAdd
                ? Expanded(
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: MColor.gray_01,
                          border: Border.all(color: MColor.greenPrimary),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButtonFormField<String>(
                        dropdownColor: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 0, right: 0, top: 9, bottom: 9),
                          hintText: 'Тандаңыз',
                          border: InputBorder.none,
                        ),
                        selectedItemBuilder: (_) {
                          return placesRu
                              .map(
                                (e) => Text(
                                  e,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 16,
                                    height: 0,
                                  ),
                                ),
                              )
                              .toList();
                        },
                        value: _choosenData,
                        icon: Icon(Icons.arrow_drop_down),
                        items: placesRu.map((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.white,
                                height: 0,
                                fontSize: 16,
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _choosenData = newValue;
                          });
                        },
                      ),
                    ),
                  )
                : addNewDepartment(),
            GestureDetector(
                onTap: () {
                  setState(() {
                    showAdd = !showAdd;
                  });
                },
                child: Icon(showAdd ? Icons.remove : Icons.add)),
          ],
        ),
      ],
    );
  }

  Widget addNewDepartment() {
    return Expanded(
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: CustomTextField2(
                title: '',
                controller: _controller6,
                hintText: 'жаны кафедра кошуу',
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  if (_controller6.text.isNotEmpty) {
                    setState(() {
                      placesRu.add(_controller6.text);
                      showAdd = !showAdd;
                    });
                    _controller6.clear();
                  } else {
                    MToast().showRed('Талаа бош болбосун!');
                  }
                },
                child: Text(
                  'Кошуу',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _choosenData = null;

  bool isFulledFields() {
    return _controller1.text.isNotEmpty &&
            _controller2.text.isNotEmpty &&
            _controller3.text.isNotEmpty &&
            _controller4.text.isNotEmpty &&
            _controller5.text.isNotEmpty &&
            isPdfFileUploaded
        ? true
        : false;
  }

  void takeFileFromPhone() async {
    final takenFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (takenFile != null) {
      setState(() {
        isPdfFileUploaded = true;
      });

      //String fileName = takenFile.files[0].name;
      //print('File is uploaded');
    } else {
      MToast().showRed('Не вышло загрузить pdf-файл');
    }
  }
}
