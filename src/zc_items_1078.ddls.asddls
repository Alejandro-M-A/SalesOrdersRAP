@EndUserText.label: 'Consumption - Items'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_items_1078
  as projection on zi_items_1078
{
  key header_id         as HeaderId,
  key id,
      name,
      description,
      release_date      as ReleaseDate,
      discontinued_date as DiscontinuedDate,
      price,
      height,
      width,
      depth,
      quantity,
      unit_of_mesaure   as UnitsOfMesaure,
      /* Associations */
      _Header : redirected to parent ZC_header_1078
}
