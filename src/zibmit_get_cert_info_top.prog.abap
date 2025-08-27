*&---------------------------------------------------------------------*
*& Include          ZIBMIT_GET_CERT_INFO_TOP
*&---------------------------------------------------------------------*

DATA: lt_info_certificate TYPE zi_bmit_tb_cert_in_0002.

SELECTION-SCREEN: FUNCTION KEY 1.
SELECTION-SCREEN BEGIN OF BLOCK t1
  WITH FRAME TITLE titulo1.
  SELECT-OPTIONS: s_exdate FOR lt_info_certificate-expdate,
                  s_cernm FOR  lt_info_certificate-certname.
  SELECTION-SCREEN SKIP 2.

SELECTION-SCREEN END OF BLOCK t1.

CLASS lcl_screen_handler DEFINITION.

  PUBLIC SECTION.

    METHODS toolbar_function_selected
      FOR EVENT function_selected OF if_salv_gui_toolbar_ida
      IMPORTING ev_fcode.


    METHODS double_click
      FOR EVENT double_click OF if_salv_gui_table_display_opt
      IMPORTING ev_field_name eo_row_data.

  PRIVATE SECTION.

ENDCLASS .

"Classe
DATA: lcl_cds_col    TYPE REF TO cl_salv_range_tab_collector,
*      lcl_cds_view   TYPE REF TO if_salv_gui_table_ida,
      lcl_alv        TYPE REF TO cl_salv_table,
      lcl_selections TYPE REF TO cl_salv_selections,
      lcl_events     TYPE REF TO cl_salv_events,
      lcl_event      TYPE REF TO lcl_screen_handler.

TRY.

    lcl_event = NEW lcl_screen_handler( ).

    DATA(lcl_cds_view) = cl_salv_gui_table_ida=>create_for_cds_view(
                            iv_cds_view_name      = 'ZI_BMIT_TB_CERT_IN_0002'
                          ).

    lcl_cds_col = NEW cl_salv_range_tab_collector( ).

  CATCH cx_salv_db_connection.
  CATCH cx_salv_db_table_not_supported.
  CATCH cx_salv_ida_contract_violation.
  CATCH cx_salv_function_not_supported.

ENDTRY.
