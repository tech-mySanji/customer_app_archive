import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Cloud Function Group Code

class CloudFunctionGroup {
  static String baseUrl =
      'https://us-central1-mysanji-d2c2f.cloudfunctions.net/app';
  static Map<String, String> headers = {};
  static CheckPincodeCall checkPincodeCall = CheckPincodeCall();
  static CheckCustomerCareNumberCall checkCustomerCareNumberCall =
      CheckCustomerCareNumberCall();
}

class CheckPincodeCall {
  Future<ApiCallResponse> call({
    int? pincode,
    String? phoneNumber = '',
    String? userId = '',
    String? fullName = '',
    String? address = '',
    String? creationDate = '',
  }) async {
    final ffApiRequestBody = '''
{
  "pincode": ${pincode},
  "user_id": "${userId}",
  "full_name": "${fullName}",
  "phone_number": "${phoneNumber}",
  "address": "${address}",
  "creation_date": "${creationDate}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkPincode',
      apiUrl: '${CloudFunctionGroup.baseUrl}/checkBranchCode',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CheckCustomerCareNumberCall {
  Future<ApiCallResponse> call({
    double? pincode,
  }) async {
    final ffApiRequestBody = '''
{
  "pincode": ${pincode}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'checkCustomerCareNumber',
      apiUrl: '${CloudFunctionGroup.baseUrl}/checkCustomerCareNumber',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Cloud Function Group Code

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
