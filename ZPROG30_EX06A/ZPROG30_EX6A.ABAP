REPORT ZPRG30_EX06B MESSAGE-ID ZCM30.

* Declarando tabela
TABLES: T005H.

* Criando tipos
TYPES: BEGIN OF TY_T005H,
         LAND1 TYPE T005H-LAND1,
         BEZEI TYPE T005H-BEZEI,
       END OF TY_T005H.

* Criando a Work Area ou Estrutura
DATA: WA_T005H TYPE TY_T005H.

* Criando a tabela interna
DATA: IT_T005H TYPE STANDARD TABLE OF TY_T005H.

* Definindo variaveis
DATA: V_QUANT TYPE I.

* Definindo a tela
SELECTION-SCREEN BEGIN OF BLOCK B01 WITH FRAME TITLE TEXT-001.
PARAMETERS: P_LAND1 LIKE T005H-LAND1 OBLIGATORY DEFAULT 'US',
            P_SPRAS LIKE T005H-SPRAS OBLIGATORY DEFAULT SY-LANGU.
SELECTION-SCREEN END OF BLOCK B01.

* Inicio do programa

PERFORM SELECAO_DADOS.
PERFORM OBTER_DADOS.
*&---------------------------------------------------------------------*
*& Form SELECAO_DADOS
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM SELECAO_DADOS .

  SELECT * FROM T005H WHERE LAND1 EQ P_LAND1 AND SPRAS EQ P_SPRAS ORDER BY CITYC.

    WRITE: / 'Código País: ', T005H-LAND1,
             'Descrição: ', T005H-BEZEI.

    ADD 1 TO V_QUANT.

  ENDSELECT.
  IF SY-SUBRC NE 0.
    MESSAGE I000 WITH 'Cidade (t005h)'.
  ELSE.
    ULINE.
    WRITE: / 'Foram listado(s): ', V_QUANT, 'Registrado(s)'.

  ENDIF.
ENDFORM.

*&---------------------------------------------------------------------*
*& Form OBTER_DADOS
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM OBTER_DADOS.

  SELECT LAND1 BEZEI INTO TABLE IT_T005H FROM T005H WHERE LAND1 EQ P_LAND1 AND SPRAS EQ P_SPRAS ORDER BY BEZEI.


ENDFORM.
