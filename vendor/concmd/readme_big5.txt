ConCmd 1.5  (Freeware for non-commercial use)             11/19/2002


�o�O ConvertZ �� Console �����AConvertZ ���M���ؤF Command Line ���䴩�A���]���������O GUI �{���A�b Command Line ����ɮĲv�|�y�t�A�ҥH�ڥt�~���F�o�Ӫ����C

1.5 ���s�W /cu �ѼơA�@���ഫ�Τ@�X�Ʀr�O�k���ΡC
�t�~�A/f �Ѽƪ��Ϊk����]�ѬݤU���y�k�@��^�C


�γ~�G
�ɮפ��夺�X�ഫ�@(Unicode Big Endian, Unicode Little Endian, UTF-8, GBK, Big5)

�t�λݨD�G
- Win9x/ME/NT/2000/XP
- Windows �t�Υ����P�ɤv�w���c���²�骺�䴩�]Win2000 �� XP �t�Υu���b"����x/��O�]�w" �[�J�W�z�䴩�AWin9x/ME �t�Φp�G�L�w�ˤW�z�䴩���ܥi�H�� Windows Update �U���^�C


�w��:
�N�Ҧ��ɮ׸�����@�ӷs����Ƨ��A��Ƨ��U�����]�t�U�C�|���ɮסG
- Concmd.exe (�D�{��)
- Concmd.ini (�]�w��)
- b5fix.dat (�c���r�ץ��C��)
- gbfix.dat (²���r�ץ��C��)

* Concmd �즸�����|�۰ʲ��� 6 �Ӱ�Ū��������,���O�O:
  gb_1.ndx, gb_2.ndx, b5_1.ndx, b5_2.ndx, key1.ndx, key2.ndx


�y�k�G�@ConCmd [CodeIn] <CodeOut> [Quiet] [Backup] [Face] [Fix_UNN] <FileIn> [FileOut]

[CodeIn]�@�]��J�s�X�A�i�H�ٲ��^

�@�@�Ѽ�	��J���s�X��k
�@�ССССССССССССССССС�
�@�@/i:ule	Unicode Little Endian
�@�@/i:ube	Unicode Big Endian
�@�@/i:utf8	UTF-8
�@�@/i:gbk	GBK
�@�@/i:big5	Big5

�@�@���b�ٲ��o�Ѽƪ����p�U�A�{���|�۰ʰ����ӷ��ɮת��s�X�C�Y�G�ӷ��ɮ�
�@�@�@�O GBK �� Big5 �X�A��ĳ���ɮ׸̭����h��100�Ӥ���r�ɤ~�γo�\��A
�@�@�@�_�h�{���i��|���~�P�_�s�X�C
�@�@�@
  
<CodeOut>�@�]��X�s�X�^

�@�@�Ѽ�	��X���s�X��k
�@�ССССССССССССССССС�
�@�@/o:ule	Unicode Little Endian
�@�@/o:ube	Unicode Big Endian
�@�@/o:utf8	UTF-8
�@�@/o:gbk	GBK
�@�@/o:big5	Big5

[Face]�@(��X�r��C�i�H�ٲ��^

�@�@�Ѽ�	��X���r��
�@�ССССССССССССССССС�
�@�@/f:t	�c��r�� (Traditional)
�@�@/f:s	²��r�� (Simplified)
  �@/f:d	�����ഫ�������J�ץ��A��X�r�κɶq�̨��쥻�r�ΡC

    ��X�s�X	�b�ʥF /f �ѼƮɪ����]��
�@�ССССССССССССССССССС�
�@�@Big5	/f:t
�@�@GBK		/f:s
�@�@�䥦	/f:d

�@���@�Y�G��X�s�X�O Big5  /f:s �ѼƵL��

[Fix_UNN] �]�N�Τ@�X�Ʀr�O�k&#xxxxx;�ন�¤�r�^

�@�@�Ѽ�	�O�_�ഫ�Τ@�X�Ʀr�O�k
�@�СССССССССССССССССС�
�@�@/cu		�@�@�ഫ
�@�@�ٯ�	�@�@���ഫ

[Quiet] (��ܿù��T���C�i�H�ٲ��A�w�]�ȬO�_�^

�@�@�Ѽ�	�O�_��ܿù��T��
�@�СССССССССССССС�
�@�@/q		�@�@�����
�@�@�ٯ�	�@�@���

[Backup] (�ӷ��ɳƥ��A�i�ٲ��^

�@�@�Ѽ�	�O�_�ƥ��ɮ�
�@�СССССССССССССС�
�@�@/b		�@�@�O
�@�@�ٯ�	�@�@�_

�@�@���X���мg�ӷ��ɮɫ��w�O�_�N�ӷ��ɳƥ���P�W�� file extension �O .bak ���ɮסC�@�@
   

<FileIn> �@�]��J�ɮת����|�ϦW�١A�䴩�U�Φr���Ÿ��^

[FileOut]�@�]��X�ɮת����|�ϦW�١A�䴩�U�Φr���Ÿ��A�i�ٲ��^


���@�b FileOut �ٲ������p�U�A��X���G�|�мg FileIn

���@�Y�ɮצW�]�t�ťծ�A���n�b�ɦW���e���ݥ[�J���޸� (")


����G

1) concmd /i:big5 /o:ule /f:s test1.txt test2.txt
   �W�z���O�|�N test.txt �����e�� Big5 �ର²�餤�媺 Unicode-LE �s�X
   �ñN���G�x�s�� test2.txt�C

2) concmd /i:utf8 /o:big5 *.*
   �W�z���O�N��e�ؿ����Ҧ��ɮץ� utf-8 �వ big5 �X�A��X���G�|�мg
   ��Ӫ��ɮסC

3) concmd /o:ule /f:t k*.txt "D:\Temp Dir\*.abc"
   �W�z���O�|�j�M��e�ؿ����Ҧ��ɦW���Ӧr���O k �ΰ��ɦW�O txt ���ɮסA
   �۰ʰ������̪���ӽs�X�A�M��v�@�ഫ�����c�� Unicode-LE�A �åt�s��
   'D:\Temp Dir' �ؿ��A�s�ɮצW�ٸ����ɮ׬ۦP�����ɦW�|�ﰵ abc�C



*** ConCmd.ini ***

�ϥΪ̥i�H�Τ�r�s�边�h�ק� ConCmd.ini ���]�w

���X		�γ~
�СССССССССССССССССССССС�
Ignore		�������ɮ������]����\�ഫ�^�A�U�����θU�Φr���Ÿ���ܤΥγr�����j

HtmlType	HTML �ɮ������A�θU�Φr���Ÿ���ܤΥγr�����j

FixHtmlCharset	���w���ഫ Html �ɮ׮ɬO�_�P�ɭץ� Meta tag �����s�X�ƭȡA0=�_�A1=�O

AddBOMtoUTF8	���X�O UTF-8 �ɫ��w�O�_�[ BOM �]�ѧO�X�^���ɮת��e�ݡA0=�_�A1=�O

���@Agegbfix �� Ageb5fix �O gbfix.dat �� b5fix.dat ���ɮפ���A�o��Ӿ��X���ƭȥu�ѵ{�������ϥΡA�Y�G�Q�ק�{���|�۰ʭ״_�C


*** b5fix.dat & gbfix.dat ***

�o��ӦC��� ConvertZ �ҥΪ��O�@�ˡA�Y�G�n�ק�i�H�� ConvertZ ���ت��s�边�A��i�H�Υ���¤�r�s�边�����i��ק�A�u���N�s�[���r���b�ɮ׵����K�i�A�榡�O�N�ഫ�e/�᪺��r��b�P�@��Υγr��(�b��)���j�A�{������ɷ|�۰ʱƧǤέ��د����ɡC

�ץ��C�����ΡG
�ץ��ɵ{���q���e�ݶ}�lŪ�����e�A�P�ɹ�ӭץ��C�����S���ۦP�r��]��ӮɥH�������r�ꬰ�u���^�A�Y�G�o�{�K�|�i������θ���Ӧr������~��j�M���ഫ�A���g�峹�q���ܧ��u�|Ū���@���C

�Ҥl�G

�b���w����:
AB,MM
ABC,NNN
CD,OO
DE,PP
FG,QQ

����O�G�@ABCDACDEFGABADE
�ഫ��O�GNNNDAOOEQQMMAPP

�`�N�Ĥ@�ӥX�{�� AB �]�� ABC ���X�{�õL�ର MM�A�ӲĤ@�ӥX�{�� CD ��]���Q ABC ���_�ӵL�ର OO�A�P�˹D�z�A�Ĥ@�ӥX�{�� DE ��L�ର PP�C�Q�γo�W�ߧޥ��a�K�[�s�r��졧���J�ץ��������w�K�i���Ħa�����ǽT�v�C

�U���O�@��²�����c�骺�d�ҡG

�սd�Ң���

�C���u���G���F,���A 

�ץ��e�G�w�g�ѩ��F�C���H���F�L���B�ҡC 

�ץ���G�w�g�ѩ��A�C���H���A�L���B�ҡC <-- �Ĥ@�ӡu���F�v����F
�@�@�@�@�@�@�@�@�s��

�Y�C���[�J�G�ѩ�,�ѩ� �]�Ρ��ѩ��F,�ѩ��F���N����i�A���G�ۦP�C�^

�ഫ��G�w�g�ѩ��F�C���H���A�L���B�ҡC <---- �������T 

�սd�Ң���

�C���u���G�Q��,�Q��
�@�@�@�@�@�@�̧E,���l

��y�@�G�o�̧E�U�T�H�C�L�̦�F�̧E���C���ت��a�٦��Q�̧E�C

�ഫ��G�o���l�U�T�H�C�L�̦�F���l���C���ت��a�٦��Q���E�C
�@�@�@�@�@�s�s�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�s

�Ĥ@�ӡ��̧E������F�A�ĤT�ӡ��̧E���]���Q���Q�̡����_�F�ӨS���Q�ഫ�C

�Y�b�C���A�[�J�G�̧E�U,�̾l�U
�@�@�@�@�@�@�@�@�@�Q�̧E,�Q���l

�ഫ��|�O�G�o�̾l�U�T�H�C�L�̦�F���l���C���ت��a�٦��Q���l�C <--- �������T


�ССССССССССССССССССССССССССССССССС�

��������:

ver 1.5
- �s�W /cu �ѼơA�i�H�ഫ�Τ@�X�Ʀr�O�k�]&#xxxxx;)���¤�r�C
- �� /f �Ѽƪ��Ϊk�@�@�ǧ�C
- ��s��Ӫ�ε��J�ץ��C��C

ver 1.4
- �ץ� unicode ²�c�ഫ�ɤ@�Ǧr�����ഫ�����D

ver 1.3
- ���J�ο�X�ɦW�ۦP�ɥi�H�ƥ��ӷ���

ver 1.2 
- �[�J�۰ʰ����ӷ��ɽs�X���\��C
- �ץ�²�餤���ন Unicode/UTF-8 �c�餤��ɳ�������r�����ഫ�����D�C
- �� ConCmd.ini �ɮשθ̭�������X���s�b�ɦ۰ʭ��s�ЫءC

ver 1.1
- �ץ��b Windows NT �U����ɷ|�X�{ AV Error �����D

ver 1.0 
- first release

�ССССССССССССССССССССССССССССССССС�


�����n������
���{���ȨѭӤH�K�O�ϥΡA�b���g�@�̱��v�U���o�N�o����X���X��
��䥦�n��Χ@����ӷ~���γ~�C
�@�̷����t�d�Ϊ̦]�ϥΥ��{���ӾɭP�ӹq���t�Τ�����G�١C
�Y������N���εo�{����{�����~�A�ЭP��@�̡C


======================================================
�@�@�@�̡G���Ӧ�
�@�@�q�l�Gcsli534@ctimail3.com
�@�@�s�}�Galf-li.tripod.com
======================================================

