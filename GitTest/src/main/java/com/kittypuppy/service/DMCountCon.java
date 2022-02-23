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
		String sendnick = request.getParameter("sendnick");
		String receivenick = request.getParameter("receivenick");
		
		DMDAO ddao = new DMDAO();
		System.out.println(sendnick);
        System.out.println(receivenick);
		ArrayList<DMDTO> DMList = ddao.DMShow(sendnick, receivenick);
      
        int result = DMList.size();
        
        PrintWriter out = response.getWriter();
        System.out.println("test"+result);
        
        out.print(result);
	}

}
