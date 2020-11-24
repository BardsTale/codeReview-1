function formEncrypt(USERID, PASSWD, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
	//RSAKey ��ü �߱�
	var rsa = new RSAKey();
	rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent);
    
	// �����ID�� ��й�ȣ�� RSA�� ��ȣȭ
	var securedUSERID = rsa.encrypt(USERID);
	var securedPASSWD = rsa.encrypt(PASSWD);

	// POST �α��� ���� ���� ����
	var securedLoginForm = document.getElementById("login_form");
	securedLoginForm.securedUSERID.value = securedUSERID;
	securedLoginForm.securedPASSWD.value = securedPASSWD;
}