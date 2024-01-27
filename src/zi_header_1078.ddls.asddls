@AbapCatalog.sqlViewName: 'ZV_HEADER_1078'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Header'
define root view zi_header_1078
  as select from zheader_1078 as Header
  composition [0..*] of zi_items_1078 as _Items
{
  key id            as Id,
      email         as Email,
      first_name    as FirstName,
      last_name     as LastName,
      country       as Country,
      @Semantics.systemDateTime.createdAt: true
      created_on    as CreatedOn,
      delivery_date as DeliveryDate,
      order_status  as OrderStatus,
      image_url     as ImageUrl,
      
      // Associations
      _Items
}
