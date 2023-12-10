import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_post_widget.dart' show AddPostWidget;
import 'package:flutter/material.dart';

class AddPostModel extends FlutterFlowModel<AddPostWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for studentName widget.
  FocusNode? studentNameFocusNode;
  TextEditingController? studentNameController;
  String? Function(BuildContext, String?)? studentNameControllerValidator;
  // State field(s) for LicenseClass widget.
  String? licenseClassValue;
  FormFieldController<String>? licenseClassValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PostOutlinesRecord? outlineId;
  // Stores action output result for [Backend Call - API (compose_image_api_compose_image__post)] action in Button widget.
  ApiCallResponse? apiResultpay;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    studentNameFocusNode?.dispose();
    studentNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
