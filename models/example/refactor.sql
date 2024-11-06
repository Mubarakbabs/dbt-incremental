     
Select
        vmih.id exp_doc_study_site_milestone_detail_sk,
        vmih.id src_exp_doc_study_site_milestone_detail_tid,
        vdtdh.name__v doc_type_name,
        vdtdh2.name__v doc_subtype_name,
        vdtdh3.name__v doc_classification_name,
        vsh.name__v study_id,
        vch.abbreviation__vs country_iso3_id,
        vsh2.name__v study_site_id,
        vmh.milestone_type__v_label milestone_type_name,
        vmih.created_by__v created_by_user_sk,
        vmih.edl_item__v exp_doc_sk,
        vmih.modified_by__v last_updated_by_user_sk,
        vmih.milestone__v study_site_milestone_detail_sk,
        vmih.created_date__v create_dtm,
        vmih.modified_date__v last_update_dtm
from
        dev_rnd_integrated_data_dw.gladdaga.milestone_item__l1__vtmf vmih
inner join (select * from dev_rnd_integrated_data_dw.gladdaga.milestone__l1__vtmf)vmh On
        vmih.milestone__v = vmh.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.edl_item__l1__vtmf)veih On
        vmih.edl_item__v = veih.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.doc_type_detail__l1__vtmf)vdtdh On
        veih.type__v = vdtdh.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.doc_type_detail__l1__vtmf)vdtdh2 On
        veih.subtype__v = vdtdh2.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.doc_type_detail__l1__vtmf) vdtdh3 On
        veih.classification__v = vdtdh3.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.study__l1__vtmf)vsh On
        veih.study__v = vsh.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.study_country__l1__vtmf)vsch On
        veih.study_country__v = vsch.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.country__l1__vtmf)vch On
        vsch.country__v = vch.id
left outer join (select * from dev_rnd_integrated_data_dw.gladdaga.site__l1__vtmf)vsh2 On
        veih.site__v = vsh2.id

where
        vmh.study__v is not null
        and vmh.study_country__v is not null
        and vmh.study_site__v is not null;