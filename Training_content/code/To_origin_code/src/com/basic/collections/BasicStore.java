package com.basic.collections;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BasicStore {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<String> usernameList = new ArrayList<>();
		Set<String> colorCode = new HashSet<>();
		Map<Integer,String> authorMap= new HashMap<>();
		usernameList.add("Sudharsan");
		usernameList.add("Jose");
		usernameList.add("Jose");
		
		
		colorCode.add("Yellow");
		colorCode.add("Blue");
		colorCode.add("Green");
		colorCode.add("Green");
		
		
		if(colorCode.contains("red")) {
			System.out.println("print yes");
		}
		authorMap.put(1, "A");
		authorMap.put(2, "B");
		authorMap.put(3, "c");
		
		usernameList.stream().forEach(a -> System.out.println(a));
		colorCode.stream().forEach(a -> System.out.println(a));
		authorMap.entrySet().forEach(entry -> System.out.println("Key: "+entry.getKey()+" Value: "+entry.getValue()));
		authorMap.forEach((k,v) -> System.out.println("Key: "+k+" Value: "+v));
		
		usernameList.remove(new String("Jose"));
		colorCode.remove("Blue");
		authorMap.remove(3);
		
		System.out.println("After removal: ");
		usernameList.stream().forEach(a -> System.out.println(a));
		colorCode.stream().forEach(a -> System.out.println(a));
		authorMap.entrySet().forEach(entry -> System.out.println("Key: "+entry.getKey()+" Value: "+entry.getValue()));
		authorMap.forEach((k,v) -> System.out.println("Key: "+k+" Value: "+v));
		
		
		
	}

}
