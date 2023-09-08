package com.ohmija.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ohmija.model.FavoritesDTO;
import com.ohmija.repository.FavoritesDAO;

@Service
public class FavoritesService {

	@Autowired FavoritesDAO favoritesDao;
	
	@Transactional
	public FavoritesDTO add_favorites(int board_idx, int login_idx) {
		FavoritesDTO favorites = new FavoritesDTO();
		favorites.setBoard(board_idx);
		favorites.setMember(login_idx);
		
		int insert_favorites = favoritesDao.insert_favorite_board(favorites);
		if(insert_favorites != 0) {
			FavoritesDTO dto = favoritesDao.select_favorite_board(favorites);
			return dto;
		}
		return null;
	}

	public FavoritesDTO remove_favorites(int board_idx, int login_idx) {
		FavoritesDTO favorites = new FavoritesDTO();
		favorites.setBoard(board_idx);
		favorites.setMember(login_idx);
		
		int delete_favorites = favoritesDao.delete_favorite_board(favorites);
		
		FavoritesDTO dto = favoritesDao.select_favorite_board(favorites);
		if(delete_favorites != 0) {
			return null;
		}
		return dto;
	}


}
