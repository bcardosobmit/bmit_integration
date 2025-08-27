*&---------------------------------------------------------------------*
*& Include          ZIBMIT_GET_CERT_INFO_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Form f_start_process
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_start_process.

  lcl_cds_col->add_ranges_for_name( iv_name = 'EXPDATE'  it_ranges = s_exdate[] ).
  lcl_cds_col->add_ranges_for_name( iv_name = 'CERTNAME' it_ranges = s_cernm[] ).

  lcl_cds_col->get_collected_ranges( ).
  lcl_cds_col->get_collected_ranges( IMPORTING et_named_ranges = DATA(lt_ranges) ).


  TRY.
      DATA(lcl_fields) = lcl_cds_view->field_catalog( ).
*      DATA(lcl_field)  = lcl_fields->g
      lcl_fields->set_field_header_texts(
        EXPORTING
          iv_field_name        = 'ENDDAYS'
          iv_header_text       = 'End Days'
*          iv_tooltip_text      =
*          iv_tooltip_text_long =
      ).

      lcl_fields->set_field_header_texts(
        EXPORTING
          iv_field_name        = 'STATUSCERT'
          iv_header_text       = 'Certificate Status'
*          iv_tooltip_text      =
*          iv_tooltip_text_long =
      ).


      lcl_cds_view->standard_functions( ).

      lcl_cds_view->default_layout( ).

      lcl_cds_view->set_select_options(
            EXPORTING
              it_ranges    = lt_ranges
          ).

    CATCH cx_salv_call_after_1st_display. " Method call not allowed after first display
    CATCH cx_salv_ida_associate_invalid.
    CATCH cx_salv_db_connection.
    CATCH cx_salv_ida_condition_invalid.
    CATCH cx_salv_ida_unknown_name.
  ENDTRY.

  TRY.

*      DATA(lcl_disp) = lcl_cds_view->display_options( ).
*      lcl_disp->enable_double_click( ).
*
*      SET HANDLER lcl_event->toolbar_function_selected FOR lcl_cds_view->toolbar( ).
*      SET HANDLER lcl_event->double_click FOR ALL INSTANCES.


      lcl_cds_view->selection( )->set_selection_mode(
        if_salv_gui_selection_ida=>cs_selection_mode-multi
      ).

      lcl_cds_view->fullscreen( )->display( ).

    CATCH cx_salv_ida_gui_fcode_reserved. " FunctionCode not defined
    CATCH cx_salv_ida_contract_violation.
  ENDTRY.

ENDFORM.
