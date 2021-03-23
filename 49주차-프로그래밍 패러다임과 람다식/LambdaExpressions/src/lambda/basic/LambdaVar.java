package lambda.basic;

@FunctionalInterface
interface MyFunction {
    void myMethod();
}

class Outer {
    int val = 10;   // Outer.this.val

    class Inner {
        int val = 20;   // this.val

        void method(int i) {    // void method(final int i)
            int val = 30;   // final int val = 30;
            // i = 10;  // final �� ���� �Ұ�

            MyFunction f = () -> {
                System.out.println("i: " + i);
                System.out.println("val: " + val);
                System.out.println("this.val: " + ++this.val);  // �ν��Ͻ� ������ ����� ���ֵ��� �����Ƿ� ���� ����
                System.out.println("Outer.this.val: " + ++Outer.this.val);  // �ν��Ͻ� ������ ����� ���ֵ��� �����Ƿ� ���� ����
                System.out.println("---------");
            };

            f.myMethod();
        }
    }
}
public class LambdaVar {
    public static void main(String[] args) {
        Outer outer = new Outer();
        Outer.Inner inner = outer.new Inner();
        inner.method(100);
        inner.method(100);
        
        Outer outer2 = new Outer();
        Outer.Inner inner2 = outer2.new Inner();
        inner2.method(100);
        
    }
}