function confirmFunction() {
  var txt;
  let b;
  if (b=confirm("Press a button!")) {
    txt = "You pressed OK!"+b ;
  } else {
    txt = "You pressed Cancel!";
  }
  document.getElementById("demo").innerHTML = txt;
}

function promptFunction() {
	// Single line Comment
	/*
	Multi-line comment
	*/
  let text;
  let name = prompt("Please enter your name:", "Default Value");
  if (name == null || name == "") {
    text = "User cancelled the prompt.";
  } else {
    text = "Hello " + name + "! How are you today?";
  }
  document.getElementById("demo").innerHTML = text;
}
