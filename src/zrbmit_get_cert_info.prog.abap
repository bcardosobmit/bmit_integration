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

REPORT zrbmit_get_cert_info.

INCLUDE zibmit_get_cert_info_top.

INCLUDE zibmit_get_cert_info_frm.

INCLUDE zibmit_get_cert_info_cla.

INITIALIZATION.
  titulo1 = 'Certificate Information'.

START-OF-SELECTION.

  PERFORM f_start_process.
