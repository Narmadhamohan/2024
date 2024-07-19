package com.basic.blogimpl;

import com.basic.bloginterface.BlogInterface;

public class AdvanceBlog implements BlogInterface{

	@Override
	public void validate(boolean plagiarismCheck) {

		System.out.println("Connect to DB");
		System.out.println("ABC Group: Hosting");
		System.out.println("Plagiarism check done with ABC rules"+AdvanceBlog.infoGroup);	
		//AdvanceBlog.infoGroup = "Maruti";
	}
	
	

}
