@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item'
define view entity zr_item_1078
  as select from zitems_1078
  association to parent zr_header_1078 as _Header on $projection.header_id = _Header.id
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
      
      _Header
}
