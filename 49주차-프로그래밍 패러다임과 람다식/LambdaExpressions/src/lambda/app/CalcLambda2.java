package lambda.app;

/**
 * ������ ���ڸ� �ٷ� �� �ִ� ���Ⱑ �ִ�.
 * exec �޼��带 ����Ͽ� ������ ������ ���ϱ�, ����, ���ϱ�, �����Ⱚ�� ���϶�
 */

interface FixedCalc {
	public int cal(int a, int b);
}

public class CalcLambda2 {
	// ���ٽ� ���� (�Ű����� ���)->{���๮}
	public static void exec(FixedCalc fixCal) {
		int k = 12;
		int m = 4;
		int value = fixCal.cal(k, m);
		System.out.println(value);
	}

	public static void main(String[] args) {
		exec( new FixedCalc() {
			public int cal(int a, int b) {
				// TODO Auto-generated method stub
				return a+b;
			}
		});
		
		exec((i, j) -> {
			return i + j;
		});
		exec((i, j) -> {
			return i - j;
		});	
		exec((i, j) -> {
			return i * j;
		});
		exec((i, j) -> {
			return i / j;
		});		
	}
}