SET cw=� [1;31m�[1;34m�[1;37m�[0;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\1.flg goto markw1
ECHO       � [1;31m�[33m[Q][0;37m �[35m 01 [37m� [36mBeast Claws[37m (Blood Alpha) �������������������� %cw%
goto w2
:markw1
SET cw=%sl%
ECHO       � [1;31m�[0;32m[Q][37m �[35m 01 [37m� [36mBeast Claws[37m (Blood Alpha) [36m�������������������� %cw%
:w2
SET cw=� [1;31m�[1;37m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\2.flg goto markw2
ECHO       � [1;31m�[33m[W][0;37m �[35m 01 [37m� [36mElectric Pitchfork[37m (Can electrocute) ��������� %cw%
goto w3
:markw2
SET cw=%sl%
ECHO       � [1;31m�[0;32m[W][37m �[35m 01 [37m� [36mElectric Pitchfork[37m (Can electrocute) [36m��������� %cw%
:w3
SET cw=� [1;31m�[1;34m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\3.flg goto markw3
ECHO       � [1;31m�[33m[E][0;37m �[35m 01 [37m� [36mAxe[37m ������������������������������������������ %cw%
goto w4
:markw3
SET cw=%sl%
ECHO       � [1;31m�[0;32m[E][37m �[35m 01 [37m� [36mAxe[36m ������������������������������������������ %cw%
:w4
SET cw=� [1;31m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\4.flg goto markw4
ECHO       � [1;31m�[33m[R][0;37m �[35m 02 [37m� [36mNaturom Demonto[37m ������������������������������ %cw%
goto w5
:markw4
SET cw=%sl%
ECHO       � [1;31m�[0;32m[R][37m �[35m 02 [37m� [36mNaturom Demonto[36m ������������������������������ %cw%
:w5
SET cw=� [1;31m�[1;34m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\5.flg goto markw5
ECHO       � [1;31m�[33m[T][0;37m �[35m 02 [37m� [36mMagnum .45[37m (Very deadly) ��������������������� %cw%
goto w6
:markw5
SET cw=%sl%
ECHO       � [1;31m�[0;32m[T][37m �[35m 02 [37m� [36mMagnum .45[37m (Very deadly) [36m��������������������� %cw%
:w6
SET cw=� [0;31m�[0;34m�[0;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\6.flg goto markw6
ECHO       � [1;31m�[33m[Y][0;37m �[35m 02 [37m� [36mRevolver[37m (PowerSlave / Exhumed) �������������� %cw%
goto w7
:markw6
SET cw=%sl%
ECHO       � [1;31m�[0;32m[Y][37m �[35m 02 [37m� [36mRevolver[37m (PowerSlave / Exhumed) [36m�������������� %cw%
:w7
SET cw=� [0;31m�[0;34m�[0;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\7.flg goto markw7
ECHO       � [1;31m�[33m[U][0;37m �[35m 02 [37m� [36mColt MI12[37m ������������������������������������ %cw%
goto w8
:markw7
SET cw=%sl%
ECHO       � [1;31m�[0;32m[U][37m �[35m 02 [37m� [36mColt MI12 [36m������������������������������������ %cw%
:w8
SET cw=� [1;31m�[1;37m�[0;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\8.flg goto markw8
ECHO       � [1;31m�[33m[I][0;37m �[35m 10 [37m� [36mWrath Heart[37m (SW Beta and Retail mix) ��������� %cw%
goto w9
:markw8
SET cw=%sl%
ECHO       � [1;31m�[0;32m[I][37m �[35m 10 [37m� [36mWrath Heart[37m (SW Beta and Retail mix) [36m��������� %cw%
:w9
SET cw=� [0;31m�[1;34m�[0;36m�[0;35m�[0;37m �
IF .%1 == .meltdown goto w9_unavail
IF EXIST %wmpath%\PRST\CURST\9.flg goto markw9
ECHO       � [1;31m�[33m[O][0;37m �[35m 10 [37m� [36mRat Master[37m (Transforms enemies in rats) ������ %cw%
goto w10
:markw9
SET cw=%sl%
ECHO       � [1;31m�[0;32m[O][37m �[35m 10 [37m� [36mRat Master[37m (Transforms enemies in rats) [36m������ %cw%
goto w10
:w9_unavail
ECHO       � [1;31m��[0;31m[O][37m �[31m 10 [37m� [31mRat Master (Transforms enemies in rats) ������[37m %cw%
:w10
SET cw=� [1;37m�[1;34m�[0;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\10.flg goto markw10
ECHO       � [1;31m�[33m[P][0;37m �[35m 03 [37m� [36mPump Action Shotgun[37m �������������������������� %cw%
goto w11
:markw10
SET cw=%sl%
ECHO       � [1;31m�[0;32m[P][37m �[35m 03 [37m� [36mPump Action Shotgun[37m [36m�������������������������� %cw%
:w11
SET cw=� [1;31m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\11.flg goto markw11
ECHO       � [1;31m�[33m[A][0;37m �[35m 03 [37m� [36mTriple DZ[37m (SW Beta, edited) ������������������ %cw%
goto w12
:markw11
SET cw=%sl%
ECHO       � [1;31m�[0;32m[A][37m �[35m 03 [37m� [36mTriple DZ[37m (SW Beta, edited) [36m������������������ %cw%
:w12
SET cw=� [0;31m�[1;37m�[0;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\12.flg goto markw12
ECHO       � [1;31m�[33m[S][0;37m �[35m 03 [37m� [36mLupara[37m (Single barreled sawed-off) ����������� %cw%
goto w13
:markw12
SET cw=%sl%
ECHO       � [1;31m�[0;32m[S][37m �[35m 03 [37m� [36mLupara[37m (Single barreled sawed-off) [36m����������� %cw%
:w13
SET cw=� [1;37m�[0;34m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\13.flg goto markw13
ECHO       � [1;31m�[33m[D][0;37m �[35m 03 [37m� [36mSawed-Off[37m (Blood Alpha) ���������������������� %cw%
goto w14
:markw13
SET cw=%sl%
ECHO       � [1;31m�[0;32m[D][37m �[35m 03 [37m� [36mSawed-Off[37m (Blood Alpha) [36m���������������������� %cw%
:w14
SET cw=� [1;31m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\14.flg goto markw14
ECHO       � [1;31m�[33m[F][0;37m �[35m 03 [37m� [36m"Holy Death"[37m (Always akimbo) ����������������� %cw%
goto w15
:markw14
SET cw=%sl%
ECHO       � [1;31m�[0;32m[F][37m �[35m 03 [37m� [36m"Holy Death"[37m (Always akimbo) [36m����������������� %cw%
:w15
SET cw=� [1;31m�[0;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\15.flg goto markw15
ECHO       � [1;31m�[33m[G][0;37m �[35m 03 [37m� [36mRiot Shotgun[37m (Shadow Warrior Retail) ��������� %cw%
goto w16
:markw15
SET cw=%sl%
ECHO       � [1;31m�[0;32m[G][37m �[35m 03 [37m� [36mRiot Shotgun[37m (Shadow Warrior Retail) [36m��������� %cw%
:w16
SET cw=� [1;37m�[0;34m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\16.flg goto markw16
ECHO       � [1;31m�[33m[H][0;37m �[35m 05 [37m� [36mNapalm Launcher[37m (Blood Alpha) ���������������� %cw%
goto w17
:markw16
SET cw=%sl%
ECHO       � [1;31m�[0;32m[H][37m �[35m 05 [37m� [36mNapalm Launcher[37m (Blood Alpha) [36m���������������� %cw%
:w17
SET cw=� [0;31m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\17.flg goto markw17
ECHO       � [1;31m�[33m[J][0;37m �[35m 05 [37m� [36mShadow Gun[37m (Blood Alpha) ��������������������� %cw%
goto w18
:markw17
SET cw=%sl%
ECHO       � [1;31m�[0;32m[J][37m �[35m 05 [37m� [36mShadow Gun[37m (Blood Alpha) [36m��������������������� %cw%
:w18
SET cw=� [1;37m�[1;37m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\18.flg goto markw18
ECHO       � [1;31m�[33m[K][0;37m �[35m 07 [37m� [36mAerosol Can[37m (Blood Alpha) �������������������� %cw%
goto w19
:markw18
SET cw=%sl%
ECHO       � [1;31m�[0;32m[K][37m �[35m 07 [37m� [36mAerosol Can[37m (Blood Alpha) [36m�������������������� %cw%
:w19
SET cw=� [1;31m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\19.flg goto markw19
ECHO       � [1;31m�[33m[L][0;37m �[35m 07 [37m� [36mFlamethrower[37m ��������������������������������� %cw%
goto w20
:markw19
SET cw=%sl%
ECHO       � [1;31m�[0;32m[L][37m �[35m 07 [37m� [0;36mFlamethrower[36m ��������������������������������� %cw%
:w20
SET cw=� [0;31m�[1;37m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\20.flg goto markw20
ECHO       � [37m�[1;33m[Z][0;37m �[35m 06 [37m� [36mStick of Dynamite[37m (Blood Alpha) �������������� %cw%
goto w21
:markw20
SET cw=%sl%
ECHO       � [37m�[32m[Z][37m �[35m 06 [37m� [36mStick of Dynamite[37m (Blood Alpha) [36m�������������� %cw%
:w21
SET cw=� [1;37m�[1;37m�[1;37m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\21.flg goto markw21
ECHO       � [37m�[1;33m[X][0;37m �[35m 06 [37m� [36mDynamite Bundles[37m (Blood Alpha) ��������������� %cw%
goto w22
:markw21
SET cw=%sl%
ECHO       � [37m�[32m[X][37m �[35m 06 [37m� [36mDynamite Bundles[37m (Blood Alpha) [36m��������������� %cw%
:w22
SET cw=� [1;37m�[1;34m�[1;36m�[1;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\22.flg goto markw22
ECHO       � [37m�[1;33m[C][0;37m �[35m 04 [37m� [0;36mSubmachine Gun[37m ������������������������������� %cw%
goto w23
:markw22
SET cw=%sl%
ECHO       � [37m�[32m[C][37m �[35m 04 [37m� [36mSubmachine Gun[36m ������������������������������� %cw%
:w23
SET cw=� [1;37m�[1;34m�[0;36m�[0;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\23.flg goto markw23
ECHO       � [37m�[1;33m[V][0;37m �[35m 08 [37m� [36mTesla coil[37m ����������������������������������� %cw%
goto w24
:markw23
SET cw=%sl%
ECHO       � [37m�[32m[V][37m �[35m 08 [37m� [36mTesla coil[36m ����������������������������������� %cw%
:w24
SET cw=� [0;31m�[1;34m�[0;36m�[0;35m�[0;37m �
IF EXIST %wmpath%\PRST\CURST\24.flg goto markw24
ECHO       � [37m�[1;33m[B][0;37m �[35m 09 [37m� [36mLife Leech[37m (Faster, better balance) ���������� %cw%
goto wend
:markw24
SET cw=%sl%
ECHO       � [37m�[32m[B][37m �[35m 09 [37m� [36mLife Leech[37m (Faster, better balance) [36m���������� %cw%
goto wend
:wend