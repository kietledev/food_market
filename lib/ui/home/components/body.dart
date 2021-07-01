import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_market/bloc/home_bloc/home_bloc.dart';
import 'package:food_market/components/componets.dart';
import 'package:food_market/components/icon_btn_with_counter.dart';
import 'package:food_market/helpers/size_config.dart';
import 'package:food_market/models/food_model.dart';
import 'package:food_market/ui/search/search_ui.dart';
import '../../../helpers/constants.dart';

class Body extends StatelessWidget {
  final FocusNode focusSearch = new FocusNode();
  final ScrollController scrollController = ScrollController();
  late List<FoodModel> listFood = <FoodModel>[];

  initVariable(BuildContext context) {
    focusSearch.addListener(() {
      FocusScope.of(context).unfocus();
    });
  }

  getNewData(HomeBloc bloc) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          bloc.add(GetListFoodStartEvent(date: '${listFood.last.createdAt}'));
        }
      }
    });
  }

  updateData(List<FoodModel> listNewFood) {
    // FoodModel a = listFood.first;
    // a.images = [];
    // listFood.add(a);
    listFood = listFood + listNewFood;
  }

  Widget build(BuildContext context) {
    HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(GetListFoodStartEvent(date: '0'));
    bloc.stream.listen((state) {
      if (state is GetListFoodLoadingState) {
        showViewLoading(context);
      } else if (state is GetListFoodSuccessState) {
        hideViewLoading(context);
      } else if (state is GetListFoodErrorState) {
        hideViewLoading(context);
        showOKAlertDialog('Error', state.error!, context);
      }
    });
    initVariable(context);
    getNewData(bloc);

    return SafeArea(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SearchUI.routeName);
                      },
                      child: Container(
                        color: Colors.white,
                        child: IgnorePointer(
                          child: CupertinoSearchTextField(
                            focusNode: focusSearch,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: IconBtnWithCounter(
                      svgSrc: "assets/icons/Cart Icon.svg",
                      numOfitem: 4,
                      press: () {},
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                child: BlocBuilder(
                  bloc: bloc,
                  builder: (context, HomeState state) {
                    if (state is GetListFoodSuccessState) {
                      updateData(state.listFood);
                    }

                    return Scrollbar(
                      isAlwaysShown: false,
                      controller: scrollController,
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: listFood.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            print(index);
                          },
                          child: Column(
                            children: [
                              Container(
                                height: getProportionateScreenWidth(115),
                                margin: EdgeInsets.only(
                                    left: 20, top: 12, right: 20, bottom: 12),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(115),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        color: Colors.black12,
                                      ),
                                      child: listFood[index].images!.length > 0
                                          ? Image.network(
                                              '${listFood[index].images![0].imageUrl}',
                                              fit: BoxFit.fitWidth)
                                          : null,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              '${listFood[index].foodName}',
                                              style: titleStyle,
                                              maxLines: 2,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, top: 6),
                                              child: Text(
                                                '${listFood[index].description}',
                                                maxLines: 3,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height:
                                                getProportionateScreenWidth(20),
                                            margin: EdgeInsets.only(left: 20),
                                            child: Text(
                                              '${listFood[index].price}',
                                              style: titleStyle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                color: Colors.black26,
                                width: double.infinity,
                                height: 0.5,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
