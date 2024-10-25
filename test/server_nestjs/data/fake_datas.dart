import 'package:observer_core/features/features_export.dart';

final List<Map<String, dynamic>> fakeDatasProjects = List<Map<String, dynamic>>.of([
  <String, dynamic>{
    'id': 7,
    'title': 'Mon site non web',
    'slug': 'mon-site-non-web',
    'shortDescription': 'Refonte de site web',
    'fullDescription': 'Refonte de site web qui était à l‘origine sous Symfony et refais en Angular',
    'client': 'Samakunchan Technology',
    'dateDebutProjet': '2023-01-01T00:00:00.000Z',
    'category': 87,
    'company': {'siren': 842127201},
    'dateFinProjet': '2024-08-16T08:44:21.455Z',
    'isPublicationActive': false,
    'createdAt': '2024-08-16T08:44:21.455Z',
    'updatedAt': '2024-08-16T08:44:21.455Z',
    'deletedAt': null,
  },
]);

final Map<String, dynamic> error400 = <String, dynamic>{
  'statusCode': 400,
  'errorName': 'BadRequestException',
  'description': {
    'statusCode': 400,
    'message': 'BadRequest',
  },
  'path': '/custom-endpoint',
  'date': '2024-10-24T08:24:24.198Z',
};

final Map<String, dynamic> error401 = <String, dynamic>{
  'statusCode': 401,
  'errorName': 'UnauthorizedException',
  'description': {
    'statusCode': 401,
    'message': 'Unauthorized',
  },
  'path': '/custom-endpoint',
  'date': '2024-10-24T08:24:24.198Z',
};

final Map<String, dynamic> error403 = <String, dynamic>{
  'statusCode': 403,
  'errorName': 'ForbiddenException',
  'description': {
    'statusCode': 403,
    'message': 'Forbidden',
  },
  'path': '/custom-endpoint',
  'date': '2024-10-24T08:24:24.198Z',
};

final Map<String, dynamic> error404 = <String, dynamic>{
  'statusCode': 404,
  'errorName': 'NotFoundException',
  'description': {
    'statusCode': 404,
    'message': 'NotFound',
  },
  'path': '/custom-endpoint',
  'date': '2024-10-24T08:24:24.198Z',
};

const String error503Message = 'Connection refused';

final Map<String, dynamic> fakeDeleteResponse = <String, dynamic>{
  'message': 'Ok',
};

const AuthTokenModel fakeAuthToken = AuthTokenModel(
  accessToken: 'accessToken',
  expiresIn: 0,
  refreshToken: 'refreshToken',
  tokenType: 'tokenType',
  idToken: 'idToken',
  notBeforePolicy: 0,
  sessionState: 'sessionState',
  scope: 'scope',
);
