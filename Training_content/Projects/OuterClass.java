public class OuterClass {
    private String outerField = "Outer field";

    // Normal Inner Class
    public class InnerClass {
        public void display() {
            System.out.println("Accessing: " + outerField); // Can access outer class members
        }
    }

    public static void main(String[] args) {
        OuterClass outer = new OuterClass();
        OuterClass.InnerClass inner = outer.new InnerClass(); // Creating an instance of InnerClass
        inner.display();
    }
}
