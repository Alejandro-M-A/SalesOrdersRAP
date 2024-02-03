@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Root entity Header'
define root view entity zr_header_1078
  as select from zheader_1078
  composition [0..*] of zr_item_1078 as _Item
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
      @Semantics.user.createdBy: true
      created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at,
      @Semantics.systemDateTime.lastChangedAt: true
      locallastchangedat,
      @Semantics.systemDateTime.lastChangedAt: true
      lastchangedat,

      _Item
}
