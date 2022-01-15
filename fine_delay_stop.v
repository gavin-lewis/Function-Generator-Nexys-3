`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    fine_delay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module fine_delay_stop(
	//input wire m_clk,
	input wire stop_pulse,
	output delayed_stop_pulse
    );


IODELAY2#(
.COUNTER_WRAPAROUND("WRAPAROUND"),//Setsbehaviorwhentapcountexceedsmaxormin,dependingon//whethertapsettingisbeingincrementedordecremented.
//.DAT_RATE("SDR"),
.DELAY_SRC("ODATAIN"),//ODATAINindicatesdelaysourceistheODATAINpinfromtheOSERDES//orOLOGIC.IDATAINindicatesthedelaysourceisfromtheIDATAIN//pin;oneofthededicatedIOB(P/N)Pads.IOmeansthatthesignal//sourceswitchesbetweenIDATAINandODATAINdependingonthesense//oftheT(tristate)input.
.IDELAY2_VALUE(0),//DelaytapvalueforIDELAYMode.OnlyusedwhenIDELAY_MODEisset//toPCI.
.IDELAY_MODE("NORMAL"),//DelayModesetting-PCIisforhandlingPCI/ExtendedMode.Affects//Inputdelaysonly.
.IDELAY_TYPE("FIXED"),//DelayType.VARIABLEreferstothecustomercalibrateddelaymode.//DEFAULTwillutilizephysicalchipsettingsforbestapproximation//ofzeroholdtimeprogramming.VARIABLE_FROM_ZEROand//VARIABLE_FROM_HALF_MAXrefertotheresetbehavior.//DIFF_PHASE_DETECTORisaspecialmodewherethemasterandslave//IODELAY2sarecascadedforvideoapplicationsupport.
.IDELAY_VALUE(0),//DelaytapvalueforIDELAYMode.
.ODELAY_VALUE(4),//DelaytapvalueforODELAYMode.
.SERDES_MODE("NONE"),
.SIM_TAPDELAY_VALUE(20))

IODELAY2_inst2(
.BUSY(BUSY),
.DATAOUT(DATAOUT),//1-bitDelayeddatasignaltoDDLYofILOGIC2orISERDES2sites.
.DATAOUT2(delayed_stop_pulse),//1-bitDelayeddatasignaltoDDLY2ofILOGIC2orISERDES2sites.
.DOUT(DOUT),//1-bitDelayeddatasignaltoIOB.
.TOUT(TOUT),//1-bitDelayedTristatesignaltoIOB.
.CAL(CAL),//1-bitEntertheIODELAYcalibrationsequence.Thiswilllastbetween8and16//GCLKcycles.DrivesRDYHIGHwhencomplete.SharedwithDRPpinADD(add).
.CE(CE),//1-bitEnabletheIncrement/Decrementsignal.
.CLK(CLK),//1-bitCLK0fromINTconnectsto"Master"andCLK1fromINTconnectsto"Slave"
.IDATAIN(IDATAIN),//1-bitDatasignalfromIOB.
.INC(INC),//1-bitIncrement/Decrementsignal.Usedforsettingtapordelaylength.
//IOCLK0-IOCLK1:1-bit(each)OptionallyInvertibleIOclocknetworkinput.
.IOCLK0(IOCLK0),
.IOCLK1(IOCLK1),
.ODATAIN(stop_pulse),//1-bitDatainputsignalfromOLOGICorOSERDES.
.RST(RST),//1-bitResettheIODELAY2toeitherzeroor1/2oftotalperiod.RST_VALUE,//attributecontrolsthischoice.
.T(T)//1-bitTristateinputsignalfromOLOGICorOSERDES.
); 
endmodule
