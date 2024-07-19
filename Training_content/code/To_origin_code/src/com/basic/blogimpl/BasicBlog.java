package com.basic.blogimpl;

import com.basic.bloginterface.BlogInterface;

public class BasicBlog implements BlogInterface{

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public void validate(boolean plagiarismCheck) {

		System.out.println("Connect to DB");
		System.out.println("BCA Group: Hosting");
		System.out.println("Plagiarism check done with BCA rules"+BasicBlog.infoGroup);	
		
	}

}
