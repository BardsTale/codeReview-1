package lambda.app;

/**
 * �� ���ڸ� �ٷ� �� �ִ� ���Ⱑ �ִ�.
 * �� ���ڸ� �޾� ���ϱ�, ����, ���ϱ�, ������, ���������� ���� �� �ִ� ���α׷��� �����϶�
 */

interface Calculater{
	public int add(int num1, int num2);
	public int sub(int num1, int num2);
	public int mul(int num1, int num2);
	public int div(int num1, int num2);
	public int mod(int num1, int num2);
}

public class Calc implements Calculater{
	@Override
	public int add(int num1, int num2) { return num1 + num2; }
 	@Override
	public int sub(int num1, int num2) { return num1 - num2; }
	@Override
	public int mul(int num1, int num2) { return num1 * num2; }
	@Override
	public int div(int num1, int num2) { return num1 / num2; }
	@Override
	public int mod(int num1, int num2) { return num1 % num2; }
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Calc cal = new Calc();
		System.out.println("�� ���� ���� : " + cal.add(5, 2));
		System.out.println("�� ���� ���� : " + cal.sub(5, 2));
		System.out.println("�� ���� ���� : " + cal.mul(5, 2));
		System.out.println("�� ���� ���� : " + cal.div(5, 2));
		System.out.println("�� ���� ���� : " + cal.mod(5, 2));
		
	}
}
