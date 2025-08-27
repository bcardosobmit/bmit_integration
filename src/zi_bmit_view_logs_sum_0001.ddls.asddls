@AbapCatalog.sqlViewName: 'ZVSLOGS0001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Sum Values For Logs'
define view ZI_BMIT_VIEW_LOGS_SUM_0001
  as select from ZI_BMIT_VIEW_LOGS_0001
{
  key Messageguid,
      Logstart,
      //count( distinct Status) as SomaStatus,
      
      Logend
}
group by
  Messageguid,
  Logstart,
  Logend
