CLASS lhc_Header DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    TYPES:
      t_entities_create TYPE TABLE FOR CREATE zr_header_1078\\Header,
      t_entities_update TYPE TABLE FOR UPDATE zr_header_1078\\Header,
      t_failed_Header   TYPE TABLE FOR FAILED EARLY zr_header_1078\\Header,
      t_reported_Header TYPE TABLE FOR REPORTED EARLY zr_header_1078\\Header.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Header RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Header RESULT result.

    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE Header.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Header.

    METHODS precheck_auth
      IMPORTING
        it_entities_create TYPE t_entities_create OPTIONAL
        it_entities_update TYPE t_entities_update OPTIONAL
      CHANGING
        ct_failed          TYPE t_failed_header
        ct_reported        TYPE t_reported_header.

    METHODS Resume FOR MODIFY
      IMPORTING keys FOR ACTION Header~Resume.

    METHODS validateEmail FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateEmail.

    METHODS validateCreatedOn FOR VALIDATE ON SAVE
      IMPORTING keys FOR Header~validateCreatedOn.

    METHODS is_create_granted
      RETURNING VALUE(create_granted) TYPE abap_bool.

    METHODS is_update_granted
      RETURNING VALUE(update_granted) TYPE abap_bool.

    METHODS is_delete_granted
      RETURNING VALUE(delete_granted) TYPE abap_bool.

ENDCLASS.

CLASS lhc_Header IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
    READ ENTITIES OF zr_header_1078 IN LOCAL MODE
           ENTITY Header
           ALL FIELDS
           WITH CORRESPONDING #( keys )
           RESULT DATA(lt_headers)
           FAILED failed.

    LOOP AT lt_headers INTO DATA(ls_header).
      APPEND VALUE #( LET upd_auth = abap_true
                          del_auth = abap_true
                      IN %tky         = ls_header-%tky
                         %update      = upd_auth
                         %delete      = del_auth
                    ) TO result.
    ENDLOOP.
  ENDMETHOD.

  METHOD precheck_create.
    precheck_auth(
         EXPORTING
           it_entities_create = entities
         CHANGING
           ct_failed          = failed-header
           ct_reported        = reported-header
       ).
  ENDMETHOD.

  METHOD precheck_update.
    precheck_auth(
       EXPORTING
         it_entities_update = entities
       CHANGING
         ct_failed          = failed-header
         ct_reported        = reported-header
     ).
  ENDMETHOD.

  METHOD precheck_auth.
    DATA:
      lt_entities          TYPE t_entities_update,
      lv_operation         TYPE if_abap_behv=>t_char01,
      lv_is_modify_granted TYPE abap_bool.

    ASSERT NOT ( it_entities_create IS INITIAL EQUIV it_entities_update IS INITIAL ).

    IF it_entities_create IS NOT INITIAL.

      lt_entities  = CORRESPONDING #( it_entities_create MAPPING %cid_ref = %cid ).
      lv_operation = if_abap_behv=>op-m-create.
    ELSE.

      lt_entities  = it_entities_update.
      lv_operation = if_abap_behv=>op-m-update.
    ENDIF.

    LOOP AT lt_entities INTO DATA(ls_entity).

      lv_is_modify_granted = abap_true.

      CASE lv_operation.
        WHEN if_abap_behv=>op-m-create.

          lv_is_modify_granted = is_create_granted( ).

        WHEN if_abap_behv=>op-m-update.

          lv_is_modify_granted = is_update_granted( ).

      ENDCASE.

      IF lv_is_modify_granted EQ abap_false.

        APPEND VALUE #( %cid = COND #( WHEN lv_operation = if_abap_behv=>op-m-create
                                       THEN ls_entity-%cid_ref )
                                       %tky = ls_entity-%tky
                                       ) TO ct_failed.

        APPEND VALUE #( %cid = COND #( WHEN lv_operation = if_abap_behv=>op-m-create
                                       THEN ls_entity-%cid_ref )
                                       %tky = ls_entity-%tky ) TO ct_reported.


      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD Resume.
  ENDMETHOD.

  METHOD validateEmail.
    READ ENTITIES OF zr_header_1078 IN LOCAL MODE
        ENTITY Header
        FIELDS ( email )
        WITH CORRESPONDING #( keys )
   RESULT DATA(lt_headers).

    LOOP AT lt_headers INTO DATA(ls_header).
      IF ls_header-email IS INITIAL.
        APPEND VALUE #( %key = ls_header-%key ) TO failed-header.
        APPEND VALUE #( %key = ls_header-%key
              %msg = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text = 'The field email is mandatory'
                      )
              %element-Email = if_abap_behv=>mk-on ) TO reported-header.

      ELSEIF NOT ls_header-email CS '@'.
        APPEND VALUE #( %key = ls_header-%key ) TO failed-header.
        APPEND VALUE #( %key = ls_header-%key
              %msg = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text = 'Invalid emial format'
                      )
              %element-Email = if_abap_behv=>mk-on ) TO reported-header.

      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD validateCreatedOn.



    READ ENTITIES OF zr_header_1078 IN LOCAL MODE
      ENTITY Header
      FIELDS ( created_on delivery_date )
      WITH CORRESPONDING #( keys )
 RESULT DATA(lt_headers).

    LOOP AT lt_headers INTO DATA(ls_header).
      IF ls_header-created_on IS NOT INITIAL AND
         ls_header-delivery_date IS NOT INITIAL AND
         ls_header-created_on GT ls_header-delivery_date.
        APPEND VALUE #( %key = ls_header-%key ) TO failed-header.
        APPEND VALUE #( %key = ls_header-%key
              %msg = new_message_with_text(
                          severity = if_abap_behv_message=>severity-error
                          text = 'The delivery date must be equal to or greater than the creation date'
                      )
              %element-Email = if_abap_behv=>mk-on ) TO reported-header.
      ENDIF.

    ENDLOOP.

  ENDMETHOD.

  METHOD is_create_granted.
    create_granted = abap_true.
  ENDMETHOD.

  METHOD is_update_granted.
    update_granted = abap_true.
  ENDMETHOD.

  METHOD is_delete_granted.
    delete_granted = abap_true.
  ENDMETHOD.

ENDCLASS.
