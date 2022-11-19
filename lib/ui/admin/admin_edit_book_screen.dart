import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/book.dart';
import '../shared/dialog_utils.dart';
import '../books/book_manager.dart';

class EditBookScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  EditBookScreen(
    Book? book, {
    super.key,
  }) {
    if (book == null) {
      this.book = Book(
        id: null,
        title: '',
        type: '',
        price: 0,
        description: '',
        imageUrl: '',
      );
    } else {
      this.book = book;
    }
  }
  late final Book book;

  @override
  State<EditBookScreen> createState() => _EditBookScreenState();
}

class _EditBookScreenState extends State<EditBookScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Book _editedBook;
  var _isLoading = false;

  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('. jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedBook = widget.book;
    _imageUrlController.text = _editedBook.imageUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chỉnh sửa thông tin sách'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  padding: const EdgeInsets.all(10.0),
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: buildTitleField(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: buildPriceField(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: buildCategoryField(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: buildDescriptionField(),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child: buildBookPreview(),
                    ),

                    // Center(
                    //   child: TextButton(
                    //     onPressed: _saveForm,
                    //     child: Text('Lưu'),
                    //     style: TextButton.styleFrom(
                    //       foregroundColor: Color.fromARGB(255, 245, 245, 245),
                    //       backgroundColor: Color.fromARGB(255, 49, 163, 32)  ,
                    //       minimumSize: Size(100, 50)
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _saveForm,
        icon: const Icon(Icons.save),
        label: const Text("SAVE"),
        backgroundColor: Colors.blue,
      ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedBook.title,
      decoration: const InputDecoration(
          labelText: 'Tên truyện', border: OutlineInputBorder()),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập tên truyện.';
        }
        return null;
      },
      onSaved: (value) {
        _editedBook = _editedBook.copyWith(title: value);
      },
    );
  }

  TextFormField buildPriceField() {
    return TextFormField(
      initialValue: _editedBook.price.toString(),
      decoration: const InputDecoration(
        labelText: 'Giá truyện',
        border: OutlineInputBorder(),
      ),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nhập giá sản phẩm.';
        }
        if (double.tryParse(value) == null) {
          return 'Nhập số hợp lệ.';
        }
        if (double.parse(value) <= 0) {
          return 'Nhập một số > 0.';
        }
        return null;
      },
      onSaved: (value) {
        _editedBook = _editedBook.copyWith(price: double.parse(value!));
      },
    );
  }

  TextFormField buildCategoryField() {
    return TextFormField(
      initialValue: _editedBook.type,
      decoration: const InputDecoration(
          labelText: 'Thể loại', border: OutlineInputBorder()),
      maxLines: 1,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nhập thể loại truyện';
        }
        if (value.length < 5) {
          return 'Số ký tự phải > 5';
        }
        return null;
      },
      onSaved: (value) {
        _editedBook = _editedBook.copyWith(type: value);
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedBook.description,
      decoration: const InputDecoration(
          labelText: 'Mô tả', border: OutlineInputBorder()),
      maxLines: 3,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nhập mô tả truyện.';
        }
        if (value.length < 10) {
          return 'Số ký tự > 10.';
        }
        return null;
      },
      onSaved: (value) {
        _editedBook = _editedBook.copyWith(description: value);
      },
    );
  }

  Widget buildBookPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 67,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
          child: _imageUrlController.text.isEmpty
              ? const Text('Nhập đường dẫn ảnh')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(
          child: buildImageURLField(),
        )
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Đường dẫn ảnh', border: OutlineInputBorder()),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Nhập đường dẫn ảnh.';
        }
        if (!_isValidImageUrl(value)) {
          return 'Hãy nhập đường dẫn hợp lệ.';
        }
        return null;
      },
      onSaved: (value) {
        _editedBook = _editedBook.copyWith(imageUrl: value);
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
      final booksManager = context.read<BookManager>();
      if (_editedBook.id != null) {
        booksManager.updateBook(_editedBook);
      } else {
        booksManager.addBook(_editedBook);
      }
    } catch (error) {
      await showErrorDialog(context, 'Có lỗi xảy ra.');
    }

    setState(() {
      _isLoading = false;
    });

    if (mounted) {
      Navigator.of(context).pop();
    }
  }
}
