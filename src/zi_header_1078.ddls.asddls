@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface - Header'
define root view entity zi_header_1078
  provider contract transactional_interface
  as projection on zr_header_1078
{
  key id,
      email,
      first_name,
      last_name,
      country,
      created_on,
      delivery_date,
      order_status,
      image_url,
      created_by,
      created_at,
      locallastchangedat,
      lastchangedat,
      /* Associations */
      _Item : redirected to composition child zi_items_1078
}
