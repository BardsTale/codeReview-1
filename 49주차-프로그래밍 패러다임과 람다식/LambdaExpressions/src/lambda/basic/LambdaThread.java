package lambda.basic;

public class LambdaThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new Thread(new Runnable() {
			public void run() {
				System.out.println("�������� ����� ��ȸ�� ������ ����");
			}
		}).start();
		
		new Thread(()->{
			System.out.println("���� ǥ������ ����� ��ȸ�� ������ ����");
		}).start();
	}
}
