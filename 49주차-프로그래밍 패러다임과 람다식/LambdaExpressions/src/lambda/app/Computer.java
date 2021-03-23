package lambda.app;

//�������̽�
interface Goods {
	public void getPrice(int a);
}

public class Computer implements Goods{
	// �������̽� ����
	@Override
	public void getPrice(int a) {
		// TODO Auto-generated method stub
		System.out.println("��ǻ���� ������ " +  a + "�޷� �Դϴ�.");
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub	
		
		// �������̵� �޼��� ���
		Computer com = new Computer();
		com.getPrice(10);
		
		System.out.println("-----------------");
		
		// �͸�ü ����
		Goods com2 = new Goods() {
			public void getPrice(int a) {
				System.out.println("������ " +  a + "�޷� �Դϴ�.");
			}
		};
		com2.getPrice(10);
		
		Goods com3 = new Goods() {
			public void getPrice(int a) {
				System.out.println("The Price is " +  a + "$");
			}
		};
		com3.getPrice(10);		
		
		System.out.println("-----------------");
		
		// ���ٽ� ���
		Goods com4 = (a) -> System.out.println("������ " +  a + "�޷� �Դϴ�.");
		com4.getPrice(10);
		
		Goods com5 = (a) -> System.out.println("The Price is " +  a + "$");
		com5.getPrice(10);		
	}
}
