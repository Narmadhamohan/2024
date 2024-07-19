package com.basic.userinput;

import com.basic.blogimpl.CloudBlog;
import com.basic.partial.AbstractPrinter;

public class BlogAbstractInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		AbstractPrinter print  = new CloudBlog();
		print.validateUser();
		print.fillInk();
		
	}

}
