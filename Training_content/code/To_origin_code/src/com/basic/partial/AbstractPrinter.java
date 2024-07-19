package com.basic.partial;

public abstract class AbstractPrinter {
// not abstract by default
	
	int data;
	public AbstractPrinter(int data) {
		this.data = data;
	}
	public AbstractPrinter() {
		this.data = 10;
	}
	public abstract void fillInk();
	
	public void validateUser() {
		System.out.println("Connect to DB and validate");
	}
	
}
