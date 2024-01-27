@EndUserText.label: 'Consumption - Header'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_header_1078
  as projection on zi_header_1078
{
  key Id,
      Email,
      FirstName,
      LastName,
      Country,
      CreatedOn,
      DeliveryDate,
      OrderStatus,
      ImageUrl,
      /* Associations */
      _Items : redirected to composition child ZC_items_1078
}
