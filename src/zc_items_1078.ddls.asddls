@EndUserText.label: 'Consumption - Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_items_1078
  as projection on zi_items_1078
{
  key HeaderId,
  key Id,
      Name,
      Description,
      ReleaseDate,
      DiscontinuedDate,
      Price,
      Height,
      Width,
      Depth,
      Quantity,
      UnitOfMesaure,
      /* Associations */
      _Header : redirected to parent ZC_header_1078
}
