class ZCL_ZBMIT_GT_RECEIVE_D_DPC_EXT definition
  public
  inheriting from ZCL_ZBMIT_GT_RECEIVE_D_DPC
  create public .

public section.

  methods CUSTOME_CREATE_DEEP_ENTITY
    importing
      value(IV_ENTITY_NAME) type STRING optional
      value(IV_ENTITY_SET_NAME) type STRING optional
      value(IV_SOURCE_NAME) type STRING optional
      value(IT_KEY_TAB) type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      value(IT_NAVIGATION_PATH) type /IWBEP/T_MGW_NAVIGATION_PATH optional
      value(IO_EXPAND) type ref to /IWBEP/IF_MGW_ODATA_EXPAND optional
      value(IO_TECH_REQUEST_CONTEXT) type ref to /IWBEP/IF_MGW_REQ_ENTITY_C optional
      value(IO_DATA_PROVIDER) type ref to /IWBEP/IF_MGW_ENTRY_PROVIDER optional
    exporting
      value(ER_DEEP_ENTITY) type ZCL_ZBMIT_GT_RECEIVE_D_MPC_EXT=>TS_DEEP_ENTITY .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
protected section.

  methods CERTIFICATEINFOR_CREATE_ENTITY
    redefinition .
  methods CERTIFICATEMAINS_CREATE_ENTITY
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZBMIT_GT_RECEIVE_D_DPC_EXT IMPLEMENTATION.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

    DATA:
      custome_create_deep_entity TYPE zcl_zbmit_gt_receive_d_mpc_ext=>ts_deep_entity,
      custome_deep_entity_logs   TYPE zcl_zbmit_gt_receive_d_mpc_ext=>ts_deep_entity_logs,
      lt_data_cert               TYPE TABLE OF zbmit_tb_cert_in,
      lw_data_cert               TYPE zbmit_tb_cert_in,
      lt_data_logs               TYPE TABLE OF zbmit_tb_logs,
      lt_data_logs_aux           TYPE TABLE OF zbmit_tb_logs,
      lw_data_logs               TYPE zbmit_tb_logs.

    IF iv_entity_name = 'CertificateMain'.
      CALL METHOD me->custome_create_deep_entity
        EXPORTING
          iv_entity_name          = iv_entity_name
          iv_entity_set_name      = iv_entity_set_name
          iv_source_name          = iv_source_name
          it_key_tab              = it_key_tab
          it_navigation_path      = it_navigation_path
          io_expand               = io_expand
          io_tech_request_context = io_tech_request_context
          io_data_provider        = io_data_provider
        IMPORTING
          er_deep_entity          = custome_create_deep_entity.

      LOOP AT custome_create_deep_entity-certificateinformationset INTO DATA(lw_deep_entity).
        REPLACE ALL OCCURRENCES OF '-' IN lw_deep_entity-expdate WITH ''.
        REPLACE ALL OCCURRENCES OF '-' IN lw_deep_entity-datenow WITH ''.
        MOVE-CORRESPONDING lw_deep_entity TO lw_data_cert.

        APPEND lw_data_cert TO lt_data_cert.

        DELETE FROM zbmit_tb_cert_in
        WHERE certname = lw_data_cert-certname
        AND expdate = lw_data_cert-expdate.
        COMMIT WORK.

        CLEAR: lw_data_cert.

      ENDLOOP.

      IF lt_data_cert IS NOT INITIAL.

        CALL FUNCTION 'ENQUE_SLEEP'
          EXPORTING
            seconds        = 1
          EXCEPTIONS
            system_failure = 1                " System error in lock operation
            OTHERS         = 2.


        MODIFY zbmit_tb_cert_in FROM TABLE lt_data_cert.
        COMMIT WORK.
      ENDIF.

      copy_data_to_ref( EXPORTING is_data = custome_create_deep_entity CHANGING cr_data = er_deep_entity ).

    ELSEIF iv_entity_name = 'Log'.

      io_data_provider->read_entry_data( IMPORTING es_data = custome_deep_entity_logs ).

      SORT custome_deep_entity_logs-logsset BY messageguid.

      LOOP AT custome_deep_entity_logs-logsset INTO DATA(lw_entity_logs).
        REPLACE ALL OCCURRENCES OF '-' IN lw_entity_logs-logstart WITH ''.
        REPLACE ALL OCCURRENCES OF '-' IN lw_entity_logs-logend   WITH ''.

        MOVE-CORRESPONDING lw_entity_logs TO lw_data_logs.
        MOVE-CORRESPONDING lw_entity_logs-integrationartifact TO lw_data_logs.
        APPEND lw_data_logs TO lt_data_logs.

        CLEAR: lw_data_logs.

      ENDLOOP.

      SORT lt_data_logs BY messageguid.
      lt_data_logs_aux = lt_data_logs.
      DELETE ADJACENT DUPLICATES FROM lt_data_logs_aux COMPARING messageguid.

      MODIFY zbmit_tb_logs FROM TABLE lt_data_logs.
      COMMIT WORK.

      copy_data_to_ref( EXPORTING is_data = custome_deep_entity_logs CHANGING cr_data = er_deep_entity ).


    ENDIF.



  ENDMETHOD.


  METHOD certificateinfor_create_entity.

    DATA: ls_entity TYPE zcl_zbmit_gt_receive_d_mpc=>ts_certificateinformation.

    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = ls_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception. " mgw technical exception

    ENDTRY.
  ENDMETHOD.


  METHOD certificatemains_create_entity.

    DATA: ls_entity TYPE zcl_zbmit_gt_receive_d_mpc=>ts_certificatemain.

    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = ls_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception. " mgw technical exception

    ENDTRY.

  ENDMETHOD.


  METHOD custome_create_deep_entity.

    DATA: lr_deep_entity TYPE  zcl_zbmit_gt_receive_d_mpc_ext=>ts_deep_entity.

    io_data_provider->read_entry_data( IMPORTING es_data = lr_deep_entity ).

    er_deep_entity = lr_deep_entity.
  ENDMETHOD.
ENDCLASS.
