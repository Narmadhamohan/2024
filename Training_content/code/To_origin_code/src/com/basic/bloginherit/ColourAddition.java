package com.basic.bloginherit;



// override permissible access, 
//covariant return types
//fewer or specific exceptions
// change selectpapertype for above features and how
public class ColourAddition extends PencilDrawings{
	
	String colours[] = {"Red","Blue", "Green"};
	int [] colourCode = {5,6,7,8};
	// super()

	public void addColours( int colourcode) {
		System.out.println("Added Colourcode"+colourcode);		
	}
	public void selectPaperType(){
		System.out.println("Advanced Glossy type.");
	}

}
