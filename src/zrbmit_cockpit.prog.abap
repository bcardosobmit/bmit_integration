*-----------------------------------------------------------------------
* Empresa..: BMIT
* Programa.: ZRBMIT_COCKPIT
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
REPORT zrbmit_cockpit.

INITIALIZATION.

START-OF-SELECTION.

  CALL SCREEN '1001'.

INCLUDE zrbmit_cockpit_status_sc.
