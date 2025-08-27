*-----------------------------------------------------------------------
* Empresa..: BMIT
* Programa.: ZRBMIT_GET_CERT_INFO
* Tipo.....:
* Módulo...:
* Transação:
* Descrição:
* Autor....: Bruno
* Data.....: 27/12/2023
*                           [HISTÓRICO]
* ======== ========== ========== =======================================
*   Data     Autor     Request                  Descrição
* ======== ========== ========== =======================================

REPORT zrbmit_get_logs.

INCLUDE zibmit_get_logs_top.

INCLUDE zibmit_get_logs_frm.

INCLUDE zibmit_get_logs_cla.

INITIALIZATION.
  titulo1 = 'Log information'.

START-OF-SELECTION.

  PERFORM f_start_process.
