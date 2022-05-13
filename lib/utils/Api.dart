import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final http.Client client;

  Api({required this.client});

  Future<String> getApiResponse() async {
    try {

      final response = await client.get(
        Uri.parse('https://run.mocky.io/v3/ef6e8fd7-5373-41db-ac89-0f753f95e2f4'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final problems = jsonData['problems'] as List;

        final  jsonProblems = jsonEncode(problems);
        final  jsonProblemSubString = jsonProblems.substring( 1, jsonProblems.length - 1 );
        final jsonProblemMain = json.decode(jsonProblemSubString);
        final diabetes = jsonProblemMain['Diabetes'] ;

        final  jsonDiabetes = jsonEncode(diabetes);
        final  jsonDiabetesSubString = jsonDiabetes.substring( 1, jsonDiabetes.length - 1 );
        final jsonDiabetesMain = json.decode(jsonDiabetesSubString);
        final medications = jsonDiabetesMain['medications'] ;

        final  jsonMedicationsClasses = jsonEncode(medications);
        final  jsonMedicationsClassesSubString = jsonMedicationsClasses.substring( 1, jsonMedicationsClasses.length - 1 );
        final jsonmedicationsClassesMain = json.decode(jsonMedicationsClassesSubString);
        final medicationsClasses = jsonmedicationsClassesMain['medicationsClasses'] ;

        final  jsonclassName = jsonEncode(medicationsClasses);
        final  jsonclassNameSubString = jsonclassName.substring( 1, jsonclassName.length - 1 );
        final jsonclassNameMain = json.decode(jsonclassNameSubString);
        final className = jsonclassNameMain['className'] ;

        final  jsonassociatedDrug = jsonEncode(className);
        final  jsonassociatedDrugString = jsonassociatedDrug.substring( 1, jsonassociatedDrug.length - 1 );
        final jsonassociatedDrugMain = json.decode(jsonassociatedDrugString);
        final associatedDrug = jsonassociatedDrugMain['associatedDrug'] ;
        print("======associatedDrug"+ associatedDrug.toString());

        final  jsonassociatedDrug1 = jsonEncode(associatedDrug);

        final jsonDatasa = json.decode(response.body);
        print("======associatedDrug"+ jsonassociatedDrug1.toString());
        return '${jsonassociatedDrug1}';
      } else {
        return 'Something went wrong';
      }
    } catch (error) {
      return 'An error occured';
    }
  }


}