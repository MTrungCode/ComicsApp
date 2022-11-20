import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';
import '../shared/dialog_utils.dart';
import 'user_manager.dart';

class UserEditInfoScreen extends StatefulWidget {
  static const routeName = '/edit-user';

    UserEditInfoScreen(
      User? product, {
        super.key,
    }) {
      if (product == null) {
        this.product = User(
          id: null,
          name: '',
          address: '',
          birthday: '',
          sex: '',
        );
      } else {
    this.product = product;
    }
  }
  late final User product;

  @override
    State<UserEditInfoScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<UserEditInfoScreen> {

  final _editForm = GlobalKey<FormState>();
  late User _editedProduct;
  var _isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
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
                buildNameField(),
                buildSexField(),
                buildBirthdayField(),
                buildAddressField(),
              ],
            ),
          ),
        ),
    );  
  }
 
  TextFormField buildNameField() {
    return TextFormField(
      initialValue: _editedProduct.name,
      decoration: const InputDecoration(labelText: 'Tên'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Tên không được để trống.';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(name: value);
      },
    );
  }

  TextFormField buildSexField() {
    return TextFormField(
      initialValue: _editedProduct.sex,
      decoration: const InputDecoration(labelText: 'Giới tính'),
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
        _editedProduct = _editedProduct.copyWith(sex: value);
      },
    );
  }

  TextFormField buildBirthdayField() {
    return TextFormField(
      initialValue: _editedProduct.birthday,
      decoration: const InputDecoration(labelText: 'Ngày sinh'),
      maxLines: 3,
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
        _editedProduct = _editedProduct.copyWith(birthday: value);
      },
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      initialValue: _editedProduct.address,
      decoration: const InputDecoration(labelText: 'Địa chỉ'),
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
        _editedProduct = _editedProduct.copyWith(address: value);
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
    final productsManager = context.read<UserManager>();
    if (_editedProduct.id != null) {
       productsManager.updateInfo(_editedProduct);
  } else {
      productsManager.addNewInfo(_editedProduct);
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