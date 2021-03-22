package lambda.app;

/**
 * �� ���ڸ� �ٷ� �� �ִ� ���Ⱑ �ִ�.
 * �� ���ڸ� �޾� ���ϱ�, ����, ���ϱ�, ������, ���������� ���� �� �ִ� ���α׷��� �����϶�
 * ��, ���ٽ��� �̿��Ͽ� �����϶�.
 */

@FunctionalInterface
interface LambdaCalculater{
	public int cal(int a, int b);
}

public class CalcLambda{
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LambdaCalculater addCal = (int num1, int num2) -> { return num1 + num2; };
		LambdaCalculater subCal = (int num1, int num2) -> { return num1 - num2; };
		LambdaCalculater mulCal = (int num1, int num2) -> { return num1 * num2; };
		LambdaCalculater divCal = (int num1, int num2) -> { return num1 / num2; };
		LambdaCalculater modCal = (int num1, int num2) -> { return num1 % num2; };
		
		System.out.println("�� ���� ���� : " + addCal.cal(5, 2));
		System.out.println("�� ���� ���� : " + subCal.cal(5, 2));
		System.out.println("�� ���� ���� : " + mulCal.cal(5, 2));
		System.out.println("�� ���� ���� : " + divCal.cal(5, 2));
		System.out.println("�� ���� ���� : " + modCal.cal(5, 2));
		
		// ���ٽ� ��� 1�ܰ�
		addCal = (num1, num2) -> { return num1 + num2; };      
		subCal = (num1, num2) -> { return num1 - num2; };      
		mulCal = (num1, num2) -> { return num1 * num2; };      
		divCal = (num1, num2) -> { return num1 / num2; };      
		modCal = (num1, num2) -> { return num1 % num2; };
		
		// ���ٽ� ��� 2�ܰ�		
		addCal = (num1, num2) -> num1 + num2;      
		subCal = (num1, num2) -> num1 - num2;      
		mulCal = (num1, num2) -> num1 * num2;      
		divCal = (num1, num2) -> num1 / num2;
		modCal = (num1, num2) -> num1 % num2;		
	}
}

