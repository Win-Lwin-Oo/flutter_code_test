import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:state_data_test/component/account_button.dart';
import 'package:state_data_test/component/gender_card.dart';
import 'package:state_data_test/constant/color_property.dart';
import 'package:state_data_test/constant/gender.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  Gender selectedGender = Gender.female;

  _initiateTextFieldValue() {
    birthdayController.text = 'DD/MM/YYYY';
  }

  _selectGender(Gender gender) {
    setState(() {
      selectedGender = gender;
    });
  }

  @override
  void initState() {
    _initiateTextFieldValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 250.h,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80, left: 20),
                color: BG_COLOR,
                width: double.infinity,
                height: 180,
                child: Wrap(direction: Axis.vertical, children: const [
                  Text(
                    'Almost there!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Complete the form elow to create',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    'your Ready to travel account.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    '*Mandatory',
                    style: TextStyle(color: Colors.grey),
                  ),
                ]),
              ),
              Positioned(
                top: 100.h,
                left: 280.w,
                child: SizedBox(
                  width: 100,
                  child: Image.asset('assets/images/guitar.png'),
                ),
              ),
              Positioned(
                  top: 40,
                  left: 15,
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(CupertinoIcons.back)))
            ],
          ),
        ),
        Flexible(
          child: SingleChildScrollView(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextField(
                  controller: lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextField(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('DD/MM/yyyy').format(pickedDate);
                            setState(() {
                              birthdayController.text = formattedDate;
                            });
                          }
                        },
                        controller: birthdayController,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Date of Birth *',
                            suffixIcon: Image.asset(
                              'assets/images/dob.png',
                              width: 10,
                            )),
                      ),
                    ),
                    Container(
                      width: 160.w,
                      height: 50,
                      decoration: BoxDecoration(
                          color: BG_COLOR,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GenderCard(
                              isSelected: selectedGender == Gender.female
                                  ? true
                                  : false,
                              gender: 'Female',
                              onTap: () => _selectGender(Gender.female),
                            ),
                            GenderCard(
                              isSelected:
                                  selectedGender == Gender.male ? true : false,
                              gender: 'Male',
                              onTap: () => _selectGender(Gender.male),
                            )
                          ]),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextField(
                  controller: nationalityController,
                  decoration: const InputDecoration(
                    labelText: 'Nationality *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 20, right: 20),
                child: TextField(
                  controller: countryController,
                  decoration: const InputDecoration(
                    labelText: 'Country of Residence *',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 20, right: 20, bottom: 20),
                child: IntlPhoneField(
                  controller: mobileController,
                  showCountryFlag: false,
                  // showDropdownIcon: false,
                  decoration: const InputDecoration(
                    labelText: 'Mobile no. (Optional)',
                  ),
                  initialCountryCode: 'MM',
                  onChanged: (phone) {
                    // print(phone.completeNumber);
                  },
                ),
              ),
            ]),
          ),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: AccountButton(
            title: 'Create my account now',
            onPressed: () {},
          ),
        )
      ]),
    );
  }
}
