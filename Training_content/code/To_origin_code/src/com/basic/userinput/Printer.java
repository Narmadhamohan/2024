package com.basic.userinput;

/*
 * Explain class, object, function,
 * Data encapsulation, set, return type,
 * this, constructor,
 * overloading
 */
public class Printer {
	
	private int modelId;
	private String printerName;
	private String userType;
	
	public Printer() {
		// add default modelid
		modelId=1;
	}
	public void startPrint() {
		System.out.println("Started Printing.");
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Printer printObject = new Printer();
		printObject.startPrint();
	}

}
