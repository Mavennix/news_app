import 'package:flutter/material.dart';
import 'package:news_app/core/view_models/base_view_model.dart';
import 'package:news_app/locator.dart';
import 'package:provider/provider.dart';

class BaseUi<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  const BaseUi({Key key, this.builder, this.onModelReady}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseUi<T>> {
  T model = locator<T>();
  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => model,
      child: Consumer<T>(
        builder: widget.builder,
      ),
    );
  }
}
