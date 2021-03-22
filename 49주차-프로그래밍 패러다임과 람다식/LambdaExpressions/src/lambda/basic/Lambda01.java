package lambda.basic;

@FunctionalInterface //�Լ��� �������̽� üũ ������̼�
interface getPrintRansdomService {
	public void getPrint();	
}

public class Lambda01 {
	static void getPrintRandomNum1() {
		System.out.println("���� ��(0~9, �⺻) : " + (int)(Math.random()*10));
	}
	static void getPrintRandomNum2() {
		System.out.println("���� ��(0~99, �⺻): " + (int)(Math.random()*100));
	}
	static void getPrintRandomNum3() {
		System.out.println("���� ��(0~999, �⺻): " + (int)(Math.random()*1000));
	}	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		// ������ ���(�⺻)
		getPrintRandomNum1();		
		getPrintRandomNum2();
		getPrintRandomNum3();

		// ������ ���(����)
//		getPrintRansdomService getPrintRandomService1 = () -> { System.out.println("���� ��(����) : " + (int)(Math.random()*10)); };
		getPrintRansdomService getPrintRandomService1 = () -> { System.out.println("���� ��(0~9, ����) : " + (int)(Math.random()* 10));  };		
		getPrintRansdomService getPrintRandomService2 = () -> { System.out.println("���� ��(0~99, ����) : " + (int)(Math.random()*100)); };
		getPrintRansdomService getPrintRandomService3 = () -> { System.out.println("���� ��(0~999, ����) : " + (int)(Math.random()*100)); };
		getPrintRandomService1.getPrint();
		getPrintRandomService2.getPrint();
		getPrintRandomService3.getPrint();
	}
}
