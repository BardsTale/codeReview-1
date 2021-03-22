package lambda.basic;

import java.util.Arrays;
import java.util.List;

public class Lambda03 {

    public static void main(String[] args) {

        List<Integer> countArray = Arrays.asList(1,2,3,4,5,6,7);

        //�������
        for(Integer count :countArray ) {
            System.out.println(count);
        }

        System.out.println("------");
        
        //���ٹ��
        countArray.forEach(count->{
            System.out.println(count);
        });
    }
}
