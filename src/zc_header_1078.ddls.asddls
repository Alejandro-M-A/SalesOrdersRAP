@EndUserText.label: 'Consumption - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_header_1078
  as projection on zi_header_1078
{
  key id            as Id,
      email         as Email,
      first_name    as FirstName,
      last_name     as LastName,
      country       as Country,
      created_on    as CreatedOn,
      delivery_date as DeliveryDate,
      order_status  as OrderSatatus,
      image_url     as ImagerUrl,
      /* Associations */
      _Items : redirected to composition child ZC_items_1078
}
