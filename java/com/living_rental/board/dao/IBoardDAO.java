package com.living_rental.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.living_rental.board.dto.BoardDTO;

@Repository
public interface IBoardDAO {
	public void writeProc(BoardDTO board);

	public ArrayList<BoardDTO> boardProc(@Param("b") int begin, @Param("e")int end,  @Param("sel")String sel, @Param("search") String search);

	public BoardDTO viewProc(int no);
	public void upHit(int no);

	public int boardCount(HashMap<String, Object> map);

	public int modifyProc(BoardDTO board);

	public int deleteProc(int no);

	public String getFileName(int no);
}
