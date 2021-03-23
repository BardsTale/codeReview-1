package lambda.app;

import java.util.Scanner;
import java.util.function.Predicate;

import com.sun.org.apache.bcel.internal.generic.Type;

/**
 * ����ȣ ��Ī ���α׷�
 */

@FunctionalInterface
interface LambdaLuckyNum{
	public boolean myMatch(int a);
}

public class LuckyNum {
	
	final static int todayLuckyNum = 10;
	
	public static Boolean isLuckyNum(int num1) {
		Boolean result = false;
		
		if(num1 == todayLuckyNum) {
			result = true;
		}
		return result;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("�� �� �� ȣ �� �� �� �� �� ��.");
		Scanner userInpuf = new Scanner(System.in);
		int inputNum = userInpuf.nextInt();
		
		System.out.print("����������ȣ ��÷ ��(A)������ ");
		// ����ȣ ��õ ���1(�޼���)		
		if(isLuckyNum(inputNum)) {
			System.out.println("�����մϴ�. ����ȣ�� ��÷�Ǽ̽��ϴ�.");
		}else {
			System.out.println("�ƽ����ϴ�. ���� ��ȸ�� �븮����.");
		}

		System.out.println();
		

		System.out.print("����������ȣ ��÷ ��(B)������ ");
		// ����ȣ ��õ ���2(�Լ��� �������̽��� ���ٽ� ���)		
		LambdaLuckyNum isLuckyNum2 = (x) -> { return x==todayLuckyNum; }; /*{ if(x==10) return true; else return false; };*/
		if (isLuckyNum2.myMatch(inputNum)) {
			System.out.println("�����մϴ�. ����ȣ�� ��÷�Ǽ̽��ϴ�.");
		}else {
			System.out.println("�ƽ����ϴ�. ���� ��ȸ�� �븮����.");
		}
		
		System.out.println();

		System.out.print("����������ȣ ��õ ��(C)������ ");
		// ����ȣ ��÷ ���3(java.util.function�� Predicate �������̽� ���)		
		Predicate<Integer> isLuckyNum3 = s -> s==todayLuckyNum;
		
		if(isLuckyNum3.test(10)) {
			System.out.println("�����մϴ�. ����ȣ�� ��÷�Ǽ̽��ϴ�.");
		}else {
			System.out.println("�ƽ����ϴ�. ���� ��ȸ�� �븮����.");
		}
		
//		Predicate<?> isLuckyNum66 = (Integer s) -> Integer.parseInt(s.toString()) == todayLuckyNum;
//		isLuckyNum66.test(new Integer(1));
		
	}

}
