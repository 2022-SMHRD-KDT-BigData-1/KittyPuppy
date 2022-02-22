package com.kittypuppy.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kittypuppy.model.DMDAO;
import com.kittypuppy.model.DMDTO;


public class DMCountCon implements iCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String sendNick = request.getParameter("sendNick");
		String receiveNick = request.getParameter("receiveNick");
		
		DMDAO ddao = new DMDAO();
    	
		ArrayList<DMDTO> DMList = ddao.DMShow(sendNick, receiveNick);
      
        int result = DMList.size();
        
        PrintWriter out = response.getWriter();
        out.print(result);
	}

}
