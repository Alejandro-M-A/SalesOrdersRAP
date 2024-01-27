@AbapCatalog.sqlViewName: 'ZV_ITEMS_1078'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Items'
define view zi_items_1078
  as select from zitems_1078 as Items
  association to parent zi_header_1078 as _Header on $projection.HeaderId = _Header.Id
{
  key header_id         as HeaderId,
  key id                as Id,
      name              as Name,
      description       as Description,
      release_date      as ReleaseDate,
      discontinued_date as DiscontinuedDate,
      price             as Price,
      height            as Height,
      width             as Width,
      depth             as Depth,
      quantity          as Quantity,
      @Semantics.unitOfMeasure: true
      unit_of_mesaure   as UnitOfMesaure,
      
      //Associations
      _Header
}
