@AbapCatalog.sqlViewName: 'ZVCERTIN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Certificate information'
define view ZI_BMIT_TB_CERT_IN_0001
  as select from zbmit_tb_cert_in
{
  key certname                                               as Certname,
  key expdate                                                as Expdate,
      status                                                 as Status,
      owner                                                  as Owner,
      cast( cast( enddays as abap.numc( 8 ) ) as abap.int8 ) as Enddays,
      enddays                                                as EnddaysString,
      datenow                                                as Datenow
}
