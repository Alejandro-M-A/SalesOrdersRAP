CLASS zcl_load_initial_data_1078 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_load_initial_data_1078 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

*Draft fields
*local_created_by      : abp_creation_user;
*local_created_at      : abp_creation_tstmpl;
*local_last_changed_by : abp_locinst_lastchange_user;
*local_last_changed_at : abp_locinst_lastchange_tstmpl;
*last_changed_at       : abp_lastchange_tstmpl;

    DATA: lt_header TYPE TABLE OF zHeader_1078,
          lt_Items  TYPE TABLE OF zitems_1078,
          lt_status TYPE TABLE OF zstatus_1078.

******** TABLA1 ********
    "fill internal table
    lt_header = VALUE #(
    ( id = '000001' email = 'email@email.com' first_name = 'Pedro' last_name = 'Perez' country = 'España' created_on = '20231201' delivery_date = '20231215' order_status = 1 image_url = '' )
    ( id = '000002' email = 'email@email.com' first_name = 'Julia' last_name = 'Jimenez' country = 'Francia' created_on = '20231201' delivery_date = '20231215' order_status = 1 image_url = '' )
    ( id = '000003' email = 'email@email.com' first_name = 'Juan' last_name = 'Ruiz' country = 'Colombia' created_on = '20231201' delivery_date = '20231215' order_status = 1 image_url = '' )
 ).

    "Delete possible entries; insert new entries
    DELETE FROM zHeader_1078.
    INSERT zHeader_1078 FROM TABLE @lt_header.

    IF sy-subrc EQ 0.
      out->write( |Acceso Header: { sy-dbcnt } registros insertados| ).
    ENDIF.

******** TABLA2 ********
    "fill internal table
    lt_Items = VALUE #(
    ( Header_Id = '000001' Id = '000001' Name = 'Producto 1' Description = 'Descripcion 1' Release_Date = '20231215' Discontinued_Date = '20231215' Price = 10 Height = 12 Width = 14 Depth = 5 Quantity = 2 Unit_Of_Mesaure = 'UN' )
     ).

    "Delete possible entries; insert new entries
    DELETE FROM zitems_1078.
    INSERT zitems_1078 FROM TABLE @lt_Items.

    IF sy-subrc EQ 0.
      out->write( |Items: { sy-dbcnt } registros insertados| ).
    ENDIF.

******** TABLA3 ********
    lt_status = VALUE #(
        ( id = '001' description = 'New' )
        ( id = '002' description = 'In Process' )
        ( id = '003' description = 'Finished' )
     ).

    "Delete possible entries; insert new entries
    DELETE FROM zstatus_1078.
    INSERT zstatus_1078 FROM TABLE @lt_status.

    "Check result in console
    out->write( 'DONE!' ).

  ENDMETHOD.

ENDCLASS.
