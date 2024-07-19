package com.basic.bloginterface;
/*
 * 
 * Story fo tata and pagelimit.
 */
public interface BlogInterface {
	
// public static final by default
	String infoGroup= "TATA";
	int pageLimit = 10;
	// abstract by default
	public void validate(boolean plagiarismCheck);
	
	
	
	
	/*
	 * public default void allowedLimit(int pages) {
	 * 
	 * if(pages>pageLimit) { System.out.println("Allowed limit exceeded!"); }
	 * 
	 * } public static void addHeader(String companySlogan) {
	 * System.out.printf("%s %s",companySlogan, infoGroup ); }
	 */
	
}
