import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'upload_prescription_widget.dart' show UploadPrescriptionWidget;
import 'package:flutter/material.dart';

class UploadPrescriptionModel
    extends FlutterFlowModel<UploadPrescriptionWidget> {
  ///  Local state fields for this component.

  List<PrescriptionStruct> prescrition = [];
  void addToPrescrition(PrescriptionStruct item) => prescrition.add(item);
  void removeFromPrescrition(PrescriptionStruct item) =>
      prescrition.remove(item);
  void removeAtIndexFromPrescrition(int index) => prescrition.removeAt(index);
  void insertAtIndexInPrescrition(int index, PrescriptionStruct item) =>
      prescrition.insert(index, item);
  void updatePrescritionAtIndex(
          int index, Function(PrescriptionStruct) updateFn) =>
      prescrition[index] = updateFn(prescrition[index]);

  ///  State fields for stateful widgets in this component.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
