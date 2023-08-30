import '../../misc/util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class SearchKitsuCall {
  static Future<ApiCallResponse> call({
    String? filter = 'naruto',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'searchKitsu',
      apiUrl: 'https://kitsu.io/api/edge/manga',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'filter[text]': filter,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mangas(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetMangaCall {
  static Future<ApiCallResponse> call({
    String? mangaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getManga',
      apiUrl: 'https://kitsu.io/api/edge/manga/${mangaId}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetMangaGenresCall {
  static Future<ApiCallResponse> call({
    String? mangaId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMangaGenres',
      apiUrl: 'https://kitsu.io/api/edge/manga/${mangaId}/genres',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic names(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attributes.name''',
        true,
      );
}

class GetMangaChaptersCall {
  static Future<ApiCallResponse> call({
    int? mangaId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMangaChapters',
      apiUrl: 'https://kitsu.io/api/edge/manga/${mangaId}/chapters',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic count(dynamic response) => getJsonField(
        response,
        r'''$.meta.count''',
      );

  static dynamic chapters(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attributes.number''',
        true,
      );

  static dynamic volumes(dynamic response) => getJsonField(
        response,
        r'''$.data[:].attributes.volumeNumber''',
        true,
      );
}

class GetPopularMangasCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getPopularMangas',
      apiUrl: 'https://kitsu.io/api/edge/manga?sort=popularityRank&limit=15',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mangas(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetTrendingMangaCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getTrendingManga',
      apiUrl: 'https://kitsu.io/api/edge/trending/manga',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic mangas(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class GetMangaFromChapterCall {
  static Future<ApiCallResponse> call({
    String? chapterId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getMangaFromChapter',
      apiUrl: 'https://kitsu.io/api/edge/chapters/${chapterId}/manga',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic manga(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}
