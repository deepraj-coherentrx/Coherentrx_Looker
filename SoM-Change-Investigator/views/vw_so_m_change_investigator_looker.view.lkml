view: vw_som_change_investigator_looker {
  sql_table_name: `testdataprepr.DEV_CaseReporting.vw_SoM_ChangeInvestigator_Looker`
    ;;

  dimension: admininv_id {
    type: string
    sql: ${TABLE}.admininvID ;;
  }

  dimension: admininvemail {
    type: string
    sql: ${TABLE}.admininvemail ;;
  }

  dimension: adminjuriscode {
    type: string
    sql: ${TABLE}.adminjuriscode ;;
  }

  dimension: county_code {
    type: string
    sql: ${TABLE}.County_Code ;;
  }

  dimension: county_name {
    type: string
    sql: ${TABLE}.COUNTY_Name ;;
    html:
    {% if value == 'Ingham'%}
    <p style="color: DarkRed;">{{ value }}</p>
    {% elsif value == 'Kent'%}
    <p style="color: Indigo;">{{ value }}</p>
    {% elsif value == 'State of Michigan'%}
    <p style="color: Chocolate;">{{ value }}</p>
    {% elsif value == 'Detroit City'%}
    <p style="color: MediumBlue;">{{ value }}</p>
    {% elsif value == 'Montmorency'%}
    <p style="color: Purple;">{{ value }}</p>
    {% else %}
    <p style="color: SeaGreen;">{{ value }}</p>
    {% endif %};;
  }

  dimension: investigator_email {
    type: string
    sql: ${TABLE}.Investigator_email ;;
  }

  dimension: investigator_first_name {
    type: string
    sql: ${TABLE}.Investigator_FirstName ;;

  }

  dimension: investigator_id {
    type: string
    sql: ${TABLE}.Investigator_id ;;


  }

  dimension: investigator_last_name {
    type: string
    sql: ${TABLE}.Investigator_LastName ;;
  }

  dimension: investigator_type {
    type: string
    sql: ${TABLE}.Investigator_Type ;;
  }

  dimension: jurisdiction_code {
    type: string
    sql: ${TABLE}.Jurisdiction_Code ;;
  }

  dimension: jurisdiction_name {
    type: string
    sql: ${TABLE}.Jurisdiction_Name ;;
  }

  dimension: lhd_code {
    type: string
    sql: ${TABLE}.LHD_Code ;;
  }

  dimension: lhd_name {
    type: string
    sql: ${TABLE}.LHD_NAME ;;
  }

  dimension: mdss_id {
    type: string
    sql: ${TABLE}.MDSS_ID ;;
  }

  dimension: patient_email {
    type: string
    sql: ${TABLE}.Patient_Email ;;
    link: {
      label:"Google Mail"
      url: "https://www.google.com/gmail/"
      icon_url: "http://google.com/favicon.ico"
    }
  }

  dimension: patient_first_name {
    type: string
    sql: ${TABLE}.Patient_FirstName ;;
  }

  dimension: PatientId {

    type: string
    sql: ${TABLE}.PatientId ;;
    drill_fields: [PatientId]

    action: {

      label: "Change Investigator"

      url: "https://us-central1-testdataprepr.cloudfunctions.net/looker_change_investigator"


      param: {
        name: "Patient_IDs"
        value: "{{ value }}"
      }



      param: {
        name: "Updated_By"
        value: "{{_user_attributes['email']}}"
      }

      param: {
        name: "Old_Investigator_ID"
        value: "{{ investigator_id._value }}"
      }



      form_param: {

        name: "New_Investigator_ID"

        type: string

        label: "Change Investigator"

        default: "{{ investigator_id._value }}"


        description: "Select an investigator to assign this patient"

      }
      #user_attribute_param: {
      # user_attribute: user_id
      # name: "user"
      #}

    }


  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}.Patient_LastName ;;
  }

  #dimension: Patient_fullname {
  #  type: string
  #  sql: concat(${patient_first_name},' ',${patient_last_name}) ;;
  #}

  dimension: patient_phone {
    type: string
    sql: ${TABLE}.Patient_Phone ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Patient_ID{
    type: list
    list_field: PatientId

    action: {

      label: "Change Investigator"

      url: "https://us-central1-testdataprepr.cloudfunctions.net/looker_change_investigator"


      param: {
        name: "Patient_IDs"
        value: "{{ value }}"
      }

      param: {
        name: "Updated_By"
        value: "{{_user_attributes['email']}}"
      }

      param: {
        name: "Old_Investigator_ID"
        value: "{{ investigator_id._value }}"
      }



      form_param: {

        name: "New_Investigator_ID"

        type: string

        label: "Change Investigator"

        default: "{{ investigator_id._value }}"


        description: "Select an investigator to assign this patient"



      }

      #user_attribute_param: {
      # user_attribute: user_id
      # name: "user"
      #}

    }
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      lhd_name,
      patient_first_name,
      county_name,
      jurisdiction_name,
      investigator_first_name,
      patient_last_name,
      investigator_last_name
    ]
  }
}
