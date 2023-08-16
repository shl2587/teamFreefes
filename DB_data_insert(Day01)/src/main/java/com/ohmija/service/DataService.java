package com.ohmija.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ohmija.model.DataDTO;
import com.ohmija.repository.DataDAO;

@Service
public class DataService {

	@Autowired DataDAO dao;

	public int insert(List<Map<String, Object>> list) {
		int row = 0;
		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			DataDTO dto = new DataDTO();
			dto.setBasic_organization_name((String) map.get("Basic_organization_name"));
			dto.setDedicated_organization((String) map.get("dedicated_organization"));
			dto.setFes_category((String) map.get("fes_category"));
			dto.setFes_date((String) map.get("fes_date"));
			dto.setFes_name((String) map.get("fes_name"));
			dto.setFes_place((String) map.get("fes_place"));
			dto.setFirst_hosting_year((String) map.get("first_hosting_year"));
			dto.setForiengner_count((String) map.get("foriengner_count"));
			dto.setHosting_method((String) map.get("hosting_method"));
			dto.setIdx(Integer.parseInt((String) map.get("idx")));
			dto.setOranization_type((String) map.get("oranization_type"));
			dto.setRegion((String) map.get("region"));
			dto.setVisitor_count((String) map.get("visitor_count"));
			
			row += dao.insert(dto);
		}
		return row;
	}
}
