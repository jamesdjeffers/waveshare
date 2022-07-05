<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="untitled">
<packages>
<package name="DCDC">
<pad name="P$1" x="-17.78" y="0" drill="0.6" shape="long"/>
<pad name="P$2" x="0" y="0" drill="0.6" shape="long"/>
<pad name="P$3" x="0" y="-39.37" drill="0.6" shape="long"/>
<pad name="P$4" x="-17.78" y="-39.37" drill="0.6" shape="long"/>
<wire x1="-19.05" y1="1.27" x2="1.27" y2="1.27" width="0.127" layer="21"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="-40.64" width="0.127" layer="21"/>
<wire x1="1.27" y1="-40.64" x2="-19.05" y2="-40.64" width="0.127" layer="21"/>
<wire x1="-19.05" y1="-40.64" x2="-19.05" y2="1.27" width="0.127" layer="21"/>
<text x="-5.08" y="-2.54" size="1.778" layer="21">IN+</text>
<text x="-6.35" y="-38.1" size="1.778" layer="21">OUT+</text>
<text x="-16.51" y="-38.1" size="1.778" layer="21">OUT-</text>
<text x="-16.51" y="-2.54" size="1.778" layer="21">IN-</text>
</package>
<package name="FEATHER">
<pad name="P$2" x="0" y="-7.62" drill="0.6" shape="long"/>
<wire x1="-1.27" y1="1.27" x2="21.59" y2="1.27" width="0.127" layer="21"/>
<pad name="P$1" x="0" y="-5.08" drill="0.6" shape="long"/>
<pad name="P$3" x="0" y="-10.16" drill="0.6" shape="long"/>
<pad name="P$4" x="0" y="-12.7" drill="0.6" shape="long"/>
<pad name="P$5" x="0" y="-15.24" drill="0.6" shape="long"/>
<pad name="P$6" x="0" y="-17.78" drill="0.6" shape="long"/>
<pad name="P$7" x="0" y="-20.32" drill="0.6" shape="long"/>
<pad name="P$8" x="0" y="-22.86" drill="0.6" shape="long"/>
<pad name="P$9" x="0" y="-25.4" drill="0.6" shape="long"/>
<pad name="P$10" x="0" y="-27.94" drill="0.6" shape="long"/>
<pad name="P$11" x="0" y="-30.48" drill="0.6" shape="long"/>
<pad name="P$12" x="0" y="-33.02" drill="0.6" shape="long"/>
<pad name="P$13" x="20.32" y="-5.08" drill="0.6" shape="long"/>
<pad name="P$14" x="20.32" y="-7.62" drill="0.6" shape="long"/>
<pad name="P$15" x="20.32" y="-10.16" drill="0.6" shape="long"/>
<pad name="P$16" x="20.32" y="-12.7" drill="0.6" shape="long"/>
<pad name="P$17" x="20.32" y="-15.24" drill="0.6" shape="long"/>
<pad name="P$18" x="20.32" y="-17.78" drill="0.6" shape="long"/>
<pad name="P$19" x="20.32" y="-20.32" drill="0.6" shape="long"/>
<pad name="P$20" x="20.32" y="-22.86" drill="0.6" shape="long"/>
<pad name="P$21" x="20.32" y="-25.4" drill="0.6" shape="long"/>
<pad name="P$22" x="20.32" y="-27.94" drill="0.6" shape="long"/>
<pad name="P$23" x="20.32" y="-30.48" drill="0.6" shape="long"/>
<pad name="P$24" x="20.32" y="-33.02" drill="0.6" shape="long"/>
<pad name="P$25" x="20.32" y="-35.56" drill="0.6" shape="long"/>
<pad name="P$26" x="20.32" y="-38.1" drill="0.6" shape="long"/>
<pad name="P$27" x="20.32" y="-40.64" drill="0.6" shape="long"/>
<pad name="P$28" x="20.32" y="-43.18" drill="0.6" shape="long"/>
<wire x1="21.59" y1="1.27" x2="21.59" y2="-49.53" width="0.127" layer="21"/>
<wire x1="21.59" y1="-49.53" x2="-1.27" y2="-49.53" width="0.127" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-49.53" width="0.127" layer="21"/>
<text x="1.27" y="-6.35" size="1.778" layer="21">D2/SDA</text>
<text x="1.27" y="-8.89" size="1.778" layer="21">D3/SCL</text>
<text x="1.27" y="-11.43" size="1.778" layer="21">D5</text>
<text x="1.27" y="-13.97" size="1.778" layer="21">D6</text>
<text x="1.27" y="-16.51" size="1.778" layer="21">D9</text>
<text x="1.27" y="-19.05" size="1.778" layer="21">D10</text>
<text x="1.27" y="-21.59" size="1.778" layer="21">D11</text>
<text x="1.27" y="-24.13" size="1.778" layer="21">D12</text>
<text x="1.27" y="-26.67" size="1.778" layer="21">D13</text>
<text x="1.27" y="-29.21" size="1.778" layer="21">VBUS</text>
<text x="1.27" y="-31.75" size="1.778" layer="21">EN</text>
<text x="1.27" y="-34.29" size="1.778" layer="21">VBAT</text>
<text x="12.7" y="-6.35" size="1.778" layer="21">GND</text>
<text x="11.43" y="-8.89" size="1.778" layer="21">D1/TX</text>
<text x="11.43" y="-11.43" size="1.778" layer="21">D0/RX</text>
<text x="11.43" y="-13.97" size="1.778" layer="21">MISO</text>
<text x="11.43" y="-16.51" size="1.778" layer="21">MOSI</text>
<text x="11.43" y="-19.05" size="1.778" layer="21">SCK</text>
<text x="13.97" y="-21.59" size="1.778" layer="21">A5</text>
<text x="13.97" y="-24.13" size="1.778" layer="21">A4</text>
<text x="13.97" y="-26.67" size="1.778" layer="21">A3</text>
<text x="13.97" y="-29.21" size="1.778" layer="21">A2</text>
<text x="13.97" y="-31.75" size="1.778" layer="21">A1</text>
<text x="13.97" y="-34.29" size="1.778" layer="21">A0</text>
<text x="12.7" y="-36.83" size="1.778" layer="21">GND</text>
<text x="12.7" y="-39.37" size="1.778" layer="21">ARF</text>
<text x="12.7" y="-41.91" size="1.778" layer="21">3.3V</text>
<text x="12.7" y="-44.45" size="1.778" layer="21">RST</text>
</package>
<package name="K96SENSOR">
<text x="-15.24" y="-11.43" size="1.27" layer="21">IOVCC</text>
<text x="-15.24" y="-13.97" size="1.27" layer="21">RXD</text>
<text x="-15.24" y="-16.51" size="1.27" layer="21">TXD</text>
<text x="2.54" y="-6.35" size="1.27" layer="21">EN_VBB</text>
<text x="0" y="-8.89" size="1.27" layer="21">IOVCC-REG</text>
<text x="5.08" y="-11.43" size="1.27" layer="21">NRDY</text>
<text x="5.08" y="-13.97" size="1.27" layer="21">PWM</text>
<pad name="P$1" x="-17.78" y="-5.08" drill="0.6" shape="long"/>
<pad name="P$2" x="-17.78" y="-7.62" drill="0.6" shape="long"/>
<pad name="P$3" x="-17.78" y="-10.16" drill="0.6" shape="long"/>
<pad name="P$4" x="-17.78" y="-12.7" drill="0.6" shape="long"/>
<pad name="P$5" x="-17.78" y="-15.24" drill="0.6" shape="long"/>
<wire x1="-17.78" y1="-2.54" x2="-20.32" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-20.32" y1="-2.54" x2="-20.32" y2="-27.94" width="0.127" layer="21"/>
<pad name="P$6" x="12.7" y="-5.08" drill="0.6" shape="long"/>
<pad name="P$7" x="12.7" y="-7.62" drill="0.6" shape="long"/>
<pad name="P$8" x="12.7" y="-10.16" drill="0.6" shape="long"/>
<pad name="P$9" x="12.7" y="-12.7" drill="0.6" shape="long"/>
<wire x1="25.4" y1="7.62" x2="25.4" y2="-27.94" width="0.127" layer="21"/>
<wire x1="-20.32" y1="-27.94" x2="25.4" y2="-27.94" width="0.127" layer="21"/>
<wire x1="-17.78" y1="-2.54" x2="-17.78" y2="7.62" width="0.127" layer="21"/>
<wire x1="-17.78" y1="7.62" x2="25.4" y2="7.62" width="0.127" layer="21"/>
<text x="-15.24" y="-5.08" size="1.27" layer="21">GND</text>
<text x="-15.24" y="-7.62" size="1.27" layer="21">VBB</text>
</package>
<package name="PIN">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-10.16" x2="2.54" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="5.08" width="0.1524" layer="21"/>
<pad name="P$1" x="0" y="-7.62" drill="0.6" shape="long"/>
<pad name="P$2" x="0" y="-5.08" drill="0.6" shape="long"/>
<pad name="P$3" x="0" y="-2.54" drill="0.6" shape="long"/>
<pad name="P$4" x="0" y="0" drill="0.6" shape="long"/>
<pad name="P$5" x="0" y="2.54" drill="0.6" shape="long"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.1524" layer="21"/>
</package>
<package name="POWERIN">
<wire x1="0" y1="0" x2="8.89" y2="0" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="8.89" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-13.97" x2="0" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="0" y1="-13.97" x2="0" y2="0" width="0.1524" layer="21"/>
<text x="0" y="-2.54" size="1.778" layer="21">power in</text>
<pad name="P$1" x="4.445" y="-13.97" drill="2.2098" diameter="2.032" shape="long"/>
<pad name="P$2" x="4.445" y="-7.62" drill="2.2098" diameter="2.032" shape="long"/>
<pad name="P$4" x="0" y="-10.795" drill="2.2098" diameter="2.032" shape="long"/>
</package>
</packages>
<symbols>
<symbol name="LM2956DC-DC">
<wire x1="-43.18" y1="15.24" x2="-43.18" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-43.18" y1="-2.54" x2="-12.7" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-12.7" y1="-2.54" x2="-12.7" y2="15.24" width="0.254" layer="94"/>
<wire x1="-12.7" y1="15.24" x2="-43.18" y2="15.24" width="0.254" layer="94"/>
<pin name="IN+" x="-48.26" y="12.7" length="middle"/>
<pin name="IN-" x="-48.26" y="0" length="middle"/>
<pin name="OUT+" x="-7.62" y="12.7" length="middle" rot="R180"/>
<pin name="OUT-" x="-7.62" y="0" length="middle" rot="R180"/>
<text x="-35.56" y="-7.62" size="1.27" layer="96">&gt;LM2596 DC-DC</text>
</symbol>
<symbol name="FEATHER">
<wire x1="-25.4" y1="27.94" x2="-25.4" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-25.4" y1="-25.4" x2="2.54" y2="-25.4" width="0.254" layer="94"/>
<wire x1="2.54" y1="-25.4" x2="2.54" y2="27.94" width="0.254" layer="94"/>
<wire x1="2.54" y1="27.94" x2="-25.4" y2="27.94" width="0.254" layer="94"/>
<pin name="RST" x="7.62" y="25.4" length="middle" rot="R180"/>
<pin name="3.3V" x="7.62" y="22.86" length="middle" rot="R180"/>
<pin name="AREF" x="7.62" y="20.32" length="middle" rot="R180"/>
<pin name="GND" x="7.62" y="17.78" length="middle" rot="R180"/>
<pin name="A0" x="7.62" y="15.24" length="middle" rot="R180"/>
<pin name="A1" x="7.62" y="12.7" length="middle" rot="R180"/>
<pin name="A2" x="7.62" y="10.16" length="middle" rot="R180"/>
<pin name="A3" x="7.62" y="7.62" length="middle" rot="R180"/>
<pin name="A4" x="7.62" y="5.08" length="middle" rot="R180"/>
<pin name="A5" x="7.62" y="2.54" length="middle" rot="R180"/>
<pin name="SCK" x="7.62" y="0" length="middle" rot="R180"/>
<pin name="MOSI" x="7.62" y="-2.54" length="middle" rot="R180"/>
<pin name="MISO" x="7.62" y="-5.08" length="middle" rot="R180"/>
<pin name="D0" x="7.62" y="-7.62" length="middle" rot="R180"/>
<pin name="D1" x="7.62" y="-10.16" length="middle" rot="R180"/>
<pin name="GND2" x="7.62" y="-12.7" length="middle" rot="R180"/>
<pin name="VBAT" x="-30.48" y="15.24" length="middle"/>
<pin name="EN" x="-30.48" y="12.7" length="middle"/>
<pin name="VBUS" x="-30.48" y="10.16" length="middle"/>
<pin name="D13" x="-30.48" y="7.62" length="middle"/>
<pin name="D12" x="-30.48" y="5.08" length="middle"/>
<pin name="D11" x="-30.48" y="2.54" length="middle"/>
<pin name="D10" x="-30.48" y="0" length="middle"/>
<pin name="D9" x="-30.48" y="-2.54" length="middle"/>
<pin name="D6" x="-30.48" y="-5.08" length="middle"/>
<pin name="D5" x="-30.48" y="-7.62" length="middle"/>
<pin name="D3" x="-30.48" y="-10.16" length="middle"/>
<pin name="D2" x="-30.48" y="-12.7" length="middle"/>
<text x="-15.24" y="-27.94" size="1.27" layer="96">&gt;feather</text>
</symbol>
<symbol name="K96SENSOR">
<wire x1="-17.78" y1="20.32" x2="-17.78" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-10.16" x2="25.4" y2="-10.16" width="0.254" layer="94"/>
<wire x1="25.4" y1="-10.16" x2="25.4" y2="20.32" width="0.254" layer="94"/>
<wire x1="25.4" y1="20.32" x2="-17.78" y2="20.32" width="0.254" layer="94"/>
<pin name="GND" x="-22.86" y="15.24" length="middle"/>
<pin name="VBB" x="-22.86" y="10.16" length="middle"/>
<pin name="IOVCC" x="-22.86" y="5.08" length="middle"/>
<pin name="RXD" x="-22.86" y="0" length="middle"/>
<pin name="TXD" x="-22.86" y="-5.08" length="middle"/>
<pin name="EN_VBB" x="30.48" y="15.24" length="middle" rot="R180"/>
<pin name="IOVCC_REG" x="30.48" y="7.62" length="middle" rot="R180"/>
<pin name="NRDY" x="30.48" y="2.54" length="middle" rot="R180"/>
<pin name="PWM" x="30.48" y="-5.08" length="middle" rot="R180"/>
<text x="-2.54" y="-12.7" size="1.778" layer="96">&gt;k96 Sensor</text>
</symbol>
<symbol name="PIN">
<wire x1="-27.94" y1="20.32" x2="-27.94" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-27.94" y1="7.62" x2="-20.32" y2="7.62" width="0.1524" layer="94"/>
<wire x1="-20.32" y1="7.62" x2="-20.32" y2="20.32" width="0.1524" layer="94"/>
<wire x1="-20.32" y1="20.32" x2="-27.94" y2="20.32" width="0.1524" layer="94"/>
<pin name="P$1" x="-15.24" y="9.525" length="middle" rot="R180"/>
<pin name="P$2" x="-15.24" y="12.065" length="middle" rot="R180"/>
<pin name="P$3" x="-15.24" y="14.605" length="middle" rot="R180"/>
<pin name="P$4" x="-15.24" y="17.145" length="middle" rot="R180"/>
<pin name="P$5" x="-15.24" y="19.3675" length="middle" rot="R180"/>
</symbol>
<symbol name="POWERIN">
<wire x1="-25.4" y1="2.54" x2="-7.62" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-25.4" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-25.4" y1="-10.16" x2="-25.4" y2="2.54" width="0.1524" layer="94"/>
<pin name="GND" x="-2.54" y="-5.08" length="middle" rot="R180"/>
<pin name="GND2" x="-2.54" y="-7.62" length="middle" rot="R180"/>
<pin name="VBB" x="-12.7" y="7.62" length="middle" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="DCDC" prefix="DCDC">
<gates>
<gate name="G$1" symbol="LM2956DC-DC" x="-5.08" y="-7.62"/>
</gates>
<devices>
<device name="" package="DCDC">
<connects>
<connect gate="G$1" pin="IN+" pad="P$2"/>
<connect gate="G$1" pin="IN-" pad="P$1"/>
<connect gate="G$1" pin="OUT+" pad="P$3"/>
<connect gate="G$1" pin="OUT-" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FEATHER" prefix="FEATHER">
<gates>
<gate name="G$1" symbol="FEATHER" x="-12.7" y="-2.54"/>
</gates>
<devices>
<device name="" package="FEATHER">
<connects>
<connect gate="G$1" pin="3.3V" pad="P$27"/>
<connect gate="G$1" pin="A0" pad="P$24"/>
<connect gate="G$1" pin="A1" pad="P$23"/>
<connect gate="G$1" pin="A2" pad="P$22"/>
<connect gate="G$1" pin="A3" pad="P$21"/>
<connect gate="G$1" pin="A4" pad="P$20"/>
<connect gate="G$1" pin="A5" pad="P$19"/>
<connect gate="G$1" pin="AREF" pad="P$26"/>
<connect gate="G$1" pin="D0" pad="P$15"/>
<connect gate="G$1" pin="D1" pad="P$14"/>
<connect gate="G$1" pin="D10" pad="P$6"/>
<connect gate="G$1" pin="D11" pad="P$7"/>
<connect gate="G$1" pin="D12" pad="P$8"/>
<connect gate="G$1" pin="D13" pad="P$9"/>
<connect gate="G$1" pin="D2" pad="P$1"/>
<connect gate="G$1" pin="D3" pad="P$2"/>
<connect gate="G$1" pin="D5" pad="P$3"/>
<connect gate="G$1" pin="D6" pad="P$4"/>
<connect gate="G$1" pin="D9" pad="P$5"/>
<connect gate="G$1" pin="EN" pad="P$11"/>
<connect gate="G$1" pin="GND" pad="P$25"/>
<connect gate="G$1" pin="GND2" pad="P$13"/>
<connect gate="G$1" pin="MISO" pad="P$16"/>
<connect gate="G$1" pin="MOSI" pad="P$17"/>
<connect gate="G$1" pin="RST" pad="P$28"/>
<connect gate="G$1" pin="SCK" pad="P$18"/>
<connect gate="G$1" pin="VBAT" pad="P$12"/>
<connect gate="G$1" pin="VBUS" pad="P$10"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="K96SENSOR" prefix="K96SENSOR">
<gates>
<gate name="G$1" symbol="K96SENSOR" x="-58.42" y="0"/>
</gates>
<devices>
<device name="" package="K96SENSOR">
<connects>
<connect gate="G$1" pin="EN_VBB" pad="P$6"/>
<connect gate="G$1" pin="GND" pad="P$1"/>
<connect gate="G$1" pin="IOVCC" pad="P$3"/>
<connect gate="G$1" pin="IOVCC_REG" pad="P$7"/>
<connect gate="G$1" pin="NRDY" pad="P$8"/>
<connect gate="G$1" pin="PWM" pad="P$9"/>
<connect gate="G$1" pin="RXD" pad="P$4"/>
<connect gate="G$1" pin="TXD" pad="P$5"/>
<connect gate="G$1" pin="VBB" pad="P$2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="PIN" prefix="PIN">
<gates>
<gate name="G$1" symbol="PIN" x="17.78" y="-5.08"/>
</gates>
<devices>
<device name="" package="PIN">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="POWER">
<gates>
<gate name="G$1" symbol="POWERIN" x="10.16" y="-15.24"/>
</gates>
<devices>
<device name="" package="POWERIN">
<connects>
<connect gate="G$1" pin="GND" pad="P$4"/>
<connect gate="G$1" pin="GND2" pad="P$2"/>
<connect gate="G$1" pin="VBB" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="DCDC1" library="untitled" deviceset="DCDC" device=""/>
<part name="FEATHER1" library="untitled" deviceset="FEATHER" device=""/>
<part name="K96SENSOR1" library="untitled" deviceset="K96SENSOR" device=""/>
<part name="PIN1" library="untitled" deviceset="PIN" device=""/>
<part name="PIN2" library="untitled" deviceset="PIN" device=""/>
<part name="U$1" library="untitled" deviceset="POWER" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-45.72" y="71.12" size="1.778" layer="96">D10-----RxD</text>
<text x="-45.72" y="68.58" size="1.778" layer="96">D11-----TxD</text>
<text x="-45.72" y="66.04" size="1.778" layer="96">D6-----------EN_VBB</text>
<text x="-45.72" y="63.5" size="1.778" layer="96">D5---------NRDY</text>
<text x="-45.72" y="76.2" size="1.778" layer="96">J1-1--------VCC</text>
<text x="-45.72" y="73.66" size="1.778" layer="96">J1-2--------GND</text>
</plain>
<instances>
<instance part="DCDC1" gate="G$1" x="80.01" y="76.2" smashed="yes"/>
<instance part="FEATHER1" gate="G$1" x="121.92" y="78.74" smashed="yes"/>
<instance part="K96SENSOR1" gate="G$1" x="58.42" y="29.21" smashed="yes"/>
<instance part="PIN1" gate="G$1" x="7.62" y="83.82" smashed="yes"/>
<instance part="PIN2" gate="G$1" x="7.62" y="66.04" smashed="yes"/>
<instance part="U$1" gate="G$1" x="-20.32" y="40.64" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<wire x1="2.54" y1="76.2" x2="11.43" y2="76.2" width="0.1524" layer="91"/>
<wire x1="11.43" y1="76.2" x2="11.43" y2="88.9" width="0.1524" layer="91"/>
<pinref part="DCDC1" gate="G$1" pin="IN+"/>
<wire x1="11.43" y1="88.9" x2="22.86" y2="88.9" width="0.1524" layer="91"/>
<pinref part="K96SENSOR1" gate="G$1" pin="VBB"/>
<wire x1="22.86" y1="88.9" x2="31.75" y2="88.9" width="0.1524" layer="91"/>
<wire x1="35.56" y1="39.37" x2="30.48" y2="39.37" width="0.1524" layer="91"/>
<wire x1="30.48" y1="39.37" x2="30.48" y2="66.04" width="0.1524" layer="91"/>
<wire x1="30.48" y1="66.04" x2="22.86" y2="66.04" width="0.1524" layer="91"/>
<wire x1="22.86" y1="66.04" x2="22.86" y2="88.9" width="0.1524" layer="91"/>
<junction x="22.86" y="88.9"/>
<wire x1="2.54" y1="48.26" x2="2.54" y2="75.565" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="48.26" x2="2.54" y2="48.26" width="0.1524" layer="91"/>
<pinref part="PIN2" gate="G$1" pin="P$1"/>
<wire x1="-7.62" y1="75.565" x2="2.54" y2="75.565" width="0.1524" layer="91"/>
<wire x1="2.54" y1="75.565" x2="2.54" y2="76.2" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="VBB"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="DCDC1" gate="G$1" pin="IN-"/>
<wire x1="31.75" y1="76.2" x2="31.75" y2="78.74" width="0.1524" layer="91"/>
<wire x1="31.75" y1="78.74" x2="20.32" y2="78.74" width="0.1524" layer="91"/>
<pinref part="DCDC1" gate="G$1" pin="OUT-"/>
<wire x1="20.32" y1="78.74" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
<wire x1="17.78" y1="78.74" x2="13.97" y2="78.74" width="0.1524" layer="91"/>
<wire x1="13.97" y1="78.74" x2="10.16" y2="78.74" width="0.1524" layer="91"/>
<wire x1="10.16" y1="78.74" x2="5.08" y2="78.74" width="0.1524" layer="91"/>
<wire x1="5.08" y1="78.74" x2="2.54" y2="78.74" width="0.1524" layer="91"/>
<wire x1="72.39" y1="76.2" x2="72.39" y2="60.96" width="0.1524" layer="91"/>
<wire x1="72.39" y1="60.96" x2="20.32" y2="60.96" width="0.1524" layer="91"/>
<wire x1="20.32" y1="60.96" x2="20.32" y2="78.74" width="0.1524" layer="91"/>
<junction x="20.32" y="78.74"/>
<pinref part="FEATHER1" gate="G$1" pin="GND2"/>
<wire x1="129.54" y1="66.04" x2="129.54" y2="46.99" width="0.1524" layer="91"/>
<wire x1="129.54" y1="46.99" x2="92.71" y2="46.99" width="0.1524" layer="91"/>
<wire x1="92.71" y1="46.99" x2="92.71" y2="54.61" width="0.1524" layer="91"/>
<wire x1="92.71" y1="54.61" x2="13.97" y2="54.61" width="0.1524" layer="91"/>
<wire x1="13.97" y1="54.61" x2="13.97" y2="78.74" width="0.1524" layer="91"/>
<junction x="13.97" y="78.74"/>
<pinref part="K96SENSOR1" gate="G$1" pin="GND"/>
<wire x1="35.56" y1="44.45" x2="17.78" y2="44.45" width="0.1524" layer="91"/>
<wire x1="17.78" y1="44.45" x2="17.78" y2="78.74" width="0.1524" layer="91"/>
<junction x="17.78" y="78.74"/>
<wire x1="5.08" y1="35.56" x2="5.08" y2="78.74" width="0.1524" layer="91"/>
<junction x="5.08" y="78.74"/>
<wire x1="-22.86" y1="33.02" x2="10.16" y2="33.02" width="0.1524" layer="91"/>
<wire x1="10.16" y1="33.02" x2="10.16" y2="78.74" width="0.1524" layer="91"/>
<junction x="10.16" y="78.74"/>
<wire x1="-22.86" y1="35.56" x2="5.08" y2="35.56" width="0.1524" layer="91"/>
<pinref part="PIN2" gate="G$1" pin="P$2"/>
<wire x1="-7.62" y1="78.105" x2="2.54" y2="78.105" width="0.1524" layer="91"/>
<wire x1="2.54" y1="78.105" x2="2.54" y2="78.74" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="GND"/>
<pinref part="U$1" gate="G$1" pin="GND2"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="FEATHER1" gate="G$1" pin="VBAT"/>
<wire x1="91.44" y1="93.98" x2="76.2" y2="93.98" width="0.1524" layer="91"/>
<wire x1="76.2" y1="93.98" x2="76.2" y2="88.9" width="0.1524" layer="91"/>
<pinref part="DCDC1" gate="G$1" pin="OUT+"/>
<wire x1="76.2" y1="88.9" x2="72.39" y2="88.9" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="K96SENSOR1" gate="G$1" pin="IOVCC"/>
<wire x1="35.56" y1="34.29" x2="33.02" y2="34.29" width="0.1524" layer="91"/>
<wire x1="33.02" y1="34.29" x2="33.02" y2="63.5" width="0.1524" layer="91"/>
<wire x1="33.02" y1="63.5" x2="78.74" y2="63.5" width="0.1524" layer="91"/>
<wire x1="78.74" y1="63.5" x2="78.74" y2="111.76" width="0.1524" layer="91"/>
<wire x1="78.74" y1="111.76" x2="134.62" y2="111.76" width="0.1524" layer="91"/>
<pinref part="FEATHER1" gate="G$1" pin="3.3V"/>
<wire x1="134.62" y1="111.76" x2="134.62" y2="101.6" width="0.1524" layer="91"/>
<wire x1="134.62" y1="101.6" x2="129.54" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="K96SENSOR1" gate="G$1" pin="RXD"/>
<wire x1="35.56" y1="29.21" x2="27.94" y2="29.21" width="0.1524" layer="91"/>
<wire x1="27.94" y1="29.21" x2="27.94" y2="58.42" width="0.1524" layer="91"/>
<wire x1="27.94" y1="58.42" x2="83.82" y2="58.42" width="0.1524" layer="91"/>
<wire x1="83.82" y1="58.42" x2="83.82" y2="78.74" width="0.1524" layer="91"/>
<pinref part="FEATHER1" gate="G$1" pin="D10"/>
<wire x1="83.82" y1="78.74" x2="91.44" y2="78.74" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="K96SENSOR1" gate="G$1" pin="TXD"/>
<wire x1="35.56" y1="24.13" x2="22.86" y2="24.13" width="0.1524" layer="91"/>
<wire x1="22.86" y1="24.13" x2="22.86" y2="53.34" width="0.1524" layer="91"/>
<wire x1="22.86" y1="53.34" x2="86.36" y2="53.34" width="0.1524" layer="91"/>
<wire x1="86.36" y1="53.34" x2="86.36" y2="81.28" width="0.1524" layer="91"/>
<pinref part="FEATHER1" gate="G$1" pin="D11"/>
<wire x1="86.36" y1="81.28" x2="91.44" y2="81.28" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="K96SENSOR1" gate="G$1" pin="EN_VBB"/>
<pinref part="FEATHER1" gate="G$1" pin="D6"/>
<wire x1="88.9" y1="44.45" x2="88.9" y2="73.66" width="0.1524" layer="91"/>
<wire x1="88.9" y1="73.66" x2="91.44" y2="73.66" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="K96SENSOR1" gate="G$1" pin="NRDY"/>
<wire x1="88.9" y1="31.75" x2="91.44" y2="31.75" width="0.1524" layer="91"/>
<wire x1="91.44" y1="31.75" x2="91.44" y2="55.88" width="0.1524" layer="91"/>
<wire x1="91.44" y1="55.88" x2="81.28" y2="55.88" width="0.1524" layer="91"/>
<wire x1="81.28" y1="55.88" x2="81.28" y2="71.12" width="0.1524" layer="91"/>
<pinref part="FEATHER1" gate="G$1" pin="D5"/>
<wire x1="81.28" y1="71.12" x2="91.44" y2="71.12" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
