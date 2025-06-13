
//input ports
add mapped point spi_sck spi_sck -type PI PI
add mapped point spi_cs spi_cs -type PI PI
add mapped point spi_mosi spi_mosi -type PI PI
add mapped point scan_in scan_in -type PI PI
add mapped point scan_enable scan_enable -type PI PI
add mapped point sDqIn[7] sDqIn[7] -type PI PI
add mapped point sDqIn[6] sDqIn[6] -type PI PI
add mapped point sDqIn[5] sDqIn[5] -type PI PI
add mapped point sDqIn[4] sDqIn[4] -type PI PI
add mapped point sDqIn[3] sDqIn[3] -type PI PI
add mapped point sDqIn[2] sDqIn[2] -type PI PI
add mapped point sDqIn[1] sDqIn[1] -type PI PI
add mapped point sDqIn[0] sDqIn[0] -type PI PI

//output ports
add mapped point spi_miso spi_miso -type PO PO
add mapped point scan_out scan_out -type PO PO
add mapped point sAddress[15] sAddress[15] -type PO PO
add mapped point sAddress[14] sAddress[14] -type PO PO
add mapped point sAddress[13] sAddress[13] -type PO PO
add mapped point sAddress[12] sAddress[12] -type PO PO
add mapped point sAddress[11] sAddress[11] -type PO PO
add mapped point sAddress[10] sAddress[10] -type PO PO
add mapped point sAddress[9] sAddress[9] -type PO PO
add mapped point sAddress[8] sAddress[8] -type PO PO
add mapped point sAddress[7] sAddress[7] -type PO PO
add mapped point sAddress[6] sAddress[6] -type PO PO
add mapped point sAddress[5] sAddress[5] -type PO PO
add mapped point sAddress[4] sAddress[4] -type PO PO
add mapped point sAddress[3] sAddress[3] -type PO PO
add mapped point sAddress[2] sAddress[2] -type PO PO
add mapped point sAddress[1] sAddress[1] -type PO PO
add mapped point sAddress[0] sAddress[0] -type PO PO
add mapped point sCSn sCSn -type PO PO
add mapped point sOEn sOEn -type PO PO
add mapped point sWRn sWRn -type PO PO
add mapped point sDqDir sDqDir -type PO PO
add mapped point sDqOut[7] sDqOut[7] -type PO PO
add mapped point sDqOut[6] sDqOut[6] -type PO PO
add mapped point sDqOut[5] sDqOut[5] -type PO PO
add mapped point sDqOut[4] sDqOut[4] -type PO PO
add mapped point sDqOut[3] sDqOut[3] -type PO PO
add mapped point sDqOut[2] sDqOut[2] -type PO PO
add mapped point sDqOut[1] sDqOut[1] -type PO PO
add mapped point sDqOut[0] sDqOut[0] -type PO PO

//inout ports




//Sequential Pins
add mapped point rAddress[15]/q rAddress_reg[15]/Q -type DFF DFF
add mapped point rAddress[14]/q rAddress_reg[14]/Q -type DFF DFF
add mapped point rAddress[13]/q rAddress_reg[13]/Q -type DFF DFF
add mapped point rAddress[12]/q rAddress_reg[12]/Q -type DFF DFF
add mapped point rAddress[11]/q rAddress_reg[11]/Q -type DFF DFF
add mapped point rAddress[10]/q rAddress_reg[10]/Q -type DFF DFF
add mapped point rOUTBUF[5]/q rOUTBUF_reg[5]/Q -type DFF DFF
add mapped point rAddress[9]/q rAddress_reg[9]/Q -type DFF DFF
add mapped point rOUTBUF[0]/q rOUTBUF_reg[0]/Q -type DFF DFF
add mapped point rOUTBUF[1]/q rOUTBUF_reg[1]/Q -type DFF DFF
add mapped point rOUTBUF[6]/q rOUTBUF_reg[6]/Q -type DFF DFF
add mapped point rOUTBUF[3]/q rOUTBUF_reg[3]/Q -type DFF DFF
add mapped point rOUTBUF[7]/q rOUTBUF_reg[7]/Q -type DFF DFF
add mapped point rOUTBUF[4]/q rOUTBUF_reg[4]/Q -type DFF DFF
add mapped point rOUTBUF[2]/q rOUTBUF_reg[2]/Q -type DFF DFF
add mapped point rAddress[8]/q rAddress_reg[8]/Q -type DFF DFF
add mapped point rAddress[7]/q rAddress_reg[7]/Q -type DFF DFF
add mapped point rState[1]/q rState_reg[1]/Q -type DFF DFF
add mapped point rAddress[6]/q rAddress_reg[6]/Q -type DFF DFF
add mapped point rAddress[5]/q rAddress_reg[5]/Q -type DFF DFF
add mapped point rAddress[4]/q rAddress_reg[4]/Q -type DFF DFF
add mapped point rAddress[1]/q rAddress_reg[1]/Q -type DFF DFF
add mapped point rAddress[3]/q rAddress_reg[3]/Q -type DFF DFF
add mapped point rAddress[0]/q rAddress_reg[0]/Q -type DFF DFF
add mapped point rState[7]/q rState_reg[7]/Q -type DFF DFF
add mapped point rAddress[2]/q rAddress_reg[2]/Q -type DFF DFF
add mapped point rState[6]/q rState_reg[6]/Q -type DFF DFF
add mapped point rCnt[5]/q rCnt_reg[5]/Q -type DFF DFF
add mapped point rState[5]/q rState_reg[5]/Q -type DFF DFF
add mapped point rState[3]/q rState_reg[3]/Q -type DFF DFF
add mapped point rINBUF[7]/q rINBUF_reg[7]/Q -type DFF DFF
add mapped point rState[2]/q rState_reg[2]/Q -type DFF DFF
add mapped point rState[4]/q rState_reg[4]/Q -type DFF DFF
add mapped point rState[0]/q rState_reg[0]/Q -type DFF DFF
add mapped point rWriteFlag1/q rWriteFlag1_reg/Q -type DFF DFF
add mapped point rReadFlag1/q rReadFlag1_reg/Q -type DFF DFF
add mapped point rCnt[4]/q rCnt_reg[4]/Q -type DFF DFF
add mapped point rINBUF[6]/q rINBUF_reg[6]/Q -type DFF DFF
add mapped point rCmd[0]/q rCmd_reg[0]/Q -type DFF DFF
add mapped point rCmd[2]/q rCmd_reg[2]/Q -type DFF DFF
add mapped point rCmd[3]/q rCmd_reg[3]/Q -type DFF DFF
add mapped point rCmd[1]/q rCmd_reg[1]/Q -type DFF DFF
add mapped point rINBUF[5]/q rINBUF_reg[5]/Q -type DFF DFF
add mapped point rCmdGotFlag/q rCmdGotFlag_reg/Q -type DFF DFF
add mapped point rReadFlag2/q rReadFlag2_reg/Q -type DFF DFF
add mapped point rCnt[3]/q rCnt_reg[3]/Q -type DFF DFF
add mapped point rINBUF[4]/q rINBUF_reg[4]/Q -type DFF DFF
add mapped point rINBUF[3]/q rINBUF_reg[3]/Q -type DFF DFF
add mapped point rCnt[2]/q rCnt_reg[2]/Q -type DFF DFF
add mapped point rCnt[1]/q rCnt_reg[1]/Q -type DFF DFF
add mapped point rINBUF[2]/q rINBUF_reg[2]/Q -type DFF DFF
add mapped point rINBUF[1]/q rINBUF_reg[1]/Q -type DFF DFF
add mapped point rINBUF[0]/q rINBUF_reg[0]/Q -type DFF DFF
add mapped point rCnt[0]/q rCnt_reg[0]/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
