package com.basic.userinput;

import com.basic.blogimpl.AdvanceBlog;
import com.basic.blogimpl.BasicBlog;
import com.basic.bloginterface.BlogInterface;

public class BlogInterfaceInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		BlogInterface blog= new BasicBlog();
		BlogInterface advBlog = new AdvanceBlog();
		
		blog.validate(false);
		advBlog.validate(true);
		
		BlogInterface onTheFlyBlog = (validateCheck) ->{
			System.out.println("Implement ananymous validate"+validateCheck);
		};
		onTheFlyBlog.validate(false);
	}

}
