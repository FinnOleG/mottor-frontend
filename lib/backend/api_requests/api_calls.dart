import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Compose Image Group Code

class ComposeImageGroup {
  static String baseUrl = 'https://pleasing-mollusk-especially.ngrok-free.app';
  static Map<String, String> headers = {};
  static ComposeImageApiComposeImagePostCall
      composeImageApiComposeImagePostCall =
      ComposeImageApiComposeImagePostCall();
}

class ComposeImageApiComposeImagePostCall {
  Future<ApiCallResponse> call({
    String? outlineId = '',
  }) async {
    final ffApiRequestBody = '''
{"outline_id": "$outlineId"}''';
    return ApiManager.instance.makeApiCall(
      callName: 'compose_image_api_compose_image__post',
      apiUrl:
          '${ComposeImageGroup.baseUrl}/api/compose-image/?outline_id=$outlineId',
      callType: ApiCallType.POST,
      headers: {
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: true,
      decodeUtf8: false,
      cache: false,
    );
  }
}

/// End Compose Image Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
