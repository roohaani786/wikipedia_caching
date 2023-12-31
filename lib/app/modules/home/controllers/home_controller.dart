import 'package:flutter/cupertino.dart';
import 'package:freo_task/app/api/wikipedia_api.dart';
import 'package:freo_task/app/data/api_response.dart';
import 'package:freo_task/app/data/model/wiki_page_click_model.dart';
import 'package:get/get.dart';

import '../../../data/model/wiki_search_result_model.dart';

class HomeController extends GetxController {

  final WikiRepository wikiRepository = WikiRepository();
  final String query = "";
  final TextEditingController queryController = TextEditingController();
  WikiSearchResultModel? wikiSearchResult;
  WikiPageClickModel? wikiPageClickResult;
  bool isLoading = false;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getWikiSearchResults(String query) async {
    isLoading = true;
    update();
    print("Got query $query");
    ApiResponse apiResponse  = await wikiRepository.getWikiSearchResults(query: query);

    wikiSearchResult = apiResponse.responseData;
    print(wikiSearchResult?.query?.pages?[0].title??"");
    isLoading = false;
    update();
  }



}
