import 'dart:convert';

import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../models/casting.dart';
import '../models/article.dart';

mixin ConnectedModel on Model {
  List<Casting> _castings = [];
  List<Article> _articles = [];
  String _selCastingId;
  String _selArticleId;
  bool _isLoading = false;
}

mixin CastingsModel on ConnectedModel {
  List<Casting> get allCastings {
    return List.from(_castings);
  }

  List<Casting> get displayedCastings {
    return List.from(_castings);
  }

  int get selectedCastingIndex {
    return _castings.indexWhere((Casting casting) {
      return casting.id == _selCastingId;
    });
  }

  String get selectedCastingId {
    return _selCastingId;
  }

  Casting get selectedCasting {
    if (selectedCastingId == null) {
      return null;
    }
    return _castings.firstWhere((Casting casting) {
      return casting.id == _selCastingId;
    });
  }

  String convertDate(String date) {
    if (date == null) {
      return null;
    }
    
    return date.split('-').reversed.join('-');
  }

  Future<Null> fetchCastings() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://megacastingapi.azurewebsites.net/castings')
        .then<Null>((http.Response response) {
      final List<Casting> fetchedCastingList = [];
      final List<dynamic> castingListData = json.decode(response.body);

      print(response.body);
      if (castingListData == null) {
        _isLoading = false;
        print('blop0');
        notifyListeners();
        return;
      }

      castingListData.forEach((dynamic castingData) {
        final Casting casting = Casting(
          id: castingData['_id'],
          title: castingData['title'],
          description: castingData['description'],
          datePublication: convertDate(castingData['datePublication']),
          job: castingData['job'],
          contact: castingData['contact']
        );
        fetchedCastingList.add(casting);
      });

      _castings = fetchedCastingList;
      print(_castings);
      _isLoading = false;
      notifyListeners();
      _selCastingId = null;
    }).catchError((error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  void selectCasting(String castingId) {
    _selCastingId = castingId;
    notifyListeners();
  }
}

mixin ArticlesModel on ConnectedModel {
  List<Article> get allArticles {
    return List.from(_articles);
  }

  List<Article> get displayedArticles {
    return List.from(_articles);
  }

  int get selectedArticleIndex {
    return _articles.indexWhere((Article article) {
      return article.id == _selArticleId;
    });
  }

  String get selectedArticleId {
    return _selArticleId;
  }

  Article get selectedArticle {
    if (selectedArticleId == null) {
      return null;
    }
    return _articles.firstWhere((Article article) {
      return article.id == _selArticleId;
    });
  }

  Future<Null> fetchArticles() {
    _isLoading = true;
    notifyListeners();
    return http
        .get('https://megacastingapi.azurewebsites.net/articles')
        .then<Null>((http.Response response) {
      final List<Article> fetchedArticleList = [];
      final List<dynamic> articleListData = json.decode(response.body);

      print(response.body);
      if (articleListData == null) {
        _isLoading = false;
        print('blop0');
        notifyListeners();
        return;
      }

      articleListData.forEach((dynamic articleData) {
        final Article article = Article(
          id: articleData['_id'],
          title: articleData['title'],
          content: articleData['content']
          
        );
        fetchedArticleList.add(article);
      });

      _articles = fetchedArticleList;
      print(_articles);
      _isLoading = false;
      notifyListeners();
      _selCastingId = null;
    }).catchError((error) {
      print(error);
      _isLoading = false;
      notifyListeners();
      return;
    });
  }

  void selectArticle(String articleId) {
    _selArticleId = articleId;
    notifyListeners();
  }
}

mixin UtilityModel on ConnectedModel {
  bool get isLoading {
    return _isLoading;
  }
}
