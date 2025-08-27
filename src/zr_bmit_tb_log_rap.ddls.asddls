@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED ZBMIT_TB_LOG_RAP'
define root view entity ZR_BMIT_TB_LOG_RAP
  as select from zbmit_tb_log_rap
{
  key messageguid as MessageguID,
  logstart as Logstart,
  status as Status,
  archivinglogattachments as Archivinglogattachments,
  customstatus as Customstatus,
  type as Type,
  packagename as Packagename,
  packageid as PackageID,
  id as ID,
  name as Name,
  origincomponentname as Origincomponentname,
  receiver as Receiver,
  previouscomponentname as Previouscomponentname,
  logend as Logend,
  alternateweblink as Alternateweblink,
  loglevel as Loglevel,
  archivingstatus as Archivingstatus,
  transactionid as TransactionID,
  sender as Sender,
  archivingreceiverchannelmessag as Archivingreceiverchannelmessag,
  applicationmessagetype as Applicationmessagetype,
  applicationmessageid as ApplicationmessageID,
  localcomponentname as Localcomponentname,
  archivingsenderchannelmessages as Archivingsenderchannelmessages,
  correlationid as CorrelationID,
  integrationflowname as Integrationflowname,
  archivingpersistedmessages as Archivingpersistedmessages,
  @Semantics.user.createdBy: true
  local_created_by as LocalCreatedBy,
  @Semantics.systemDateTime.createdAt: true
  local_created_at as LocalCreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
