package com.basic.userinput;
//Explain super,
//inheritance, overloading,
// overriding
import com.basic.bloginherit.ColourAddition;
import com.basic.bloginherit.PencilDrawings;

public class DrawingInheritanceInput {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	//	PencilDrawings draw = new PencilDrawings();
	//	ColourAddition colourDraw = new ColourAddition();
		//draw = colourDraw;

		ColourAddition colourDraw = new ColourAddition();
		colourDraw.addColours(0);
		
		PencilDrawings draw = new ColourAddition();
		draw.selectPaperType();
		
		PencilDrawings drawParent = new PencilDrawings();
		drawParent.selectPaperType();
		
		
		
	}

}
