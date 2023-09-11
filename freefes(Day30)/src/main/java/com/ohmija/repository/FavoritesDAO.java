package com.ohmija.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ohmija.model.BoardDTO;
import com.ohmija.model.FavoritesDTO;
import com.ohmija.model.Favorites_pagingDTO;

@Repository
public interface FavoritesDAO {

	int insert_favorite_board(FavoritesDTO favorites);

	FavoritesDTO select_favorite_board(FavoritesDTO favorites);

	int delete_favorite_board(FavoritesDTO favorites);

	int select_fav_total_page(int idx);

	List<BoardDTO> selectfav(Favorites_pagingDTO favorites_pagingdto);

	// 좋아요 확인시켜주기 위함
	int check_favorites_board(FavoritesDTO favorites_dto);
	
	
}
