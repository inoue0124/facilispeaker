======================================================================

                �uJulius�f�B�N�e�[�V�����L�b�g v4.4�v

						      v3.0 2004/08/11
						      v3.1 2005/11/11
						      v3.2 2008/01/17
						      v4.0 2009/12/17
						      v4.1 2011/03/03
						      v4.2 2011/05/11
						    v4.2.3 2013/06/30
						    v4.3.1 2014/01/31
						      v4.4 2016/09/21
======================================================================

�� �͂��߂� //////////////////////////////////////////////////////////

����́C�����F���i�f�B�N�e�[�V�����j�𓮍삳���Ă݂邽�߂̃t���[��
�L�b�g�ł��D�C�ӂ̓ǂݏグ�������i�Ώی�b��6����j���قڎ����Ԃ�
90%�ȏ�F�����邱�Ƃ��ł��܂��D

������� Windows/Linux/MacOSX �ł��D

Julius �� Rev.4.4.2 ��p���Ă��܂��D���̃o�[�W������ Julius ���g��
�����ꍇ�́CJulius �̃T�C�g����_�E�����[�h�����o�C�i����C������
�R���p�C�������o�C�i���̎��s�t�@�C�����C���̃f�B���N�g���� bin ����
�Ή�����OS�̃f�B���N�g�����ɏ㏑���R�s�[���Ă��������D

�ŐV����ڂ������e�ɂ��ẮC�ȉ��̃y�[�W�������������D

http://julius.osdn.jp/


�� ����� //////////////////////////////////////////////////////////

  �� OS

     [Windows]
     ����m�F�� Windows 7/8.1/10 (64-bit) �ōs���܂����D
     DirectSound ���K�{�ł��D

     [Linux]
     ����m�F�� CentOS 6 (64-bit) �ōs���܂����D
     Ubuntu, Debian ���ł����삷�邩������܂���D
     DNN�łł� X11 (xterm) ���K�{�ł��D

     [MacOSX]
     ����m�F�� MacOSX 10.11 (El Capitan) �ōs���܂����D
     DNN�łł� X11 (XQuartz) ���K�{�ł��D

  �� �n�[�h�E�F�A�X�y�b�N

     �����F  Core/Xeon   3.0GHz�ȏ�C������2GB�CHDD 1GB �ȏ�
     �Œ���FCore        1.5GHz�ȏ�C������1GB�CHDD 1GB �ȏ�

     �����āC�T�E���h�f�o�C�X�C����у}�C�N���t�H�����K�v�ł��D

     �Ȃ��C�v���Z�X�T�C�Y�� 700MB ���x�Ȃ̂ŁC���肵�ē��삳����
     ���߂ɂ� 1GB ���x�̋󂫃��������K�v�ł��D
     DNN�ł̎��s�ɂ̓}���`�R�ACPU��GPU(CUDA)�̎g�p�𐄏����܂��D


�� �i�[�t�@�C�� ///////////////////////////////////////////////////////

  00readme.txt		���̕���

  HOWTO.txt		�F���V�X�e���̋N���Ɠ���
  HOWTO-dnncli.txt	DNN(dnnclient)�łɂ�鉹���F���̎��s
  LICENSE.txt		���p������
  TROUBLE.txt		���܂��F���ł��Ȃ��Ƃ���

  main.jconf	        DNN�ŁEGMM�ł�Julius���ʐݒ�t�@�C��
  am-dnn.jconf	        DNN�ł�Julius�������f���E���͐ݒ�t�@�C��
  am-gmm.jconf		GMM�ł�Julius�������f���E���͐ݒ�t�@�C��

  dnnclient.conf	DNN(dnnclient)�ł̓����ʕϊ��ݒ�t�@�C��
  julius.dnnconf	DNN(Julius�P��)�ł̓����ʕϊ��ݒ�t�@�C��

  run-linux-dnn.sh	DNN(Julius�P��)�ł̋N���V�F���X�N���v�g (Linux)
  run-linux-dnncli.sh	DNN(dnnclient)�ł̋N���V�F���X�N���v�g  (Linux)
  run-linux-gmm.sh	GMM�ł̋N���V�F���X�N���v�g             (Linux)

  run-osx-dnn.sh	DNN(Julius�P��)�ł̋N���V�F���X�N���v�g (MacOSX)
  run-osx-dnn.sh	DNN(dnnclient)�ł̋N���V�F���X�N���v�g  (MacOSX)
  run-osx-gmm.sh	GMM�ł̋N���V�F���X�N���v�g             (MacOSX)

  run-win-dnn.bat	DNN(Julius�P��)�ł̋N���o�b�`�t�@�C�� (Windows)
  run-win-dnncli.bat	DNN(dnnclient)�ł̋N���o�b�`�t�@�C��  (Windows)
  run-win-gmm.bat	GMM�ł̋N���o�b�`�t�@�C��             (Windows)

  model/		�F���p�̓��{�ꉹ�����f���ƒP��3-gram���ꃂ�f��

  bin/			���s�o�C�i���̃f�B���N�g��
    linux|osx|windows/	(OS���Ƃɕ�����Ă���)
      adinrec(.exe)	�^���c�[��
      adintool(.exe)	�������o�̓c�[��
      adintool-gui.exe	�������o�̓c�[��(GUI�ŁCWindows�̂�)
      jcontrol(.exe)	Julius ���W���[�����[�h�p�̃T���v���N���C�A���g
      julius(.exe)	Julius rev.4.4.2

  doc/			Julius rev.4.4.2 �̕t���}�j���A���E�h�L�������g
  src/			Julius rev.4.4.2 �\�[�X�A�[�J�C�u


�� �g�p���@ //////////////////////////////////////////////////////////

�g�p���@�ɂ��Ă� HOWTO.txt �������������D
�F�������܂������Ȃ��Ƃ��� TROUBLE.txt �����Q�Ɖ������D

���s�o�C�i���������p�̊��œ��삵�Ȃ��ꍇ�́CJulius ���R���p�C��
�������āC�o�C�i���������ւ��Ă������������D

DNN(dnnclient)�ł������p�̏ꍇ�́C�K�� HOWTO-dnncli.txt �������̏�
�K�v�ȃZ�b�g�A�b�v���s���ĉ������D


�� ���̑� ///////////////////////////////////////////////////////////

������ꂽ��b��F������悤�ȏꍇ�́C�u���@�F���L�b�g�v���֗��ł��D
���@�F���L�b�g�ł́C���@����̌��Ō��߂�ꂽ���p�^�[���݂̂���F�����s
���܂��D�ڂ����� Julius �̃z�[���y�[�W���������������D

	http://julius.osdn.jp/


�� �ύX���� //////////////////////////////////////////////////////////

(v4.3.1�ȍ~)

v4.4
�EJulius��Rev.4.4.2�ɕύX
  ����ɂ��DNN-HMM��Julius�P�̂ŃT�|�[�g
  Intel AVX/FMA���߃Z�b�g�̎g�p
  32bit OS�͂��̃o�[�W��������T�|�[�g�O
�E�������f���̍X�V
  JNAS�Ɓw���{��b�����t�R�[�p�X�x�͋[�u���f�[�^�ɂ��DNN-HMM�������f��
�E�x���`�}�[�N(JNAS�e�X�g�Z�b�g200���ɂ����镶�����𐸓x)
  90.8% (GMM-HMM�������f���̏ꍇ)
  94.7% (DNN-HMM�������f���̏ꍇ)

v4.3.1
�EJulius��Rev.4.3.1�ɕύX
  ����ɂ��DNN-HMM���T�|�[�g(dnnclient���g�p)
�E���f���̍��V
  �w�V���L���ǂݏグ�����R�[�p�X�x(JNAS)�ɂ��GMM-HMM�EDNN-HMM�������f��
  �w������{�ꏑ�����t�ύt�R�[�p�X�x(BCCWJ)�ɂ�錾�ꃂ�f��

								�ȏ�
