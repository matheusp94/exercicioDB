SET SERVEROUTPUT ON;

-- CHECKPOINT

VARIABLE MEDIA_CHECK NUMBER;

ACCEPT CP1 NUMBER PROMPT 'entre com o valor do checkpoint 1 ';
ACCEPT CP2 NUMBER PROMPT 'entre com o valor do checkpoint 2 ';
ACCEPT CP3 NUMBER PROMPT 'entre com o valor do checkpoint 3 ';

DECLARE
   MEDIA_CHECK NUMBER;
   CP1 NUMBER;
   CP2 NUMBER;
   CP3 NUMBER;
BEGIN
   CP1 := &CP1;
   CP2 := &CP2;
   CP3 := &CP3;
   IF CP1 < 0 OR CP1 > 10 OR CP2 < 0 OR CP2 > 10 OR CP3 < 0 OR CP3 > 10 THEN
       DBMS_OUTPUT.PUT_LINE('entrada não permitida. Os valores devem ser entre 0 e 10.');
   ELSE
       IF CP1 >= CP2 AND CP1 >= CP3 THEN
           MEDIA_CHECK := (CP2 + CP3) / 2;
       ELSIF CP2 >= CP1 AND CP2 >= CP3 THEN
           MEDIA_CHECK := (CP1 + CP3) / 2;
       ELSE
           MEDIA_CHECK := (CP1 + CP2) / 2;
       END IF;
       DBMS_OUTPUT.PUT_LINE('A média das notas do aluno é: ' || to_char(media_check));
   END IF;
END;


-- CHALLENGE

VARIABLE MEDIA_SPRINT NUMBER;

ACCEPT SP1 NUMBER PROMPT 'entre com o valor da sprint 1 ';
ACCEPT SP2 NUMBER PROMPT 'entre com o valor da sprint 2 ';

DECLARE
  MEDIA_SPRINT NUMBER;
  SP1 NUMBER;
  SP2 NUMBER;
 
BEGIN

  IF SP1 < 0 OR SP1 > 100 THEN
    DBMS_OUTPUT.PUT_LINE('É permitido valores somente entre 0 e 100');
  END IF;
  IF SP2 < 0 OR SP2 > 100 THEN
    DBMS_OUTPUT.PUT_LINE('É permitido valores somente entre 0 e 100');
  END IF;
 
  IF SP1 = 0 AND SP2 = 0 THEN
    MEDIA_SPRINT := 0;
  ELSE
    MEDIA_SPRINT := (((SP1 + SP2) / 10) / 2);
  END IF;
 
  DBMS_OUTPUT.PUT_LINE('Média Challange Sprint: ' || to_char(MEDIA_SPRINT));
END;


--GLOBAL SOLUTION

VARIABLE MEDIA_GS NUMBER;

ACCEPT GS1 NUMBER PROMPT 'Insira a nota da Global Solution: '
DECLARE
   MEDIA_GS NUMBER;
BEGIN

   IF &GS1 < 0 OR &GS1 > 100 THEN
       DBMS_OUTPUT.PUT_LINE('Entrada não permitida. O valor deve estar entre 0 e 100.');
   ELSE
       MEDIA_GS := &GS1 / 10;
       DBMS_OUTPUT.PUT_LINE('Sua média na Global Solution é: ' || to_char(MEDIA_GS));
   END IF;
END;

--MEDIA FINAL

DECLARE
   MED_FINAL NUMBER;
   MEDIA_GS NUMBER := &GS;
   MEDIA_CHECK NUMBER := &CP;
   MEDIA_SPRINT NUMBER := &SP;
   conceito VARCHAR2(10);
BEGIN
   MED_FINAL := (MEDIA_GS * 0.6) + (MEDIA_CHECK * 0.2) + (MEDIA_SPRINT * 0.2);
   IF MED_FINAL >= 6 THEN
       conceito := 'Parabéns, você foi aprovado!';
   ELSIF MED_FINAL >= 2 AND MED_FINAL < 6 THEN
       conceito := 'Você precisará prestar o exame final.';
   ELSE
       conceito := 'Você foi reprovado.';
   END IF;
   DBMS_OUTPUT.PUT_LINE('Média final: ' || to_char(MED_FINAL));
   DBMS_OUTPUT.PUT_LINE('O conceito da sua nota é: ' || conceito);
END;