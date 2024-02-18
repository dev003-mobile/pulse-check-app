import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../dto/blood_pressure_dto.dart';
import '../contracts/i_blood_pressure_datasource.dart';
import '../../../domain/entities/blood_pressuse_entity.dart';

class BloodPressureDatasourceRemoteImp implements IBloodPressureDatasource {

  http.Client client = http.Client();
  final String urlAPI = "7f2d-102-214-36-175.ngrok-free.app";

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
          "user_id": bloodPressureEntity.userId
        })
      );
      dynamic jsonParse = jsonDecode(response.body);
      log("DATA: $jsonParse");
      BloodPressureEntity data = BloodPressureDTO.fromJson(jsonParse);
      return data;
    } catch (e) {
      client.close();
      throw Exception("Erro ao criar medição");
    }
  }

  @override
  Future<Either<Exception, bool>> deleteMeasurement(String pk) async {
    // TODO: implement deleteMeasurement
    throw UnimplementedError();
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

}