import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

public class LoginKeygen {
	//�������� �� Ű�� �޼ҵ�
	public void keygen_proc() throws Exception{
		//AOP���� ���� ����
		ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpSession session = attr.getRequest().getSession();
		
		//���ǿ� ������ RSAŰ ���� ��� �ϴ� �����ϰ� ����.
		session.removeAttribute("__rsaPrivateKey__");
		
		//RSA Ű ����
		KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
		generator.initialize(1024);
		
		//key pair ����
		KeyPair keyPair = generator.genKeyPair();
		
		//key pair�� ����Ű �����Ű�� ���� ����.
		PublicKey publicKey = keyPair.getPublic();
		PrivateKey privateKey = keyPair.getPrivate();
		
		//Key <-> KeySpec ��ü�� ��ȣ ��ȯ�ϴ� Ű���丮 ����
		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
		
		
		// ���ǿ� ����Ű�� ���ڿ��� Ű���Ͽ� ����Ű�� �����Ѵ�.
		session.setAttribute("__rsaPrivateKey__", privateKey);
		
		// ����Ű�� ���ڿ��� ��ȯ�Ͽ� Ű���丮�� ���� JavaScript RSA ���̺귯�� �Ѱ��ش�.
		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
		
		session.setAttribute("publicKeyModulus", publicKeyModulus);
		session.setAttribute("publicKeyExponent", publicKeyExponent);
	}
}
