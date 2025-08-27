@AbapCatalog.sqlViewName: 'ZVCERTIN0002'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Certificate information - 0002'
define view ZI_BMIT_TB_CERT_IN_0002
  as select from ZI_BMIT_TB_CERT_IN_0001
{
  key Certname,
  key Expdate,
      Status,
      Owner,
      Enddays,
      Datenow,
      case
        when Enddays < 0
            then '@0A@'
        when Enddays <= 20
            then '@09@'
        else '@08@' end as StatusCert
}
