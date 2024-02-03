@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption - Items'
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'id' ]
define view entity ZC_items_1078
  as projection on zi_items_1078
{
  key id                 as Id,
      header_id          as HeaderId,
      @Search.defaultSearchElement: true
      name               as Name,
      description        as Description,
      release_date       as ReleaseDate,
      discontinued_date  as DiscontinuedDate,
      price              as Price,
      height             as Height,
      width              as Width,
      depth              as Depth,
      quantity           as Quantity,
      unit_of_mesaure    as UnitOfMesaure,
      locallastchangedat as Locallastchangedat,
      /* Associations */
      _Header : redirected to parent ZC_header_1078
}
