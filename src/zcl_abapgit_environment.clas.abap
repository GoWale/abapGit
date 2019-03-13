CLASS zcl_abapgit_environment DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS is_cloud
      RETURNING
        VALUE(rv_cloud) TYPE abap_bool .
  PROTECTED SECTION.

    CLASS-DATA mv_cloud TYPE abap_bool VALUE abap_undefined ##NO_TEXT.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_ABAPGIT_ENVIRONMENT IMPLEMENTATION.


  METHOD is_cloud.

    IF mv_cloud = abap_undefined.
      TRY.
          CALL METHOD ('CL_COS_UTILITIES')=>('IS_SAP_CLOUD_PLATFORM')
            RECEIVING
              rv_is_sap_cloud_platform = mv_cloud.
        CATCH cx_sy_dyn_call_illegal_method.
          mv_cloud = abap_false.
      ENDTRY.
    ENDIF.

    rv_cloud = mv_cloud.

  ENDMETHOD.
ENDCLASS.
