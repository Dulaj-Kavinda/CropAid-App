import 'package:cropaid_app/controllers/report_incident_controller.dart';
import 'package:get/get.dart';

class ReportIncidentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ReportIncidentController>(ReportIncidentController(),
        permanent: true);
  }
}
