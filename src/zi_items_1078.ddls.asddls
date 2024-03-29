@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Items'
define view entity zi_items_1078
  as projection on zr_item_1078
{
  key id,
      header_id,
      name,
      description,
      release_date,
      discontinued_date,
      price,
      height,
      width,
      depth,
      quantity,
      unit_of_mesaure,
      locallastchangedat,
      /* Associations */
      _Header : redirected to parent zi_header_1078
}
