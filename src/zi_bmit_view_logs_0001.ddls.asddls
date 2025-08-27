@AbapCatalog.sqlViewName: 'ZVLOGS0001'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'View for log 0001'
define view ZI_BMIT_VIEW_LOGS_0001
  as select from zbmit_tb_logs
{
  key messageguid                    as Messageguid,
      logstart                       as Logstart,
      status                         as Status,
      archivinglogattachments        as Archivinglogattachments,
      customstatus                   as Customstatus,
      type                           as Type,
      packagename                    as Packagename,
      packageid                      as Packageid,
      id                             as Id,
      name                           as Name,
      origincomponentname            as Origincomponentname,
      receiver                       as Receiver,
      previouscomponentname          as Previouscomponentname,
      logend                         as Logend,
      alternateweblink               as Alternateweblink,
      loglevel                       as Loglevel,
      archivingstatus                as Archivingstatus,
      transactionid                  as Transactionid,
      sender                         as Sender,
      archivingreceiverchannelmessag as Archivingreceiverchannelmessag,
      applicationmessagetype         as Applicationmessagetype,
      applicationmessageid           as Applicationmessageid,
      localcomponentname             as Localcomponentname,
      archivingsenderchannelmessages as Archivingsenderchannelmessages,
      correlationid                  as Correlationid,
      integrationflowname            as Integrationflowname,
      archivingpersistedmessages     as Archivingpersistedmessages
}
