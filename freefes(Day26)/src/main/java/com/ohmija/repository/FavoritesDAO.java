package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.FavoritesDTO;

@Repository
public interface FavoritesDAO {

	int insert_favorite_board(FavoritesDTO favorites);

	FavoritesDTO select_favorite_board(FavoritesDTO favorites);

	int delete_favorite_board(FavoritesDTO favorites);

	// 좋아요 확인시켜주기 위함
	int check_favorites_board(FavoritesDTO favorites_dto);
	
	
}
