import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_new_template_widget.dart' show CreateNewTemplateWidget;
import 'package:flutter/material.dart';

class CreateNewTemplateModel extends FlutterFlowModel<CreateNewTemplateWidget> {
  ///  Local state fields for this page.

  dynamic rectSelection;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TemplateName widget.
  FocusNode? templateNameFocusNode;
  TextEditingController? templateNameController;
  String? Function(BuildContext, String?)? templateNameControllerValidator;
  // State field(s) for TemplateType widget.
  String? templateTypeValue;
  FormFieldController<String>? templateTypeValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    templateNameFocusNode?.dispose();
    templateNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
