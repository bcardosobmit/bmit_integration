@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZR_BMIT_TB_LOG_RAP'
@ObjectModel.semanticKey: [ 'MessageguID' ]
define root view entity ZC_BMIT_TB_LOG_RAP
  provider contract transactional_query
  as projection on ZR_BMIT_TB_LOG_RAP
{
  key MessageguID,
  Logstart,
  Status,
  Archivinglogattachments,
  Customstatus,
  Type,
  Packagename,
  PackageID,
  ID,
  Name,
  Origincomponentname,
  Receiver,
  Previouscomponentname,
  Logend,
  Alternateweblink,
  Loglevel,
  Archivingstatus,
  TransactionID,
  Sender,
  Archivingreceiverchannelmessag,
  Applicationmessagetype,
  ApplicationmessageID,
  Localcomponentname,
  Archivingsenderchannelmessages,
  CorrelationID,
  Integrationflowname,
  Archivingpersistedmessages,
  LocalLastChangedAt
  
}
