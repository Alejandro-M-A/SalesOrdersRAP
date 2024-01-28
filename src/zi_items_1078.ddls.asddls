@AbapCatalog.sqlViewName: 'ZV_ITEMS_1078'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Items'
define view zi_items_1078
  as select from zitems_1078 as Items
  association to parent zi_header_1078 as _Header on $projection.header_id = _Header.id
{
  key header_id,
  key id,
      name,
      description,
      release_date,
      discontinued_date,
      price,
      height,
      width,
      depth,
      quantity,
      @Semantics.unitOfMeasure: true
      unit_of_mesaure,
      
      //Associations
      _Header
}
