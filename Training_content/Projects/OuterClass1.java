public class OuterClass1 {
    private static String staticOuterField = "Static Outer field";

    // Static Nested Class
    public static class StaticNestedClass {
        public void display() {
            System.out.println("Accessing: " + staticOuterField); // Can access static outer class members
        }
    }

    public static void main(String[] args) {
        OuterClass1.StaticNestedClass nested = new OuterClass1.StaticNestedClass(); // Creating an instance of StaticNestedClass
        nested.display();
    }
}
