package com.lan.tour.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lan.tour.model.dto.HotelDto;
import com.lan.tour.model.dto.LantourDto;
@Repository
public class LantourDaoImpl implements LantourDao {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public List<LantourDto> selectList() {
      
      List<LantourDto> res = null;
      try {
         res = sqlSession.selectList(NAMESPACE+"lantourlist");
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      
      return res;
   }

   @Override
   public LantourDto selectOne(int lantour_no) {
      LantourDto dto = null;
      try {
         dto = sqlSession.selectOne(NAMESPACE+"lantourOne", lantour_no);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      return dto;
   }

   @Override
   public int insert(LantourDto dto) {
      int res = 0;
      try {
         res = sqlSession.insert(NAMESPACE+"lantourinsert", dto);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return res;
   }

   @Override
   public int delete(int lantour_no) {
      int res = 0;
      try {
         res = sqlSession.delete(NAMESPACE+"lantourdelete", lantour_no);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
      }
      return res;
   }

}