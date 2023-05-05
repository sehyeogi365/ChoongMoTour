package com.marondal.choongmotour.lodging.dibs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.marondal.choongmotour.lodging.model.DibsDetail;


@Repository
public interface DibsDAO {
	//찜
	public int insertDibs(@Param("lodgingId") int lodgingId
						 , @Param("userId") int userId);
	
	//찜 여부 확인
	public int selectDibsByUserId(@Param("userId") int userId
								  , @Param("lodgingId") int lodgingId
								 );
										
	
	//찜 취소
	public int deleteDibs(@Param("lodgingId") int lodgingId
						  , @Param("userId") int userId);
	
	//찜 조회
	public List<DibsDetail> selectDibsList(@Param("userId") int userId, @Param("id") int id);//이것도 쿼리문 자체를 잘못생각했다. 로징아이디로 조회 이되, 딥스id순 내림차순정렬일뿐
	
	//찜 목록 숙소리스트
	//public List<Lodging> selectLodgingListByDibs(@Param("id") int id);
		
	//찜 목록내 제거
	public int deleteDibsById(@Param("userId") int userId, @Param("id") int id);
	
	
}
