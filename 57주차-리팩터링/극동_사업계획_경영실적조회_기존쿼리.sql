
-- �������� ����                                                                                                                                                                        
    WITH ACDMST_VER AS (                                                                                                                                                                
  SELECT A.ODDGBN, B.VERNAM, B.ACDEXT, B.ACDNAM, B.ADRCRD, B.ACDGBN                                                                                                                     
       , B.INPGBN, B.DELDAT, B.INPDAT, B.INPSBN, B.UPTDAT                                                                                                                               
       , B.UPTSBN, B.DISPGB, B.ACDEX1, B.ACDEX2, B.ACDEX3                                                                                                                               
       , B.ACDEX4, B.ACDEX5                                                                                                                                                             
    FROM ODDCOD A                                                                                                                                                                       
    JOIN (SELECT A.ODDGBN, B.VERNAM, B.ACDEXT, B.ACDNAM, B.ADRCRD, B.ACDGBN                                                                                                             
               , B.INPGBN, B.DELDAT, B.INPDAT, B.INPSBN, B.UPTDAT                                                                                                                       
               , B.UPTSBN, B.DISPGB, B.ACDEX1, B.ACDEX2, B.ACDEX3                                                                                                                       
               , B.ACDEX4, B.ACDEX5                                                                                                                                                     
            FROM ODDVER A                                                                                                                                                               
            JOIN ACDMST B                                                                                                                                                               
              ON A.PRGVER = B.VERNAM                                                                                                                                                    
             AND A.PRGNAM = 'ACDMST') B                                                                                                                                                 
     ON A.ODDGBN = B.ODDGBN )                                                                                                                                                           
 -- ��ǰ������ ����                                                        			                                                                                                    
        , JEPMST_VER AS (                                                                                                                                                               
   SELECT A.ODDGBN, B.VERNAM, B.JPCODE, B.JPNAME, B.NORMCD, B.ITMGBN                                                                                                                    
        , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
        , B.MANGER, B.JEPGB1, B.JEPGB2, B.JEPGB3, B.YAKKOR                                                                                                                              
        , B.JPNENG, B.YAKENG, B.OPTGBN, B.SETGBN, B.MDLGBN                                                                                                                              
        , B.MDLNAM, B.PUMNAM, B.BOMGBN, B.PROGBN, B.LOTGBN                                                                                                                              
        , B.SILGBN, B.CSTNAM, B.BUGAGB, B.COSTGB, B.CTBUGB                                                                                                                              
        , B.FILEGB, B.HANSAN, B.OUTGBN, B.PRODGB, B.PRODSP                                                                                                                              
        , B.REMARK, B.INPDAT, B.INPSBN, B.UPTDAT, B.UPTSBN                                                                                                                              
     FROM ODDCOD A                                                                                                                                                                      
     JOIN (SELECT A.ODDGBN, B.VERNAM, B.JPCODE, B.JPNAME, B.NORMCD, B.ITMGBN                                                                                                            
                , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                      
                , B.MANGER, B.JEPGB1, B.JEPGB2, B.JEPGB3, B.YAKKOR                                                                                                                      
                , B.JPNENG, B.YAKENG, B.OPTGBN, B.SETGBN, B.MDLGBN                                                                                                                      
                , B.MDLNAM, B.PUMNAM, B.BOMGBN, B.PROGBN, B.LOTGBN                                                                                                                      
                , B.SILGBN, B.CSTNAM, B.BUGAGB, B.COSTGB, B.CTBUGB                                                                                                                      
                , B.FILEGB, B.HANSAN, B.OUTGBN, B.PRODGB, B.PRODSP                                                                                                                      
                , B.REMARK, B.INPDAT, B.INPSBN, B.UPTDAT, B.UPTSBN                                                                                                                      
             FROM ODDVER A                                                                                                                                                              
             JOIN JEPMST B                                                                                                                                                              
               ON A.PRGVER = B.VERNAM                                                                                                                                                   
              AND A.PRGNAM = 'JEPMST') B                                                                                                                                                
      ON A.ODDGBN = B.ODDGBN )                                                                                                                                                          
  -- ���縶���� ����                                                                                                                                                                    
        , MATMST_VER AS (                                                                                                                                                               
   SELECT A.ODDGBN, B.VERNAM, B.MATCOD, B.MATNAM, B.NORMCD, B.ITMGBN                                                                                                                    
        , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                              
        , B.MANGER, B.MAKERS, B.MODELS, B.MAJNAM, B.MATGB1                                                                                                                              
        , B.MATGB2, B.MATGB3, B.YAKKOR, B.MAPENG, B.YAKENG                                                                                                                              
        , B.OUTGBN, B.PRODGB, B.PRODSP, B.LOTGBN, B.SILGBN                                                                                                                              
        , B.CSTNAM, B.BUGAGB, B.CTBUGB, B.FILEGB, B.REMARK                                                                                                                              
        , B.INPDAT, B.INPSBN, B.UPTDAT, B.UPTSBN                                                                                                                                        
     FROM ODDCOD A                                                                                                                                                                      
     JOIN (SELECT A.ODDGBN, B.VERNAM, B.MATCOD, B.MATNAM, B.NORMCD, B.ITMGBN                                                                                                            
                , B.UNITCD, B.ITMCON, B.IOGUBN, B.IMPTNC, B.DEPTNM                                                                                                                      
                , B.MANGER, B.MAKERS, B.MODELS, B.MAJNAM, B.MATGB1                                                                                                                      
                , B.MATGB2, B.MATGB3, B.YAKKOR, B.MAPENG, B.YAKENG                                                                                                                      
                , B.OUTGBN, B.PRODGB, B.PRODSP, B.LOTGBN, B.SILGBN                                                                                                                      
                , B.CSTNAM, B.BUGAGB, B.CTBUGB, B.FILEGB, B.REMARK                                                                                                                      
                , B.INPDAT, B.INPSBN, B.UPTDAT, B.UPTSBN                                                                                                                                
             FROM ODDVER A                                                                                                                                                              
             JOIN MATMST B                                                                                                                                                              
               ON A.PRGVER = B.VERNAM                                                                                                                                                   
              AND A.PRGNAM = 'MATMST') B                                                                                                                                                
      ON A.ODDGBN = B.ODDGBN )                                                                                                                                                          
  -- Ȱ������ ����                                                                                                                                                                      
        , BUSMST_VER AS (                                                                                                                                                               
   SELECT A.ODDGBN, B.VERNAM, B.BUSNAM, B.BUSSEQ, B.RSPBUS                                                                                                                              
        , B.BUSTYP, B.MNYGBN, B.REMARK, B.AREANM, B.SAUPNM                                                                                                                              
        , B.ACUNIT, B.USEGBN, B.ENDDAT, B.INPDAT, B.INPSBN                                                                                                                              
        , B.UPTDAT, B.UPTSBN                                                                                                                                                            
     FROM ODDCOD A                                                                                                                                                                      
     JOIN (SELECT A.ODDGBN, B.VERNAM, B.BUSNAM, B.BUSSEQ, B.RSPBUS                                                                                                                      
                , B.BUSTYP, B.MNYGBN, B.REMARK, B.AREANM, B.SAUPNM                                                                                                                      
                , B.ACUNIT, B.USEGBN, B.ENDDAT, B.INPDAT, B.INPSBN                                                                                                                      
                , B.UPTDAT, B.UPTSBN                                                                                                                                                    
             FROM ODDVER A                                                                                                                                                              
             JOIN BUSMST B                                                                                                                                                              
               ON A.PRGVER = B.VERNAM                                                                                                                                                   
              AND A.PRGNAM = 'BUSMST') B                                                                                                                                                
      ON A.ODDGBN = B.ODDGBN )                                                                                                                                                          
-- ������ & �빫�� & �������                                                                                                             
 , FIXNMBJJB_VER AS(                                                                 
  SELECT A.ODDGBN , A.DATMON , A.BUSNAM , A.ACDEXT , A.CHAAMT , A.DAEAMT 			 
    FROM FIXAMT A                                                                    
    LEFT OUTER JOIN ODDCOD B                                                         
      ON A.ODDGBN = B.ODDGBN                                                         
   WHERE B.RSTPLN = 'PLN'                                                            
   UNION ALL                                                                    	 
  SELECT A.ODDGBN , A.DATMON , A.BUSNAM , A.ACDEXT , A.CHAAMT , A.DAEAMT 			 
    FROM FIXAMT A                                                                    
    LEFT OUTER JOIN ODDCOD B                                                         
      ON A.ODDGBN = B.ODDGBN                                                         
   WHERE B.RSTPLN = 'RST'                                                            
     AND A.ACDEXT NOT BETWEEN 5240000 AND 6099999                                    
   UNION ALL                                                                    	 
  SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT		 		 
    FROM NMBAMT                                                                 	 
   UNION ALL                                                                    	 
  SELECT ODDGBN, '0000-'||DATMON DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT         	 
    FROM JJBAMT                                                                 	 
  )                                                                                  
 -- ������                                                                                                                                                                              
  SELECT '1. �� �� ��' VALGBN, SUM(DECODE(A.ODDGBN,'44P',KORAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',KORAMT,0)) ODDAMT2                                               
    FROM MAECUL A                                                                                                                                                                       
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.DEPTNM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE A.ODDGBN IN ('44P','44S')							                                     						                                                
  	 AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                            
   UNION ALL                                                                                                                                                                            
  SELECT VALGBN2, ODDAMT1, ODDAMT2                                                                                                                                                      
    FROM ( SELECT '��'||DECODE(NVL(B.JEPGB1,''),'',C.MATGB1,B.JEPGB1) VALGBN2                                                                                                           
                , SUM(DECODE(A.ODDGBN,'44P',A.KORAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',A.KORAMT,0)) ODDAMT2                                                        
             FROM MAECUL A                                                                                                                                                              
             LEFT JOIN JEPMST_VER B                                                                                                                                                     
               ON A.JPCODE = B.JPCODE                                                                                                                                                   
              AND A.ODDGBN = B.ODDGBN                                                                                                                                                   
             LEFT JOIN MATMST_VER C                                                                                                                                                     
               ON A.JPCODE = C.MATCOD                                                                                                                                                   
              AND A.ODDGBN = C.ODDGBN                                                                                                                                                   
             LEFT JOIN BUSMST_VER D                                                                                                                                                     
               ON A.DEPTNM = D.BUSNAM                                                                                                                                                   
              AND A.ODDGBN = D.ODDGBN                                                                                                                                                   
              LEFT JOIN CODMST E                                                                                                                                                        
                ON E.CMTPCD = 'JGL'                                                                                                                                                     
               AND B.JEPGB1 = E.CMDTCD                                                                                                                                                  
              LEFT JOIN CODMST F                                                                                                                                                        
                ON F.CMTPCD = 'JGL'                                                                                                                                                     
               AND C.MATGB1 = F.CMDTCD                                                                                                                                                  
            WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
           	   AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
               AND D.AREANM IN ('ĥ������') 																										                                    
             GROUP BY DECODE(NVL(E.CODSEQ,''),'',F.CODSEQ,E.CODSEQ), DECODE(NVL(B.JEPGB1,''),'',C.MATGB1,B.JEPGB1)                                                                      
             ORDER BY DECODE(NVL(E.CODSEQ,''),'',F.CODSEQ,E.CODSEQ) ) A                                                                                                                 
   UNION ALL                                                                                                                                                                            
  SELECT '2. �� �� �� ��' VALGBN, SUM(ODDAMT1) ODDAMT1, SUM(ODDAMT2) ODDAMT2                                                                                                            
    FROM (SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',AMOUNT,0)) ODDAMT2  	    			 					    
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
           UNION ALL                                                                                                                                                                    
          SELECT '������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                              
            FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                 
                    FROM FIXNMBJJB_VER                       											                                                                                    	
                   UNION ALL                                                                        										    	                                    
                  SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                    
                    FROM MANAMT A                                                                    										    	                                    
                    LEFT JOIN ACDMST_VER B                                                           										    	                                    
                      ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
                     AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
                     AND B.DISPGB = 'true'                  											                                                                                
                 ) A                       											                                                                                    				
            LEFT JOIN BUSMST_VER B                                                                                                                                                      
              ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
             AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
           WHERE ACDEXT BETWEEN 5240000 AND 6099999                                                                                                                                     
             AND A.ODDGBN IN ('44P','44S')							                                     						                                        
             AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	         AND B.AREANM IN ('ĥ������') 																										                                    
         ) A                                                                                                                                 											
   UNION ALL                                                                                                                                                                            
  SELECT '������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',AMOUNT,0)) ODDAMT2  	    			 					        
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
   UNION ALL                                                                                                                                                                            
  SELECT '���빫��' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                                    
    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                         
            FROM FIXNMBJJB_VER                                                                                                                                                                 
           UNION ALL                                                                        										    	                                            
          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                            
            FROM MANAMT A                                                                    										    	                                            
            LEFT JOIN ACDMST_VER B                                                           										    	                                            
              ON B.ACDNAM = A.ACDEXT                                                         										    	                                            
             AND B.ODDGBN = A.ODDGBN                                                         										    	                                            
             AND B.DISPGB = 'true'                  											                                                                                        
         ) A                       											                                                                                    				        
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.BUSNAM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE ACDEXT BETWEEN 5240000 AND 5259999                                                                                                                                             
     AND A.ODDGBN IN ('44P','44S')							                                     						                                                
     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                            
   UNION ALL                                                                                                                                                                            
  SELECT '���������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                                  
    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                         
            FROM FIXNMBJJB_VER                                                                                                                                                                 
           UNION ALL                                                                        										    	                                            
          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                            
            FROM MANAMT A                                                                    										    	                                            
            LEFT JOIN ACDMST_VER B                                                           										    	                                            
              ON B.ACDNAM = A.ACDEXT                                                         										    	                                            
             AND B.ODDGBN = A.ODDGBN                                                         										    	                                            
             AND B.DISPGB = 'true'                  											                                                                                        
          ) A                       											                                                                                                        
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.BUSNAM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE ACDEXT BETWEEN 5260000 AND 6099999                                                                                                                                             
     AND A.ODDGBN IN ('44P','44S')							                                     						                                                
     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                        	
   UNION ALL                                                                                                                                                                            
  SELECT '�� �� �� �� �� ��' VALGBN, SUM(ODDAMT1_1-ODDAMT2_1) ODDAMT1, SUM(ODDAMT1_2-ODDAMT2_2) ODDAMT2                                                                                 
    FROM ( SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',KORAMT,0)) ODDAMT1_1, SUM(DECODE(A.ODDGBN,'44S',KORAMT,0)) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2               
             FROM MAECUL A                                                                                                                                                              
             LEFT JOIN BUSMST_VER B                                                                                                                                                     
               ON A.DEPTNM = B.BUSNAM                                                                                                                                                   
              AND A.ODDGBN = B.ODDGBN                                                                                                                                                   
            WHERE A.ODDGBN IN ('44P','44S')							                                     						                                        
              AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	          AND B.AREANM IN ('ĥ������') 																										                                    
            UNION ALL                                                                                                                                                                   
           SELECT '����' VALGBN, 0, 0, SUM(ODDAMT1), SUM(ODDAMT2)                                                                                                                       
             FROM ( SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',AMOUNT,0)) ODDAMT2 	    			 				
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
                     UNION ALL                                                                                                                                                          
                    SELECT '������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                    
                      FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                       
                              FROM FIXNMBJJB_VER                                                                                                                                               
                             UNION ALL                                                                        										    	                            
                            SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                            
                              FROM MANAMT A                                                                    										    	                            
                              LEFT JOIN ACDMST_VER B                                                           										    	                            
                                ON B.ACDNAM = A.ACDEXT                                                         										    	                            
                               AND B.ODDGBN = A.ODDGBN                                                         										    	                            
                               AND B.DISPGB = 'true'                  											                                                                        
                            ) A                       											                                                                                        
                      LEFT JOIN BUSMST_VER B                                                                                                                                            
                        ON A.BUSNAM = B.BUSNAM                                                                                                                                          
                       AND A.ODDGBN = B.ODDGBN                                                                                                                                          
                     WHERE ACDEXT BETWEEN 5240000 AND 6099999                                                                                                                           
                       AND A.ODDGBN IN ('44P','44S')							                                     						                            
                       AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                            
  	                   AND B.AREANM IN ('ĥ������') 																										                         	
                  ) A ) A                                                                                                                 												
   GROUP BY VALGBN                                                                                                                                                                      
   UNION ALL                                                                                                                                                                            
  SELECT '3. �� �� �� �� ��' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                           
    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                         
            FROM FIXNMBJJB_VER                                                                                                                                                                 
           UNION ALL                                                                        										    	                                            
          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                            
            FROM MANAMT A                                                                    										    	                                            
            LEFT JOIN ACDMST_VER B                                                           										    	                                            
              ON B.ACDNAM = A.ACDEXT                                                         										    	                                            
             AND B.ODDGBN = A.ODDGBN                                                         										    	                                            
             AND B.DISPGB = 'true'                  											                                                                                        
           UNION ALL                                                                           											                                                
          SELECT ODDGBN, DATMON, DEPTNM, '8260702', SUM(AMOUNT), SUM(0)                        											                                                
            FROM MOVAMT                                                                        											                                                
           GROUP BY ODDGBN, DATMON, DEPTNM, '8260702'	                                         											                                            
           UNION ALL                                                                           											                                                
          SELECT ODDGBN, DATMON, DEPTNM, '8263502', SUM(AMOUNT), SUM(0)                        											                                                
            FROM EXPAMT                                                                        											                                                
           GROUP BY ODDGBN, DATMON, DEPTNM, '8263502'                                          											                                                
           UNION ALL                                                                           											                                                
          SELECT ODDGBN, DATMON, DEPTNM, '8262906', SUM(AMOUNT), SUM(0)                        											                                                
            FROM JNKAMT                                                                        											                                                
           GROUP BY ODDGBN, DATMON, DEPTNM, '8262906'                                          											                                                
           UNION ALL                                                                           											                                                
          SELECT ODDGBN, DATMON, DEPTNM, '8261703', SUM(AMOUNT), SUM(0)                        											                                                
            FROM WSTAMT                                                                        											                                                
           GROUP BY ODDGBN, DATMON, DEPTNM, '8261703'	                     											                                                                
          ) A                       											                                                                                                        
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.BUSNAM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE ACDEXT BETWEEN 8000000 AND 9999999                                                                                                                                             
     AND A.ODDGBN IN ('44P','44S')							                                     						                                                
     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                            
   UNION ALL                                                                                                                                                                            
  SELECT '�� �� �� �� ��' VALGBN, SUM(ODDAMT1_1-ODDAMT2_1) ODDAMT1, SUM(ODDAMT1_2-ODDAMT2_2) ODDAMT2                                                                                    
    FROM (SELECT '���' VALGBN, SUM(ODDAMT1_1-ODDAMT2_1) ODDAMT1_1, SUM(ODDAMT1_2-ODDAMT2_2) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2                                                        
            FROM ( SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',KORAMT,0)) ODDAMT1_1, SUM(DECODE(A.ODDGBN,'44S',KORAMT,0)) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2       
                     FROM MAECUL A                                                                                                                                                      
                     LEFT JOIN BUSMST_VER B                                                                                                                                             
                       ON A.DEPTNM = B.BUSNAM                                                                                                                                           
                      AND A.ODDGBN = B.ODDGBN                                                                                                                                           
                    WHERE A.ODDGBN IN ('44P','44S')							                                     						                                
                      AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                            
  	                  AND B.AREANM IN ('ĥ������') 																										                            
                    UNION ALL                                                                                                                                                           
                   SELECT '����' VALGBN, 0, 0, SUM(ODDAMT1), SUM(ODDAMT2)                                                                                                               
                     FROM ( SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',AMOUNT,0)) ODDAMT2 	    			 		
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
                             UNION ALL                                                                                                                                                  
                            SELECT '������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2            
                              FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                               
                                      FROM FIXNMBJJB_VER                                                                                                                                       
                                     UNION ALL                                                                        										    	                    
                                    SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                    
                                      FROM MANAMT A                                                                    										    	                    
                                      LEFT JOIN ACDMST_VER B                                                           										    	                    
                                        ON B.ACDNAM = A.ACDEXT                                                         										    	                    
                                       AND B.ODDGBN = A.ODDGBN                                                         										    	                    
                                       AND B.DISPGB = 'true'                  											                                                                
                                    ) A                       											                                                                                
                              LEFT JOIN BUSMST_VER B                                                                                                                                    
                                ON A.BUSNAM = B.BUSNAM                                                                                                                                  
                               AND A.ODDGBN = B.ODDGBN                                                                                                                                  
                             WHERE ACDEXT BETWEEN 5240000 AND 6099999                                                                                                          		    
                               AND A.ODDGBN IN ('44P','44S')							                                     						                    
                               AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                    
  	                           AND B.AREANM IN ('ĥ������') 																										                    
                           ) A ) A                                                                                                         												
           GROUP BY VALGBN                                                                                                                                                              
           UNION ALL                                                                                                                                                                    
          SELECT '���' VALGBN, 0, 0, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)), SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0))                                          
            FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                 
                    FROM FIXNMBJJB_VER                                                                                                                                                         
                   UNION ALL                                                                        										    	                                    
                  SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                    
                    FROM MANAMT A                                                                    										    	                                    
                    LEFT JOIN ACDMST_VER B                                                           										    	                                    
                      ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
                     AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
                     AND B.DISPGB = 'true'                  											                                                                                
                   UNION ALL                                                                           											                                        
                  SELECT ODDGBN, DATMON, DEPTNM, '8260702', SUM(AMOUNT), SUM(0)                        											                                        
                    FROM MOVAMT                                                                        											                                        
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8260702'	                                         											                                    
                   UNION ALL                                                                           											                                        
                  SELECT ODDGBN, DATMON, DEPTNM, '8263502', SUM(AMOUNT), SUM(0)                        											                                        
                    FROM EXPAMT                                                                        											                                        
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8263502'                                          											                                        
                   UNION ALL                                                                           											                                        
                  SELECT ODDGBN, DATMON, DEPTNM, '8262906', SUM(AMOUNT), SUM(0)                        											                                        
                    FROM JNKAMT                                                                        											                                        
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8262906'                                          											                                        
                   UNION ALL                                                                           											                                        
                  SELECT ODDGBN, DATMON, DEPTNM, '8261703', SUM(AMOUNT), SUM(0)                        											                                        
                    FROM WSTAMT                                                                        											                                        
                   GROUP BY ODDGBN, DATMON, DEPTNM, '8261703'	                     											                                                        
                  ) A                       											                                                                                                
            LEFT JOIN BUSMST_VER B                                                                                                                                                      
              ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
             AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
           WHERE ACDEXT BETWEEN 8000000 AND 9999999                                                                                                                                     
             AND A.ODDGBN IN ('44P','44S')							                                     						                                        
             AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	         AND B.AREANM IN ('ĥ������') 																										                                    
         ) A                                                                                                                                 											
   GROUP BY VALGBN                                                                                                                                                                      
   UNION ALL                                                                                                                                                                            
  SELECT '4. �� �� �� �� ��' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                           
    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                         
            FROM FIXNMBJJB_VER                                                                                                                                                                 
           UNION ALL                                                                        										    	                                            
          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                            
            FROM MANAMT A                                                                    										    	                                            
            LEFT JOIN ACDMST_VER B                                                           										    	                                            
              ON B.ACDNAM = A.ACDEXT                                                         										    	                                            
             AND B.ODDGBN = A.ODDGBN                                                         										    	                                            
             AND B.DISPGB = 'true'                  											                                                                                        
          ) A                       											                                                                                                        
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.BUSNAM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE ACDEXT BETWEEN 6100000 AND 6199999                                                                                                                                             
     AND A.ODDGBN IN ('44P','44S')							                                     						                                                
     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                            
   UNION ALL                                                                                                                                                                            
  SELECT '5. �� �� �� �� ��' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2                           
    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                         
            FROM FIXNMBJJB_VER                                                                                                                                                                 
           UNION ALL                                                                        										    	                                            
          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                            
            FROM MANAMT A                                                                    										    	                                            
            LEFT JOIN ACDMST_VER B                                                           										    	                                            
              ON B.ACDNAM = A.ACDEXT                                                         										    	                                            
             AND B.ODDGBN = A.ODDGBN                                                         										    	                                            
             AND B.DISPGB = 'true'                  											                                                                                        
          ) A                       											                                                                                                        
    LEFT JOIN BUSMST_VER B                                                                                                                                                              
      ON A.BUSNAM = B.BUSNAM                                                                                                                                                            
     AND A.ODDGBN = B.ODDGBN                                                                                                                                                            
   WHERE ACDEXT BETWEEN 6200000 AND 7999999                                                                                                                                             
     AND A.ODDGBN IN ('44P','44S')							                                     						                                                
     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                            
  	 AND B.AREANM IN ('ĥ������') 																										                                            
   UNION ALL                                                                                                                                                                            
  SELECT '�� �� �� �� ��' VALGBN, SUM(ODDAMT1_1+ODDAMT2_1-ODDAMT3_1) ODDAMT1, SUM(ODDAMT1_2+ODDAMT2_2-ODDAMT3_2) ODDAMT2                                                                
    FROM (SELECT '�ݾ�' VALGBN, SUM(ODDAMT1_1-ODDAMT2_1) ODDAMT1_1, SUM(ODDAMT1_2-ODDAMT2_2) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2, 0 ODDAMT3_1, 0 ODDAMT3_2                              
            FROM (SELECT '���' VALGBN, SUM(ODDAMT1_1-ODDAMT2_1) ODDAMT1_1, SUM(ODDAMT1_2-ODDAMT2_2) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2                                                
                    FROM (SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',KORAMT,0)) ODDAMT1_1, SUM(DECODE(A.ODDGBN,'44S',KORAMT,0)) ODDAMT1_2, 0 ODDAMT2_1, 0 ODDAMT2_2
                            FROM MAECUL A                                                                                                                                               
                            LEFT JOIN BUSMST_VER B                                                                                                                                      
                              ON A.DEPTNM = B.BUSNAM                                                                                                                                    
                             AND A.ODDGBN = B.ODDGBN                                                                                                                                    
                           WHERE A.ODDGBN IN ('44P','44S')							                                     						                        
                             AND SUBSTR(A.MAEMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                    
  	                         AND B.AREANM IN ('ĥ������') 																										                    
                           UNION ALL                                                                                                                                                    
                          SELECT '����' VALGBN, 0, 0, SUM(ODDAMT1), SUM(ODDAMT2)                                                                                                        
                            FROM (SELECT '����' VALGBN, SUM(DECODE(A.ODDGBN,'44P',AMOUNT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',AMOUNT,0)) ODDAMT2 	    			
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
                                   UNION ALL                                                                                                                                            
                                  SELECT '������' VALGBN, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)) ODDAMT1, SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)) ODDAMT2      
                                    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                         
                                            FROM FIXNMBJJB_VER                                                                                                                                 
                                           UNION ALL                                                                        										    	            
                                          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	            
                                            FROM MANAMT A                                                                    										    	            
                                            LEFT JOIN ACDMST_VER B                                                           										    	            
                                              ON B.ACDNAM = A.ACDEXT                                                         										    	            
                                             AND B.ODDGBN = A.ODDGBN                                                         										    	            
                                             AND B.DISPGB = 'true'                  											                                                        
                                          ) A                       											                                                                    	
                                    LEFT JOIN BUSMST_VER B                                                                                                                              
                                      ON A.BUSNAM = B.BUSNAM                                                                                                                            
                                     AND A.ODDGBN = B.ODDGBN                                                                                                                            
                                   WHERE ACDEXT BETWEEN 5240000 AND 6099999                                                                                                             
                                     AND A.ODDGBN IN ('44P','44S')							                                     						                
                                     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					            
  	                                 AND B.AREANM IN ('ĥ������') 																										            
                                 ) A ) A                                                                                                   												
                   GROUP BY VALGBN                                                                                                                                                      
                   UNION ALL                                                                                                                                                            
                  SELECT '���' VALGBN, 0, 0, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)), SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0))                                  
                    FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                         
                            FROM FIXNMBJJB_VER                                                                                                                                                 
                           UNION ALL                                                                        										    	                            
                          SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                            
                            FROM MANAMT A                                                                    										    	                            
                            LEFT JOIN ACDMST_VER B                                                           										    	                            
                              ON B.ACDNAM = A.ACDEXT                                                         										    	                            
                             AND B.ODDGBN = A.ODDGBN                                                         										    	                            
                             AND B.DISPGB = 'true'                  											                                                                        
                           UNION ALL                                                                           											                                
                          SELECT ODDGBN, DATMON, DEPTNM, '8260702', SUM(AMOUNT), SUM(0)                        											                                
                            FROM MOVAMT                                                                        											                                
                           GROUP BY ODDGBN, DATMON, DEPTNM, '8260702'	                                         											                            
                           UNION ALL                                                                           											                                
                          SELECT ODDGBN, DATMON, DEPTNM, '8263502', SUM(AMOUNT), SUM(0)                        											                                
                            FROM EXPAMT                                                                        											                                
                           GROUP BY ODDGBN, DATMON, DEPTNM, '8263502'                                          											                                
                           UNION ALL                                                                           											                                
                          SELECT ODDGBN, DATMON, DEPTNM, '8262906', SUM(AMOUNT), SUM(0)                        											                                
                            FROM JNKAMT                                                                        											                                
                           GROUP BY ODDGBN, DATMON, DEPTNM, '8262906'                                          											                                
                           UNION ALL                                                                           											                                
                          SELECT ODDGBN, DATMON, DEPTNM, '8261703', SUM(AMOUNT), SUM(0)                        											                                
                            FROM WSTAMT                                                                        											                                
                           GROUP BY ODDGBN, DATMON, DEPTNM, '8261703'	                     											                                                
                          ) A                       											                                                                                        
                    LEFT JOIN BUSMST_VER B                                                                                                                                              
                      ON A.BUSNAM = B.BUSNAM                                                                                                                                            
                     AND A.ODDGBN = B.ODDGBN                                                                                                                                            
                   WHERE ACDEXT BETWEEN 8000000 AND 9999999                                                                                                          					
                     AND A.ODDGBN IN ('44P','44S')							                                     						            					
                     AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					            				
  	                 AND B.AREANM IN ('ĥ������') 																										            				
                 ) A                                                                                                                         											
           GROUP BY VALGBN                                                                                                                                                              
           UNION ALL                                                                                                                                                                    
          SELECT '�ݾ�' VALGBN, 0, 0, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)), SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0)), 0, 0                                    
            FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                 
                    FROM FIXNMBJJB_VER                                                                                                                                                         
                   UNION ALL                                                                        										    	                                    
                  SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                    
                    FROM MANAMT A                                                                    										    	                                    
                    LEFT JOIN ACDMST_VER B                                                           										    	                                    
                      ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
                     AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
                     AND B.DISPGB = 'true'                  											                                                                                
                  ) A                       											                                                                                                
            LEFT JOIN BUSMST_VER B                                                                                                                                                      
              ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
             AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
           WHERE ACDEXT BETWEEN 6100000 AND 6199999                                                                                                                                     
             AND A.ODDGBN IN ('44P','44S')							                                     						                                        
             AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	         AND B.AREANM IN ('ĥ������') 																										                                    
           UNION ALL                                                                                                                                                                    
          SELECT '�ݾ�' VALGBN, 0, 0, 0, 0, SUM(DECODE(A.ODDGBN,'44P',CHAAMT+DAEAMT,0)), SUM(DECODE(A.ODDGBN,'44S',CHAAMT+DAEAMT,0))                                    
            FROM (SELECT ODDGBN, DATMON, BUSNAM, ACDEXT, CHAAMT, DAEAMT                                                                                                                 
                    FROM FIXNMBJJB_VER                                                                                                                                                         
                   UNION ALL                                                                        										    	                                    
                  SELECT A.ODDGBN, A.DATMON, A.BUSNAM, B.ACDEXT, A.CHAAMT, A.DAEAMT                  										    	                                    
                    FROM MANAMT A                                                                    										    	                                    
                    LEFT JOIN ACDMST_VER B                                                           										    	                                    
                      ON B.ACDNAM = A.ACDEXT                                                         										    	                                    
                     AND B.ODDGBN = A.ODDGBN                                                         										    	                                    
                     AND B.DISPGB = 'true'                  											                                                                                
                  ) A                       											                                                                                                
            LEFT JOIN BUSMST_VER B                                                                                                                                                      
              ON A.BUSNAM = B.BUSNAM                                                                                                                                                    
             AND A.ODDGBN = B.ODDGBN                                                                                                                                                    
           WHERE ACDEXT BETWEEN 6200000 AND 7999999                                                                                                                                		
             AND A.ODDGBN IN ('44P','44S')							                                     						                                        
             AND SUBSTR(A.DATMON, 6) IN ('07','08','09','10','11','12','01','02','03','04','05','06','') 																					                                    
  	         AND B.AREANM IN ('ĥ������') 																										                                    
         ) A                                                                                                                                 											
   GROUP BY VALGBN