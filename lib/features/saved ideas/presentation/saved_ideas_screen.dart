import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:harry_mine/constants/text_font_style.dart';
import 'package:harry_mine/features/saved%20ideas/model/business_model.dart';
import 'package:harry_mine/features/saved%20ideas/presentation/widgets/saved_idea_custom_cart.dart';
import 'package:harry_mine/gen/assets.gen.dart';
import 'package:harry_mine/gen/colors.gen.dart';
import 'package:harry_mine/helpers/ui_helpers.dart';
import 'package:harry_mine/networks/endpoints.dart';
import '../../../helpers/dao_access.dart';
import '../../../networks/api_acess.dart';

class SavedIdeasScreen extends StatefulWidget {
  const SavedIdeasScreen({super.key});

  @override
  State<SavedIdeasScreen> createState() => _SavedIdeasScreenState();
}

class _SavedIdeasScreenState extends State<SavedIdeasScreen> {
  @override
  void initState() {
    super.initState();
    getBusinessRX.fetchCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.allPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 80.h,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        leadingWidth: 40.w,
        title: Text("Save Business Ideas",
            style: TextFontStyle.headline20cDFE1E6Poppins500),
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: UIHelper.kDefaulutPadding()),
            child: Image.asset(
              Assets.icons.saveFillSmall.path,
              height: 24.h,
              width: 24.w,
            ),
          )
        ],
      ),
      body: StreamBuilder(
          stream: getBusinessRX.getBusinessData,
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<BusinessModel> dataList = snapshot.data["data"];
              if (dataList.isEmpty) {
                return Center(
                  child: Text(
                    "No Saved Business Found!",
                    style: TextFontStyle.title14whitePoppins400,
                  ),
                );
              } else {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      BusinessModel dataModel = dataList[index];
                      return GestureDetector(
                        onTap: () async {
                          Map<String, dynamic> mapedData = {
                            'hasNext': false,
                            'data': dataModel
                          };
                          getIdeaRXObj.addOfflineData(mapedData);
                          Navigator.pop(context);
                        },
                        child: SavedIdeaCustomCart(
                          id: dataModel.uid,
                          name: dataModel.name,
                          capital: dataModel.capital,
                          skills: dataModel.skills,
                          employee: dataModel.necessaryPeople,
                          imagePath: url + dataModel.imagePath,
                        ),
                      );
                    });
              }
            }
          }),
    );
  }
}
