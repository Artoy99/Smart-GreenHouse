
?
Command: %s
1870*	planAhead2?
?read_checkpoint -auto_incremental -incremental C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/utils_1/imports/synth_1/source_file.dcp2default:defaultZ12-2866h px? 
?
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2~
jC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/utils_1/imports/synth_1/source_file.dcp2default:defaultZ12-5825h px? 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px? 
v
Command: %s
53*	vivadotcl2E
1synth_design -top led_manip -part xc7a35tcpg236-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a35t2default:defaultZ17-349h px? 
V
Loading part %s157*device2#
xc7a35tcpg236-12default:defaultZ21-403h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px? 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px? 
_
#Helper process launched with PID %s4824*oasys2
84242default:defaultZ8-7075h px? 
?
%s*synth2?
wStarting RTL Elaboration : Time (s): cpu = 00:00:04 ; elapsed = 00:00:05 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
CanLite2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
802default:default8@Z8-638h px? 
i
%s
*synth2Q
=	Parameter BAUD_RATE_PRESCALAR bound to: 10 - type: integer 
2default:defaulth p
x
? 
o
%s
*synth2W
C	Parameter SYNCHRONIZATION_JUMP_WIDTH bound to: 3 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_1 bound to: 4 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_2 bound to: 5 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter TRIPLE_SAMPLING bound to: 1 - type: bool 
2default:defaulth p
x
? 
i
%s
*synth2Q
=	Parameter BAUD_RATE_PRESCALAR bound to: 10 - type: integer 
2default:defaulth p
x
? 
o
%s
*synth2W
C	Parameter SYNCHRONIZATION_JUMP_WIDTH bound to: 3 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_1 bound to: 4 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_2 bound to: 5 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter TRIPLE_SAMPLING bound to: 1 - type: bool 
2default:defaulth p
x
? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2)
CanLiteBitTimingLogic2default:default2U
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
3592default:default2"
BitTimingLogic2default:default2)
CanLiteBitTimingLogic2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
2822default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2)
CanLiteBitTimingLogic2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
3932default:default8@Z8-638h px? 
i
%s
*synth2Q
=	Parameter BAUD_RATE_PRESCALAR bound to: 10 - type: integer 
2default:defaulth p
x
? 
o
%s
*synth2W
C	Parameter SYNCHRONIZATION_JUMP_WIDTH bound to: 3 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_1 bound to: 4 - type: integer 
2default:defaulth p
x
? 
c
%s
*synth2K
7	Parameter TIME_SEGMENT_2 bound to: 5 - type: integer 
2default:defaulth p
x
? 
a
%s
*synth2I
5	Parameter TRIPLE_SAMPLING bound to: 1 - type: bool 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2)
CanLiteBitTimingLogic2default:default2
12default:default2
12default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
3932default:default8@Z8-256h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2-
CanLiteBitStreamProcessor2default:default2U
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
7352default:default2&
BitStreamProcessor2default:default2-
CanLiteBitStreamProcessor2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
3142default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2-
CanLiteBitStreamProcessor2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
7752default:default8@Z8-638h px? 
?
Hmodule '%s' declared at '%s:%s' bound to instance '%s' of component '%s'3392*oasys2

CanLiteCrc2default:default2U
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
6912default:default2
RxCrc2default:default2

CanLiteCrc2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
16402default:default8@Z8-3491h px? 
?
synthesizing module '%s'638*oasys2

CanLiteCrc2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
7012default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2

CanLiteCrc2default:default2
22default:default2
12default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
7012default:default8@Z8-256h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2+
arbitration_field_q_reg2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
21632default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2'
arbitration_cnt_reg2default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
21742default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2-
CanLiteBitStreamProcessor2default:default2
32default:default2
12default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
7752default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
CanLite2default:default2
42default:default2
12default:default2W
AC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/CanLite.vhd2default:default2
802default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
ws2812b_phy2default:default2v
`C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/ws2812b_phy.vhd2default:default2
422default:default8@Z8-638h px? 
b
%s
*synth2J
6	Parameter f_clk bound to: 100000000 - type: integer 
2default:defaulth p
x
? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ws2812b_phy2default:default2
52default:default2
12default:default2v
`C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/ws2812b_phy.vhd2default:default2
422default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2!
ws2812b_gamma2default:default2x
bC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/ws2812b_gamma.vhd2default:default2
242default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2!
ws2812b_gamma2default:default2
62default:default2
12default:default2x
bC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/ws2812b_gamma.vhd2default:default2
242default:default8@Z8-256h px? 
?
Esignal '%s' is read in the process but is not in the sensitivity list614*oasys2
RxFrame2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
1782default:default8@Z8-614h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2-
color_transition_live_reg2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
2702default:default8@Z8-6014h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2

Can_TX_pin2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
182default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
Reset_n2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
692default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
CanRx2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
782default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2

RxFifoFull2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
722default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
TxFrame[Id]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2 
TxFrame[Rtr]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2 
TxFrame[Ide]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2 
TxFrame[Dlc]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][7]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][6]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][5]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][4]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][3]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][2]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][1]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2$
TxFrame[Data][0]2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
732default:default8@Z8-3848h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
TxFifoEmpty2default:default2
	led_manip2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
752default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	led_manip2default:default2
72default:default2
12default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
232default:default8@Z8-256h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

Can_TX_pin2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn_n2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

Can_RX_pin2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
%s*synth2?
wFinished RTL Elaboration : Time (s): cpu = 00:00:06 ; elapsed = 00:00:06 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:06 ; elapsed = 00:00:07 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0202default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
Parsing XDC File [%s]
179*designutils2V
@C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/basys3.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2V
@C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/basys3.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2T
@C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/sources/basys3.xdc2default:default2/
.Xil/led_manip_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0062default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
?
[Reference run did not run incremental synthesis because %s; reverting to default synthesis
2138*designutils2+
the design is too small2default:defaultZ20-4072h px? 
?
?Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}2229*designutilsZ20-4379h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Constraint Validation : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Loading part: xc7a35tcpg236-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:13 ; elapsed = 00:00:14 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
3inferred FSM for state register '%s' in module '%s'802*oasys2(
luminosite_start_reg2default:default2
	led_manip2default:defaultZ8-802h px? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2t
`                   State |                     New Encoding |                Previous Encoding 
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2s
_                     off |                           000001 |                              000
2default:defaulth p
x
? 
?
%s
*synth2s
_                     on1 |                           000010 |                              001
2default:defaulth p
x
? 
?
%s
*synth2s
_                     on2 |                           000100 |                              010
2default:defaulth p
x
? 
?
%s
*synth2s
_                     on3 |                           001000 |                              011
2default:defaulth p
x
? 
?
%s
*synth2s
_                     on4 |                           010000 |                              100
2default:defaulth p
x
? 
?
%s
*synth2s
_                     on5 |                           100000 |                              101
2default:defaulth p
x
? 
?
%s
*synth2x
d---------------------------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
Gencoded FSM with state register '%s' using encoding '%s' in module '%s'3353*oasys2(
luminosite_start_reg2default:default2
one-hot2default:default2
	led_manip2default:defaultZ8-3354h px? 
?
!inferring latch for variable '%s'327*oasys2)
RxFifoWriteEnable_reg2default:default2t
^C:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.srcs/sources_1/new/led_manip.vhd2default:default2
962default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:14 ; elapsed = 00:00:15 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
$decloning instance '%s' (%s) to '%s'223*oasys2*
ws2812b_gamma_red_inst2default:default2!
ws2812b_gamma2default:default2,
ws2812b_gamma_green_inst2default:defaultZ8-223h px? 
?
$decloning instance '%s' (%s) to '%s'223*oasys2*
ws2812b_gamma_red_inst2default:default2!
ws2812b_gamma2default:default2+
ws2812b_gamma_blue_inst2default:defaultZ8-223h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   26 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   13 Bit       Adders := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    9 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit       Adders := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit       Adders := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit       Adders := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit       Adders := 12    
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     15 Bit         XORs := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 1     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               29 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               26 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               24 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               15 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               13 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                9 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 11    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                7 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                6 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 83    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   26 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   24 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   24 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   15 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input   13 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input   13 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    9 Bit        Muxes := 5     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   6 Input    8 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    7 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    6 Bit        Muxes := 3     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    5 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    4 Bit        Muxes := 4     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    3 Bit        Muxes := 17    
2default:defaulth p
x
? 
X
%s
*synth2@
,	   4 Input    2 Bit        Muxes := 1     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    2 Bit        Muxes := 2     
2default:defaulth p
x
? 
X
%s
*synth2@
,	   2 Input    1 Bit        Muxes := 113   
2default:defaulth p
x
? 
X
%s
*synth2@
,	   3 Input    1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2j
VPart Resources:
DSPs: 90 (col length:60)
BRAMs: 100 (col length: RAMB18 60 RAMB36 30)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

Can_TX_pin2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2
btn_n2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
9Port %s in module %s is either unconnected or has no load4866*oasys2

Can_RX_pin2default:default2
	led_manip2default:defaultZ8-7129h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2)
RxFifoWriteEnable_reg2default:default2
	led_manip2default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:17 ; elapsed = 00:00:18 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
M
%s*synth25
!
ROM: Preliminary Mapping Report
2default:defaulth px? 
?
%s*synth2n
Z+--------------+---------------------------------------+---------------+----------------+
2default:defaulth px? 
?
%s*synth2o
[|Module Name   | RTL Object                            | Depth x Width | Implemented As | 
2default:defaulth px? 
?
%s*synth2n
Z+--------------+---------------------------------------+---------------+----------------+
2default:defaulth px? 
?
%s*synth2o
[|ws2812b_gamma | gamma_table[0]                        | 256x8         | LUT            | 
2default:defaulth px? 
?
%s*synth2o
[|led_manip     | ws2812b_gamma_red_inst/gamma_table[0] | 256x8         | LUT            | 
2default:defaulth px? 
?
%s*synth2o
[+--------------+---------------------------------------+---------------+----------------+

2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
{Finished Timing Optimization : Time (s): cpu = 00:00:22 ; elapsed = 00:00:23 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
zFinished Technology Mapping : Time (s): cpu = 00:00:23 ; elapsed = 00:00:23 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
tFinished IO Insertion : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
Finished Renaming Generated Nets : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px? 
D
%s*synth2,
|2     |CARRY4 |    10|
2default:defaulth px? 
D
%s*synth2,
|3     |LUT1   |    16|
2default:defaulth px? 
D
%s*synth2,
|4     |LUT2   |     7|
2default:defaulth px? 
D
%s*synth2,
|5     |LUT3   |    43|
2default:defaulth px? 
D
%s*synth2,
|6     |LUT4   |    21|
2default:defaulth px? 
D
%s*synth2,
|7     |LUT5   |    14|
2default:defaulth px? 
D
%s*synth2,
|8     |LUT6   |    47|
2default:defaulth px? 
D
%s*synth2,
|9     |MUXF7  |     9|
2default:defaulth px? 
D
%s*synth2,
|10    |MUXF8  |     4|
2default:defaulth px? 
D
%s*synth2,
|11    |FDCE   |    65|
2default:defaulth px? 
D
%s*synth2,
|12    |FDPE   |     6|
2default:defaulth px? 
D
%s*synth2,
|13    |FDRE   |    26|
2default:defaulth px? 
D
%s*synth2,
|14    |IBUF   |     2|
2default:defaulth px? 
D
%s*synth2,
|15    |OBUF   |     1|
2default:defaulth px? 
D
%s*synth2,
|16    |OBUFT  |     1|
2default:defaulth px? 
D
%s*synth2,
+------+-------+------+
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 6 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
}Synthesis Optimization Runtime : Time (s): cpu = 00:00:19 ; elapsed = 00:00:26 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth p
x
? 
?
%s
*synth2?
~Synthesis Optimization Complete : Time (s): cpu = 00:00:27 ; elapsed = 00:00:28 . Memory (MB): peak = 1253.191 ; gain = 0.000
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
232default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
g
$Synth Design complete, checksum: %s
562*	vivadotcl2
622ec8772default:defaultZ4-1430h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
402default:default2
322default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:312default:default2
00:00:322default:default2
1253.1912default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2l
XC:/Users/ecx/Documents/TP_SINT_JOST_COLLINEAU/TP_SINT/TP_SINT.runs/synth_1/led_manip.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2|
hExecuting : report_utilization -file led_manip_utilization_synth.rpt -pb led_manip_utilization_synth.pb
2default:defaulth px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon May 30 11:31:54 20222default:defaultZ17-206h px? 


End Record