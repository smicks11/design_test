import 'package:design_test/shared/utils/colors.dart';
import 'package:design_test/shared/utils/utilities.dart';
import 'package:flutter/material.dart';
import '../../core/base/base_view.dart';
import 'components/header.dart';
import 'components/more_actions.dart';
import 'components/product_header.dart';
import 'components/product_list.dart';
import 'view-model/home_vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      vmBuilder: (context) => HomeViewModel(
        context: context,
      ),
      builder: _buildScreen,
    );
  }

  Widget _buildScreen(BuildContext context, HomeViewModel model) => Scaffold(
      backgroundColor: AppColors.grayscaleInputColor.withOpacity(0.4),
      body: SizedBox(
        height: deviceHeight(context) * 1.0,
        width: deviceWidth(context) * 1.0,
        child: CustomScrollView(
          slivers: [
            header(model, context),
            moreActions(context, model),
            productHeader(),
            ProductList(model: model),
          ],
        ),
      ));
}
