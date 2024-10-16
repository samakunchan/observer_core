import 'package:dio/dio.dart' hide Headers;
import 'package:observer_core/constantes.dart';
import 'package:retrofit/retrofit.dart';

part 'server_nestjs_service.g.dart';

/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>''<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'articles/all'<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'projects/all'<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'environments/all'<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'organisations/all'<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'legals/all'<span style="color: #FFC66D">)</span></p>
/// <p><span style="color: #FFC66D">@GET</span><span style="color: #FFC66D">(</span>'documents/all'<span style="color: #FFC66D">)</span></p>
@RestApi(baseUrl: MainProject.apiUrl)
abstract class ServerNestjsService {
  factory ServerNestjsService(Dio dio, {String baseUrl}) = _ServerNestjsService;

  @GET('')
  Future<HttpResponse<dynamic>> getHome();

  // /// Sert à récupérer les tokens de connexion depuis l'API. Pas Keycloak. Keycloak s'arrête à la transmission du [code].
  // /// - Avec le [code] et la [redirect_uri] on fait la 1ère connexion.
  // /// - Avec le [refresh_token] on régénère l'access token.
  // @POST('/ authentication/credentials')
  // Future<HttpResponse<dynamic>> upsertWithCodeOrRefreshToken({
  //   @Header('Authorization') required String authorization,
  //   @Header('Content-Type') required String contentType,
  //   @Body() required String body,
  // });

  @GET('environments/all')
  Future<HttpResponse<dynamic>> getEnvironments({
    @Header('Authorization') required String authorization,
  });

  @GET('environments/search')
  Future<HttpResponse<dynamic>> searchEnvironments({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Query('input') String input = '',
  });

  @GET('environments/search/strict')
  Future<HttpResponse<dynamic>> searchStrictEnvironments({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Query('input') String input = '',
  });

  @POST('environments')
  Future<HttpResponse<dynamic>> upsertEnvironment({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('environments')
  Future<HttpResponse<dynamic>> deleteEnvironment({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @GET('categories/all')
  Future<HttpResponse<dynamic>> getCategories({
    @Header('Authorization') required String authorization,
  });

  @GET('categories/search')
  Future<HttpResponse<dynamic>> searchCategories({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Query('input') String input = '',
  });

  @GET('categories/search/strict')
  Future<HttpResponse<dynamic>> searchStrictCategories({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Query('input') String input = '',
  });

  @POST('categories')
  Future<HttpResponse<dynamic>> upsertCategory({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('categories')
  Future<HttpResponse<dynamic>> deleteCategory({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @GET('articles/all')
  Future<HttpResponse<dynamic>> getArticles({
    @Header('Authorization') required String authorization,
  });

  @GET('projects/all')
  Future<HttpResponse<dynamic>> getProjects({
    @Header('Authorization') required String authorization,
  });

  @POST('projects')
  Future<HttpResponse<dynamic>> upsertProject({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('projects/{id}')
  Future<HttpResponse<dynamic>> deleteProject({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Path('id') required String id,
  });

  @GET('organisations/all')
  Future<HttpResponse<dynamic>> getOrganisation({
    @Header('Authorization') required String authorization,
  });

  @GET('legals/all')
  Future<HttpResponse<dynamic>> getLegals({
    @Header('Authorization') required String authorization,
  });

  @GET('documents/all')
  Future<HttpResponse<dynamic>> getDocuments({
    @Header('Authorization') required String authorization,
  });

  @GET('documents/all/{folder}')
  Future<HttpResponse<dynamic>> getDocumentsFilteredBy({
    @Header('Authorization') required String authorization,
    @Path('folder') required String folder,
  });

  @POST('documents')
  Future<HttpResponse<dynamic>> upsertOneDocument({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @POST('documents/upload')
  Future<HttpResponse<dynamic>> uploadOneDocument({
    @Header('Authorization') required String authorization,
    @Body() required FormData formData,
  });

  @POST('documents/multi-upload')
  Future<HttpResponse<dynamic>> uploadMultipleDocuments({
    @Header('Authorization') required String authorization,
    @Body() required FormData formData,
  });

  @DELETE('documents/{id}')
  Future<HttpResponse<dynamic>> deleteOneDocument({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Path('id') required String id,
  });

  @DELETE('documents/multiple-files')
  Future<HttpResponse<dynamic>> deleteMultipleDocuments({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @GET('proposed-services/all')
  Future<HttpResponse<dynamic>> getProposedServices({
    @Header('Authorization') required String authorization,
  });

  @POST('proposed-services')
  Future<HttpResponse<dynamic>> upsertOneService({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('proposed-services/{id}')
  Future<HttpResponse<dynamic>> deleteOneService({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Path('id') required String id,
  });

  @GET('skills/all')
  Future<HttpResponse<dynamic>> getSkills({
    @Header('Authorization') required String authorization,
  });

  @POST('skills')
  Future<HttpResponse<dynamic>> upsertOneSkill({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('skills/{id}')
  Future<HttpResponse<dynamic>> deleteOneSkill({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Path('id') required String id,
  });

  @GET('reasons/all')
  Future<HttpResponse<dynamic>> getReasons({
    @Header('Authorization') required String authorization,
  });

  @POST('reasons')
  Future<HttpResponse<dynamic>> upsertOneReason({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });

  @DELETE('reasons/{id}')
  Future<HttpResponse<dynamic>> deleteOneReason({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Path('id') required String id,
  });

  @GET('abouts/all')
  Future<HttpResponse<dynamic>> getDatasAboutMe({
    @Header('Authorization') required String authorization,
  });

  @POST('abouts')
  Future<HttpResponse<dynamic>> upsertAbouts({
    @Header('Authorization') required String authorization,
    @Header('Content-Type') required String contentType,
    @Body() required String body,
  });
}
