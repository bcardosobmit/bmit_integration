@AbapCatalog.sqlViewName: 'ZVCERTIN0003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Certificate information - 0003'

@OData.publish: true

define view ZI_BMIT_TB_CERT_IN_0003
  as select from ZI_BMIT_TB_CERT_IN_0002
{
  key Certname,
  key Expdate,
      Status,
      Owner,
      Enddays,
      Datenow
      //StatusCert
}
