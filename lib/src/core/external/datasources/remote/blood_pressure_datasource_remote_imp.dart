import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../dto/blood_pressure_dto.dart';
import '../contracts/i_blood_pressure_datasource.dart';
import '../../../domain/entities/blood_pressuse_entity.dart';

class BloodPressureDatasourceRemoteImp implements IBloodPressureDatasource {

  http.Client client = http.Client();
  final String urlAPI = "ea76-102-214-36-175.ngrok-free.app";

  @override
  Future<BloodPressureEntity> createMeasurement(BloodPressureEntity bloodPressureEntity) async {
    try {
      final response = await http.post(
        Uri.parse("https://$urlAPI/pulse-check"), 
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "unit": bloodPressureEntity.unity,
          "measurement_value": bloodPressureEntity.measurementValue,
          "measurement_date": bloodPressureEntity.measurementDate,
          "measurement_time": bloodPressureEntity.measurementTime,
          "measurement_description_date": bloodPressureEntity.measurementDescriptionDate,
          "user_id": bloodPressureEntity.userId
        })
      );
      log("ID: ${bloodPressureEntity.userId}");
      dynamic jsonParse = jsonDecode(response.body);
      BloodPressureEntity data = BloodPressureDTO.fromJson(jsonParse);
      return data;
    } catch (e) {
      client.close();
      throw Exception("Erro ao criar medição");
    }
  }

  @override
  Future<Either<Exception, bool>> deleteMeasurement(String pk) async {
    try {
      await http.delete(
        Uri.parse("https://$urlAPI/pulse-check"), 
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          "id": pk,
        })
      );
      return const Right(true);
    } catch (e) {
      client.close();
      throw Exception("Erro ao criar medição");
    }
  }

  @override
  Future<List<BloodPressureEntity>> getAllMeasurements() async {
    try {
      final response = await http.get(Uri.http(urlAPI, "/pulse-check")); 
      List<dynamic> jsonParse = jsonDecode(response.body);
      List<BloodPressureEntity> data = jsonParse.map((e) => BloodPressureDTO.fromJson(e)).toList();
      return data;
    } catch (e) {
      client.close();
      throw Exception("Erro ao buscar medições");
    }
  }
  
  @override
  Future<int> getTotalBPM(String userId) async {
    try {
      final response = await http.get(Uri.http(urlAPI, "/pulse-check/$userId"));   
      return int.parse(response.body);    
    } catch (e) {
      client.close();
      throw Exception("Erro ao buscar total de medições");
    }
  }
  
  @override
  Future<int> getCountMeasurement(String userId) async {
    try {
      final response = await http.get(Uri.http(urlAPI, "/pulse-check/count-measurement/$userId"));
      return int.parse(response.body);         
    } catch (e) {
      client.close();
      throw Exception("Erro ao buscar contas de medições");
    }
  }

}