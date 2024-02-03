@Search.searchable: true
@EndUserText.label: 'Consumption - Header'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'Id' ]
define root view entity ZC_header_1078
  provider contract transactional_query
  as projection on zi_header_1078
{
  key id                 as Id,
      @Search.defaultSearchElement: true
      email              as Email,
      @Search.defaultSearchElement: true
      first_name         as FirstName,
      last_name          as LastName,
      country            as Country,
      created_on         as CreatedOn,
      delivery_date      as DeliveryDate,
      order_status       as OrderStatus,
      image_url          as ImageUrl,
      created_by         as CreatedBy,
      created_at         as CreatedAt,
      locallastchangedat as Locallastchangedat,
      lastchangedat      as Lastchangedat,
      /* Associations */
      _Item : redirected to composition child ZC_items_1078
}
