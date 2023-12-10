import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/request_manager.dart';

import 'authenticate_widget.dart' show AuthenticateWidget;
import 'package:flutter/material.dart';

class AuthenticateModel extends FlutterFlowModel<AuthenticateWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddressInpt widget.
  FocusNode? emailAddressInptFocusNode;
  TextEditingController? emailAddressInptController;
  String? Function(BuildContext, String?)? emailAddressInptControllerValidator;
  // State field(s) for passwordInpt widget.
  FocusNode? passwordInptFocusNode;
  TextEditingController? passwordInptController;
  late bool passwordInptVisibility;
  String? Function(BuildContext, String?)? passwordInptControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for driversInstructionInpt widget.
  String? driversInstructionInptValue;
  FormFieldController<String>? driversInstructionInptValueController;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for driversInstructionName widget.
  FocusNode? driversInstructionNameFocusNode;
  TextEditingController? driversInstructionNameController;
  String? Function(BuildContext, String?)?
      driversInstructionNameControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for emailAddressCreate widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateController;
  String? Function(BuildContext, String?)?
      emailAddressCreateControllerValidator;
  String? _emailAddressCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for passwordCreate widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)? passwordCreateControllerValidator;
  String? _passwordCreateControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)? passwordConfirmControllerValidator;
  String? _passwordConfirmControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Query cache managers for this widget.

  final _drivingInstructionsManager =
      StreamRequestManager<List<DrivingInstructionsRecord>>();
  Stream<List<DrivingInstructionsRecord>> drivingInstructions({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<DrivingInstructionsRecord>> Function() requestFn,
  }) =>
      _drivingInstructionsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearDrivingInstructionsCache() => _drivingInstructionsManager.clear();
  void clearDrivingInstructionsCacheKey(String? uniqueKey) =>
      _drivingInstructionsManager.clearRequest(uniqueKey);

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    passwordInptVisibility = false;
    emailAddressCreateControllerValidator =
        _emailAddressCreateControllerValidator;
    passwordCreateVisibility = false;
    passwordCreateControllerValidator = _passwordCreateControllerValidator;
    passwordConfirmVisibility = false;
    passwordConfirmControllerValidator = _passwordConfirmControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailAddressInptFocusNode?.dispose();
    emailAddressInptController?.dispose();

    passwordInptFocusNode?.dispose();
    passwordInptController?.dispose();

    nameFocusNode?.dispose();
    nameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    driversInstructionNameFocusNode?.dispose();
    driversInstructionNameController?.dispose();

    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmController?.dispose();

    /// Dispose query cache managers for this widget.

    clearDrivingInstructionsCache();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
