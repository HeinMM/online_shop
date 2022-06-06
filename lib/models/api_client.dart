import 'package:online_shop/models/api_respon_message.dart';
import 'package:online_shop/models/login_api_service.dart';
import 'package:online_shop/models/post_data.dart';
import 'package:online_shop/models/sale_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: "http://192.168.219.103:80/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<ApiResponMessage> login(@Body() LoginApiService staffData);

  @GET("/posts")
  Stream<List<PostData>> getAllPost(@Header('Authorization') String authApi);

  @GET("/post/{id}")
  Future<PostData> getPost(
      @Header('Authorization') String authApi,@Path() int id);

  @GET("/getRecomment")
  Stream<List<PostData>> getRecommentPostByCategory(
      @Header('Authorization') String authApi,
      @Query('category') String categoryData);

  
  @GET("/sales")
  Stream<List<SaleData>> getAllSalePost(
      @Header('Authorization') String authApi);
  
   @GET("/salesLimit")
  Stream<List<SaleData>> getLimitSalePost(
      @Header('Authorization') String authApi);
  
  @GET("/sale/{id}")
  Future<SaleData> getSalePost(
      @Header('Authorization') String authApi,@Path() int id);
}