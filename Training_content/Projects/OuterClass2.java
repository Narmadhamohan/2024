public class OuterClass2 {
    private String outerField = "Outer field";

    public void outerMethod() {
        // Local Inner Class
        class LocalInnerClass {
            public void display() {
                System.out.println("Accessing: " + outerField); // Can access outer class members
            }
        }

        LocalInnerClass localInner = new LocalInnerClass(); // Creating an instance of LocalInnerClass
        localInner.display();
    }

    public static void main(String[] args) {
        OuterClass2 outer = new OuterClass();
        outer.outerMethod();
    }
}
