import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../shared/dialog_utils.dart';
import 'user_manager.dart';

class UserEditInfoScreen extends StatefulWidget {
  static const routeName = '/edit-user';

    UserEditInfoScreen(
      User? user, {
        super.key,
    }) {
      if (user == null) {
        this.user = User(
          id: null,
          name: '',
          address: '',
          birthday: '',
          sex: '',
        );
      } else {
    this.user = user;
    }
  }
  late final User user;

  @override
    State<UserEditInfoScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<UserEditInfoScreen> {

  final _editForm = GlobalKey<FormState>();
  late User _editedUser;
  var _isLoading = false;

  @override
  void initState() {

    _editedUser = widget.user;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            color: Color.fromARGB(255, 23, 106, 174),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
        ? const Center(
          child: CircularProgressIndicator(),
        )
        : Padding(
          padding:  const EdgeInsets.all(16.0),
          child: Form(
            key: _editForm,
            child: ListView(
              children: <Widget>[
                SizedBox(
                  width: 250,
                  height: 500,
                  child: Card(
                    child: Column(                     
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 40,20,10),
                          child: buildNameField(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30,20,10),
                          child: buildSexField(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30,20,10),
                          child: buildBirthdayField(),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 30,20,10),
                          child: buildAddressField(),
                        ),
                      ],
                    ),
                )
                )
              ],
            ),
          ),
        ),
    );  
  }
 
  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedUser.name,
      decoration: const InputDecoration(labelText: 'Tên',
      border: OutlineInputBorder()),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Tên không được để trống.';
        }
        return null;
      },
      onSaved: (value) {
        _editedUser = _editedUser.copyWith(name: value);
      },
    );
  }

  TextFormField buildSexField() {
    return TextFormField(
      initialValue: _editedUser.sex,
      decoration: const InputDecoration(labelText: 'Giới tính',
      border: OutlineInputBorder()),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Không được để trống.';
        }
        if ((value.toLowerCase() != 'nữ') || value.toLowerCase() != 'nam'){
          return 'Không hợp lệ - giới tính là nam hoặc nữ';
        }
        return null;
      },
      onSaved: (value) {
        _editedUser = _editedUser.copyWith(sex: value);
      },
    );
  }

  TextFormField buildBirthdayField() {
    return TextFormField(
      initialValue: _editedUser.birthday,
      decoration: const InputDecoration(labelText: 'Ngày sinh',
      border: OutlineInputBorder()),
      maxLines: 1,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Ngày sinh không được để trống.';
        }
        if (value.length < 6) {
          return 'Ngày sinh có định dạng DD/MM/YY.';
        }
        return null;
      },
      onSaved: (value) {
        _editedUser = _editedUser.copyWith(birthday: value);
      },
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      initialValue: _editedUser.address,
      decoration: const InputDecoration(labelText: 'Địa chỉ',
      border: OutlineInputBorder()),
      maxLines: 2,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Địa chỉ không được để trống.';
        }
        if (value.length < 6) {
          return 'Địa chỉ phải nhiều hơn 6 ký tự.';
        }
        return null;
      },
      onSaved: (value) {
        _editedUser = _editedUser.copyWith(address: value);
      },
    );
  }



  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
  _editForm.currentState!.save();

  setState(() {
    _isLoading = true;
  });

  try {
    final usersManager = context.read<UserManager>();
    if (_editedUser.id != null) {
       usersManager.updateInfo(_editedUser);
  } else {
      usersManager.addNewInfo(_editedUser);
  }
  } catch (error) {
      await showErrorDialog(context, 'Có lỗi xảy ra .');
  }

  setState(() {
    _isLoading = false;
  });
  
  if(mounted) {
    Navigator.of(context).pop();
  }
}


}