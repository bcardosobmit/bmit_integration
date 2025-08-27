CLASS zcl_zbmit_gt_receive_d_mpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zbmit_gt_receive_d_mpc
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES:
      BEGIN OF ts_deep_entity,
        idrequisicao              TYPE char10,
        certificateinformationset TYPE STANDARD TABLE OF ts_certificateinformation WITH DEFAULT KEY,
      END OF ts_deep_entity ,

      BEGIN OF ts_deep_entity_logs,
        idrequisicao TYPE char10,
        logsset      TYPE STANDARD TABLE OF ts_logs WITH DEFAULT KEY,
      END OF ts_deep_entity_logs .

    METHODS custome_create_deep_entity
      IMPORTING
        VALUE(iv_entity_name)          TYPE string OPTIONAL
        VALUE(iv_entity_set_name)      TYPE string OPTIONAL
        VALUE(iv_source_name)          TYPE string OPTIONAL
        VALUE(it_key_tab)              TYPE /iwbep/t_mgw_name_value_pair OPTIONAL
        VALUE(it_navigation_path)      TYPE /iwbep/t_mgw_navigation_path OPTIONAL
        VALUE(io_expand)               TYPE REF TO /iwbep/if_mgw_odata_expand OPTIONAL
        VALUE(io_tech_request_context) TYPE REF TO /iwbep/if_mgw_req_entity_c OPTIONAL
        VALUE(io_data_provider)        TYPE REF TO /iwbep/if_mgw_entry_provider OPTIONAL
      EXPORTING
        VALUE(er_deep_entity)          TYPE zcl_zbmit_gt_receive_d_mpc_ext=>ts_deep_entity .

    METHODS define
        REDEFINITION .
  PROTECTED SECTION.
private section.
ENDCLASS.



CLASS ZCL_ZBMIT_GT_RECEIVE_D_MPC_EXT IMPLEMENTATION.


METHOD custome_create_deep_entity.


  DATA: lr_deep_entity TYPE  zcl_zbmit_gt_receive_d_mpc_ext=>ts_deep_entity.
*        lt_itemo       TYPE zcl_zproj_gr_multideep_mpc=>tt_itemo,
*        lt_itemt       TYPE zcl_zproj_gr_multideep_mpc=>tt_itemt,
*        ls_itemo       TYPE zcl_zproj_gr_multideep_mpc=>ts_itemo,
*        ls_itemt       TYPE zcl_zproj_gr_multideep_mpc=>ts_itemt.

*  DATA : ls_general_data TYPE zstr1_header,
*         lt_itemo_data   TYPE STANDARD TABLE OF zstr1_itemo,
*         ls_itemo_data   TYPE  zstr1_itemo,
*         lt_itemt_data   TYPE STANDARD TABLE OF zstr1_itemt,
*         ls_itemt_data   TYPE  zstr1_itemt.

*  FIELD-SYMBOLS: <ls_itemo> TYPE zcl_zproj_gr_multideep_mpc=>ts_itemo,
*                 <ls_itemt> TYPE zcl_zproj_gr_multideep_mpc=>ts_itemt.

*  Transform data into the internal structure

  io_data_provider->read_entry_data( IMPORTING es_data = lr_deep_entity ).




ENDMETHOD.


  METHOD define.
    super->define( ).
    DATA:
      lo_annotation   TYPE REF TO /iwbep/if_mgw_odata_annotation,
      lo_entity_type  TYPE REF TO /iwbep/if_mgw_odata_entity_typ,
      lo_complex_type TYPE REF TO /iwbep/if_mgw_odata_cmplx_type,
      lo_property     TYPE REF TO /iwbep/if_mgw_odata_property,
      lo_entity_set   TYPE REF TO /iwbep/if_mgw_odata_entity_set.

    lo_entity_type = model->get_entity_type( iv_entity_name = 'CertificateMain'  ).

    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZBMIT_GT_RECEIVE_D_MPC_EXT=>TS_DEEP_ENTITY' ).

  ENDMETHOD.
ENDCLASS.
