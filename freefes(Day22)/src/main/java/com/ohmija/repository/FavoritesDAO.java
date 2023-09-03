package com.ohmija.repository;

import org.springframework.stereotype.Repository;

import com.ohmija.model.FavoritesDTO;

@Repository
public interface FavoritesDAO {

	int insert_favorite_board(FavoritesDTO favorites);

	FavoritesDTO select_favorite_board(FavoritesDTO favorites);

	int delete_favorite_board(FavoritesDTO favorites);
	
	
}
