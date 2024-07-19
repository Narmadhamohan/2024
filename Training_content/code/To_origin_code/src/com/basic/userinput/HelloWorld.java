package com.basic.userinput;

import java.util.Scanner;

import com.basic.bloginterface.BlogInterface;

public class HelloWorld {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Hello World!");
		
	Scanner scanner = new Scanner(System.in);
	System.out.println("Enter the name: ");
	String userInput = scanner.nextLine();
	System.out.printf("Hello %s", userInput);
	
		
	}

}
