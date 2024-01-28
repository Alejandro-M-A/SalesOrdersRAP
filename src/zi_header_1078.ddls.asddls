@AbapCatalog.sqlViewName: 'ZV_HEADER_1078'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Header'
define root view zi_header_1078
  as select from zheader_1078 as Header
  composition [0..*] of zi_items_1078 as _Items
{
  key id,
      email,
      first_name,
      last_name,
      country,
      @Semantics.systemDateTime.createdAt: true
      created_on,
      delivery_date,
      order_status,
      image_url,
      
      // Associations
      _Items
}
