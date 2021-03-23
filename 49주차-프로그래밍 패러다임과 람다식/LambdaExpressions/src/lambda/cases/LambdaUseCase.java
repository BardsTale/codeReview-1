package lambda.cases;

@FunctionalInterface
interface MyFunction {
    void run();
}

public class LambdaUseCase {
    static void execute(MyFunction f) {
        f.run();
    }

    static MyFunction getMyFunction() {
        MyFunction f = () -> System.out.println("f3.run()");
        return f;
    }

    public static void main(String[] args) {
        // 1. �͸� Ŭ������ MyFunction.run() ����(���� ���)
        MyFunction f1 = new MyFunction() {
            @Override
            public void run() {
                System.out.println("f1.run()");
            }
        };

        // 2. ���ٽ����� MyFunction.run() ����
        MyFunction f2 = () -> System.out.println("f2.run()");

        // 3. ���ٽ��� ��ȯ�ϴ� �޼ҵ� ȣ��
        MyFunction f3 = getMyFunction();

        f1.run();
        f2.run();
        f3.run();

        execute(f1);    // ���ٽ��� �����ϴ� ���������� �Ű������� ����
        execute(f2);    // 
        execute(f3);    // 
        
        execute(() -> System.out.println("run()")); // ���ٽ��� ���� �Ű������� ����
    }
}