

-- �������� ����
WITH 
ACDMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.ACDEXT, B.ACDNAM, B.ADRCRD, B.ACDGBN                                                                                                                     
       , B.INPGBN, B.DELDAT, B.DISPGB, B.ACDEX1, B.ACDEX2, B.ACDEX3                                                                                                                               
       , B.ACDEX4, B.ACDEX5
        FROM ODDVER A
        LEFT JOIN ACDMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'ACDMST'
)
-- ��ǰ������ ����                                                        			                                                                                                    
,JEPMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.JPCODE, B.JPNAME, B.NORMCD, B.ITMGBN                                                                                                                    
        , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
        , B.MANGER, B.JEPGB1, B.JEPGB2, B.JEPGB3, B.YAKKOR                                                                                                                              
        , B.JPNENG, B.YAKENG, B.OPTGBN, B.SETGBN, B.MDLGBN                                                                                                                              
        , B.MDLNAM, B.PUMNAM, B.BOMGBN, B.PROGBN, B.LOTGBN                                                                                                                              
        , B.SILGBN, B.CSTNAM, B.BUGAGB, B.COSTGB, B.CTBUGB                                                                                                                              
        , B.FILEGB, B.HANSAN, B.OUTGBN, B.PRODGB, B.PRODSP                                                                                                                              
        , B.REMARK   
        FROM ODDVER A
        LEFT JOIN JEPMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'JEPMST'
)  
-- ���縶���� ����                                                                                                                                                                    
,MATMST_VER AS (
      SELECT A.ODDGBN, B.VERNAM, B.MATCOD, B.MATNAM, B.NORMCD, B.ITMGBN                                                                                                                    
           , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
           , B.MANGER, B.MAKERS, B.MODELS, B.MAJNAM, B.MATGB1                                                                                                                              
           , B.MATGB2, B.MATGB3, B.YAKKOR, B.MAPENG, B.YAKENG                                                                                                                              
           , B.OUTGBN, B.PRODGB, B.PRODSP, B.LOTGBN, B.SILGBN                                                                                                                              
           , B.CSTNAM, B.BUGAGB, B.CTBUGB, B.FILEGB, B.REMARK                                                                                                                               
        FROM ODDVER A
        LEFT JOIN MATMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'MATMST'
)
-- Ȱ������ ����                                                                                                                                                                      
,BUSMST_VER AS (
      SELECT A.ODDGBN,B.VERNAM, B.BUSNAM, B.BUSSEQ, B.RSPBUS                                                                                                                              
           , B.BUSTYP, B.MNYGBN, B.REMARK, B.AREANM
        FROM ODDVER A
        LEFT JOIN BUSMST B
          ON A.PRGVER = B.VERNAM
       WHERE A.ODDGBN IN ('44P','44S')
         AND A.PRGNAM = 'BUSMST'
)
-- ���� ���̺�
,MECHUL_TABLE_WITH AS (
     SELECT A.ODDGBN , SUM(A.KORAMT) AMOUNT , B.JEPGB1 , A.MAEMON
          , MAX(C.MATGB1) MATGB1 , MAX(D.AREANM) AREANM 
       FROM MAECUL A                                                                                                                                                              
       LEFT JOIN JEPMST_VER B ON A.JPCODE = B.JPCODE AND A.ODDGBN = B.ODDGBN                                                                                                                                                   
       LEFT JOIN MATMST_VER C ON A.JPCODE = C.MATCOD AND A.ODDGBN = C.ODDGBN                                                                                                                                                   
       LEFT JOIN BUSMST_VER D ON A.DEPTNM = D.BUSNAM AND A.ODDGBN = D.ODDGBN    
      WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
        AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
        AND D.AREANM IN ('ĥ������')
      GROUP BY A.MAEMON , A.ODDGBN , B.JEPGB1
)
-- ���� ���̺�
,RAWMAT_TABLE_WITH AS (
       SELECT  A.ODDGBN , MAX(A.RSTPLN) RSTPLN , A.MAEMON, MAX(A.DEPTNM) , MAX(A.JPCODE) JPCODE , SUM(A.AMOUNT) AMOUNT 	    			 					    
         FROM ( SELECT ODDGBN, RSTPLN, DATMON MAEMON, DEPTNM, JPCODE, AMOUNT                                                                                                         
                  FROM RAWMAT                                                                                                                                                        
                 UNION ALL                                                                                                                                                           
                SELECT ODDGBN, RSTPLN, DATMON, DEPTNM, JPCODE, AMOUNT                                                                                                                
                  FROM SUBMAT ) A                                                                                                                                                    
         LEFT JOIN BUSMST_VER B                                                                                                                                                      
           ON A.DEPTNM = B.BUSNAM                                                                                                                                                    
          AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
        WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
          AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	      AND B.AREANM IN ('ĥ������') 	
        GROUP BY A.MAEMON , A.ODDGBN
)
-- ������ ���̺� (������+�빫��+�������)                                                                                                             
 , FIX_NMB_JJB_TABLE_WITH AS(
      SELECT A.ODDGBN , A.DATMON MAEMON , MAX(A.BUSNAM) BUSNAM , A.ACDEXT , SUM(A.CHAAMT+A.DAEAMT) AMOUNT  
        FROM (SELECT A.ODDGBN , A.DATMON , A.BUSNAM , A.ACDEXT , A.CHAAMT , A.DAEAMT  		 
                FROM FIXAMT A                                                                    
                LEFT OUTER JOIN ODDCOD B                                                         
                  ON A.ODDGBN = B.ODDGBN                                                         
               WHERE B.RSTPLN = 'PLN'  -- ��ȹ�� FIXAMT ���̺��� �ݾ��� ��� ���.                                                           
               UNION ALL                                                                    	 
              SELECT C.ODDGBN , C.DATMON , C.BUSNAM , C.ACDEXT , C.CHAAMT , C.DAEAMT 			 
                FROM FIXAMT C                                                                    
                LEFT OUTER JOIN ODDCOD D                                                         
                  ON C.ODDGBN = D.ODDGBN                                                         
               WHERE D.RSTPLN = 'RST'  -- ������ FIXAMT ���̺� , �빫�� ���̺� , ������� ���̺��� �ݾ��� ��� ����Ѵ�.                                                           
                 AND C.ACDEXT NOT BETWEEN 5240000 AND 6099999                                    
               UNION ALL                                                                    	 
              SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT		 		 
                FROM NMBAMT                                                                 	 
               UNION ALL                                                                    	 
              SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT         	 
                FROM JJBAMT ) A
        LEFT JOIN BUSMST_VER B                                                                                                                                                      
          ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
         AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	     AND B.AREANM IN ('ĥ������')
       GROUP BY A.DATMON , A.ACDEXT , A.ODDGBN
)
-- �ΰǺ� ���̺� 
, MANAMT_TABLE_WITH AS(
      SELECT A.ODDGBN , A.DATMON MAEMON, MAX(A.BUSNAM) BUSNAM , B.ACDEXT, SUM(A.CHAAMT + A.DAEAMT) AMOUNT                 										    	                                    
        FROM MANAMT A                                                                    										    	                                    
        LEFT JOIN ACDMST_VER B                                                           										    	                                    
          ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
         AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
         AND B.DISPGB = 'true'  
        LEFT JOIN BUSMST_VER C                                                                                                                                                      
          ON A.BUSNAM = C.BUSNAM                                                                                                                                                    
         AND A.ODDGBN = C.ODDGBN                                                                                                                                                    
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	     AND C.AREANM IN ('ĥ������')  
       GROUP BY A.DATMON , B.ACDEXT , A.ODDGBN
)
-- ��ݺ�(MOVAMT) , �����(EXPAMT) , ����(JNKAMT) , ��⹰(WSTAMT) ���̺�
, MOV_EXP_JNK_WST_TABLE_WITH AS(
         SELECT A.ODDGBN , A.DATMON MAEMON, MAX(B.BUSNAM) BUSNAM , A.ACDEXT, SUM(A.CHAAMT+A.DAEAMT) AMOUNT
        FROM (    SELECT ODDGBN, DATMON, DEPTNM, '8260702' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM MOVAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8260702'	                                         											                                            
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8263502' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM EXPAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8263502'                                          											                                                
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8262906' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM JNKAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8262906'                                          											                                                
                   UNION ALL                                                                           											                                                
                  SELECT ODDGBN, DATMON, DEPTNM, '8261703' ACDEXT, SUM(AMOUNT) CHAAMT , SUM(0) DAEAMT                       											                                                
                    FROM WSTAMT                                                                        											                                                
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8261703'
             ) A      
        LEFT JOIN BUSMST_VER B                                                                                                                                                              
          ON A.DEPTNM = B.BUSNAM                                                                                                                                                            
         AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
       WHERE A.ODDGBN IN ('44P','44S')							                                     						                                                
         AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
         AND B.AREANM IN ('ĥ������')  
       GROUP BY A.DATMON , A.ACDEXT , A.ODDGBN
)

-- ��ǰ
, ITEM_JEP_WITH AS(
           SELECT ODDGBN , AMOUNT , JEPGB1 , MAEMON                                                        
             FROM MECHUL_TABLE_WITH       
            WHERE JEPGB1 = '��ǰ'
)
-- ��ǰ
, ITEM_SANG_WITH AS(
      SELECT ODDGBN , AMOUNT , JEPGB1 , MAEMON                                                    
        FROM MECHUL_TABLE_WITH       
       WHERE JEPGB1 = '��ǰ'
)
-- ���� ����
, SALES_COST_WITH AS(
      SELECT ODDGBN , SUM(AMOUNT) AMOUNT , MAEMON  	    			 					    
        FROM RAWMAT_TABLE_WITH
       GROUP BY MAEMON , ODDGBN  
       UNION ALL                                                                                                                                                                    
      SELECT ODDGBN , SUM(AMOUNT) AMOUNT , MAEMON                                 
        FROM FIX_NMB_JJB_TABLE_WITH
       WHERE ACDEXT BETWEEN 5240000 AND 6099999
       GROUP BY MAEMON , ODDGBN
)
-- ������������
, GROSS_MARGIN_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '����' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM MECHUL_TABLE_WITH 
                 UNION ALL
                SELECT '����' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM SALES_COST_WITH
             )
       GROUP BY VALGBN , MAEMON    
)
-- �Ϲ� ������ 
, MAINTENANCE_COST_WITH AS(
      SELECT ODDGBN , AMOUNT , MAEMON 
        FROM ( SELECT ODDGBN , MAEMON , BUSNAM , ACDEXT , AMOUNT
                 FROM FIX_NMB_JJB_TABLE_WITH 
                UNION ALL
               SELECT ODDGBN, MAEMON , BUSNAM, ACDEXT, AMOUNT
                 FROM MANAMT_TABLE_WITH
                WHERE ACDEXT BETWEEN 5240000 AND 6099999  
                UNION ALL
               SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT
                 FROM MOV_EXP_JNK_WST_TABLE_WITH 
             )
       WHERE ACDEXT BETWEEN 8000000 AND 9999999   
)
-- �� �� �� �� ��
, BUSINESS_PROFITS_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '����' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM GROSS_MARGIN_WITH 
                 UNION ALL
                SELECT '����' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM MAINTENANCE_COST_WITH
             )
       GROUP BY VALGBN , MAEMON  
)
-- 4. �� �� �� �� ��  
, NON_OPERATING_INCOME_WITH AS(
  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                            
    FROM (  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                                                                                                                         
              FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                                 
             UNION ALL                                                                        										    	                                            
            SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                  										    	                                            
              FROM MANAMT_TABLE_WITH                                                                     										    	                                                           											                                                                                        
         )                        											                                                                                                                                                                                                                                                                 
   WHERE ACDEXT BETWEEN 6100000 AND 6199999  
)
-- 5. �� �� �� �� ��   
, NON_OPERATING_EXPENSES_WITH AS(
  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                            
    FROM (  SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                                                                                                                         
              FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                                 
             UNION ALL                                                                        										    	                                            
            SELECT ODDGBN, MAEMON, BUSNAM, ACDEXT, AMOUNT                  										    	                                            
              FROM MANAMT_TABLE_WITH                                                                     										    	                                                           											                                                                                        
         )                        											                                                                                                                                                                                                                                                                 
   WHERE ACDEXT BETWEEN 6200000 AND 7999999  
)
-- �� �� �� �� ��   
, ORDINARY_PROFIT_WITH AS(
      SELECT VALGBN , MAX(ODDGBN) ODDGBN , MAEMON , SUM(AMOUNT) AMOUNT  
        FROM (  SELECT '����' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM BUSINESS_PROFITS_WITH 
                 UNION ALL
                SELECT '����' VALGBN, MAEMON , ODDGBN , AMOUNT
                  FROM NON_OPERATING_INCOME_WITH
                 UNION ALL
                SELECT '����' VALGBN, MAEMON , ODDGBN , (-AMOUNT) AMOUNT
                  FROM NON_OPERATING_EXPENSES_WITH  
             )
       GROUP BY VALGBN , MAEMON  
)













-- �����
      SELECT '1. �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                               
        FROM MECHUL_TABLE_WITH  
       UNION ALL       
-- ��ǰ 
      SELECT '����ǰ' VALGBN2 , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1 , SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ITEM_JEP_WITH
        GROUP BY JEPGB1
       UNION ALL
-- ��ǰ
      SELECT '����ǰ' VALGBN2 , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1 , SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ITEM_SANG_WITH
       GROUP BY JEPGB1  
       UNION ALL      
-- �������          
      SELECT '2. �� �� �� ��' VALGBN , SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM SALES_COST_WITH 
       UNION ALL       
-- ����                                                                                                                                                                           
      SELECT '������' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2  	    			 					        
        FROM RAWMAT_TABLE_WITH	
       UNION ALL  
-- �빫��
      SELECT '���빫��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                    
        FROM FIX_NMB_JJB_TABLE_WITH                      											                                                                                    				                                                                                                                                                          
       WHERE ACDEXT BETWEEN 5240000 AND 5259999   
       UNION ALL    
-- �������
      SELECT '���������' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2                                  
        FROM FIX_NMB_JJB_TABLE_WITH                                                                                                                                                        
       WHERE ACDEXT BETWEEN 5260000 AND 6099999                                                                                                                                             	
       UNION ALL
-- ������������
      SELECT '�� �� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT
        FROM GROSS_MARGIN_WITH
       GROUP BY VALGBN
       UNION ALL    
-- �Ϲݰ�����
      SELECT '3. �� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM MAINTENANCE_COST_WITH
       UNION ALL        
-- ����������
      SELECT '�� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM BUSINESS_PROFITS_WITH
       UNION ALL          
-- 4. �� �� �� �� ��
      SELECT '4. �� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2       
        FROM NON_OPERATING_INCOME_WITH
       UNION ALL        
-- 5. �� �� �� �� ��  
      SELECT '5. �� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2       
        FROM NON_OPERATING_EXPENSES_WITH
       UNION ALL        
-- �� �������
      SELECT '�� �� �� �� ��' VALGBN, SUM(DECODE(ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(ODDGBN,'44S',AMOUNT,0)) ODDAMT2
        FROM ORDINARY_PROFIT_WITH







        
        
        
        
        
                                                                                                                                                             
