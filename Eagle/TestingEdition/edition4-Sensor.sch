<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.025" unitdist="inch" unit="inch" style="lines" multiple="1" display="yes" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="24" fill="1" visible="no" active="no"/>
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
<package name="K96SENSOR">
<text x="-15.24" y="-11.43" size="1.27" layer="21">IOVCC</text>
<text x="-15.24" y="-13.97" size="1.27" layer="21">RXD</text>
<text x="-15.24" y="-16.51" size="1.27" layer="21">TXD</text>
<text x="2.54" y="-6.35" size="1.27" layer="21">EN_VBB</text>
<text x="0" y="-8.89" size="1.27" layer="21">IOVCC-REG</text>
<text x="5.08" y="-11.43" size="1.27" layer="21">NRDY</text>
<text x="5.08" y="-13.97" size="1.27" layer="21">PWM</text>
<wire x1="-17.78" y1="-2.54" x2="-20.32" y2="-2.54" width="0.127" layer="21"/>
<wire x1="-20.32" y1="-2.54" x2="-20.32" y2="-27.94" width="0.127" layer="21"/>
<wire x1="25.4" y1="7.62" x2="25.4" y2="-27.94" width="0.127" layer="21"/>
<wire x1="-20.32" y1="-27.94" x2="25.4" y2="-27.94" width="0.127" layer="21"/>
<wire x1="-17.78" y1="-2.54" x2="-17.78" y2="7.62" width="0.127" layer="21"/>
<wire x1="-17.78" y1="7.62" x2="25.4" y2="7.62" width="0.127" layer="21"/>
<text x="-15.24" y="-5.08" size="1.27" layer="21">GND</text>
<text x="-15.24" y="-7.62" size="1.27" layer="21">VBB</text>
<pad name="P$1" x="-17.78" y="-5.08" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$2" x="-17.78" y="-7.62" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$3" x="-17.78" y="-10.16" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$4" x="-17.78" y="-12.7" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$5" x="-17.78" y="-15.24" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$9" x="12.7" y="-12.7" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$6" x="12.7" y="-5.08" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$7" x="12.7" y="-7.62" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$8" x="12.7" y="-10.16" drill="0.9" diameter="1.143" shape="long"/>
</package>
<package name="9FEETPIN">
<pad name="P$1" x="0" y="2.54" drill="0.9" shape="long"/>
<pad name="P$2" x="0" y="0" drill="0.9" shape="long"/>
<pad name="P$3" x="0" y="-2.54" drill="0.9" shape="long"/>
<pad name="P$4" x="0" y="-5.08" drill="0.9" shape="long"/>
<pad name="P$5" x="0" y="-7.62" drill="0.9" shape="long"/>
<pad name="P$6" x="0" y="-10.16" drill="0.9" shape="long"/>
<pad name="P$7" x="0" y="-12.7" drill="0.9" shape="long"/>
<pad name="P$8" x="0" y="-15.24" drill="0.9" shape="long"/>
<pad name="P$9" x="0" y="-17.78" drill="0.9" shape="long"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="2.54" y1="5.08" x2="2.54" y2="-20.32" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-20.32" x2="-2.54" y2="-20.32" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-20.32" x2="-2.54" y2="5.08" width="0.1524" layer="21"/>
</package>
</packages>
<symbols>
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
<symbol name="9XFEETPIN">
<pin name="P$1" x="10.16" y="15.24" length="middle" rot="R180"/>
<pin name="P$2" x="10.16" y="12.7" length="middle" rot="R180"/>
<pin name="P$3" x="10.16" y="10.16" length="middle" rot="R180"/>
<pin name="P$4" x="10.16" y="7.62" length="middle" rot="R180"/>
<pin name="P$5" x="10.16" y="5.08" length="middle" rot="R180"/>
<pin name="P$6" x="10.16" y="2.54" length="middle" rot="R180"/>
<pin name="P$7" x="10.16" y="0" length="middle" rot="R180"/>
<pin name="P$8" x="10.16" y="-2.54" length="middle" rot="R180"/>
<pin name="P$9" x="10.16" y="-5.08" length="middle" rot="R180"/>
<wire x1="-2.54" y1="17.78" x2="5.08" y2="17.78" width="0.1524" layer="94"/>
<wire x1="5.08" y1="17.78" x2="5.08" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="5.08" y1="-7.62" x2="-2.54" y2="-7.62" width="0.1524" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-2.54" y2="17.78" width="0.1524" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="K96SENSOR">
<gates>
<gate name="G$1" symbol="K96SENSOR" x="-7.62" y="2.54"/>
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
<deviceset name="9FEETPIN">
<gates>
<gate name="G$1" symbol="9XFEETPIN" x="-7.62" y="-10.16"/>
</gates>
<devices>
<device name="" package="9FEETPIN">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$2" pad="P$2"/>
<connect gate="G$1" pin="P$3" pad="P$3"/>
<connect gate="G$1" pin="P$4" pad="P$4"/>
<connect gate="G$1" pin="P$5" pad="P$5"/>
<connect gate="G$1" pin="P$6" pad="P$6"/>
<connect gate="G$1" pin="P$7" pad="P$7"/>
<connect gate="G$1" pin="P$8" pad="P$8"/>
<connect gate="G$1" pin="P$9" pad="P$9"/>
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
<part name="U$1" library="untitled" deviceset="K96SENSOR" device=""/>
<part name="U$2" library="untitled" deviceset="9FEETPIN" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-33.02" y="162.56" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="160.02" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="157.48" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="154.94" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="152.4" size="1.4224" layer="95">GND</text>
<text x="-33.655" y="114.935" size="1.4224" layer="95">DC 12V</text>
<text x="-29.845" y="113.03" size="1.4224" layer="95">7V</text>
<text x="-29.845" y="110.49" size="1.4224" layer="95">5V</text>
<text x="-30.48" y="107.95" size="1.4224" layer="95">3.3V</text>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="19.05" y="43.18" smashed="yes"/>
<instance part="U$2" gate="G$1" x="100.965" y="41.275" smashed="yes" rot="MR0"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="GND"/>
<wire x1="-3.81" y1="58.42" x2="-3.81" y2="79.375" width="0.1524" layer="91"/>
<wire x1="-3.81" y1="79.375" x2="86.36" y2="79.375" width="0.1524" layer="91"/>
<wire x1="86.36" y1="79.375" x2="86.36" y2="57.15" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$1"/>
<wire x1="86.36" y1="57.15" x2="90.805" y2="57.15" width="0.1524" layer="91"/>
<wire x1="90.805" y1="57.15" x2="90.805" y2="56.515" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="VBB"/>
<wire x1="-3.81" y1="53.34" x2="-8.89" y2="53.34" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="53.34" x2="-8.89" y2="74.93" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="74.93" x2="82.55" y2="74.93" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$2"/>
<wire x1="82.55" y1="74.93" x2="82.55" y2="53.975" width="0.1524" layer="91"/>
<wire x1="82.55" y1="53.975" x2="90.805" y2="53.975" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="IOVCC"/>
<wire x1="-3.81" y1="48.26" x2="-11.43" y2="48.26" width="0.1524" layer="91"/>
<wire x1="-11.43" y1="48.26" x2="-11.43" y2="16.51" width="0.1524" layer="91"/>
<wire x1="-11.43" y1="16.51" x2="90.805" y2="16.51" width="0.1524" layer="91"/>
<wire x1="90.805" y1="16.51" x2="90.805" y2="27.305" width="0.1524" layer="91"/>
<wire x1="90.805" y1="27.305" x2="78.74" y2="27.305" width="0.1524" layer="91"/>
<wire x1="78.74" y1="27.305" x2="78.74" y2="51.435" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$3"/>
<wire x1="78.74" y1="51.435" x2="90.805" y2="51.435" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="RXD"/>
<wire x1="-3.81" y1="43.18" x2="-8.89" y2="43.18" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="43.18" x2="-8.89" y2="21.59" width="0.1524" layer="91"/>
<wire x1="-8.89" y1="21.59" x2="83.82" y2="21.59" width="0.1524" layer="91"/>
<wire x1="83.82" y1="21.59" x2="83.82" y2="48.895" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$4"/>
<wire x1="83.82" y1="48.895" x2="90.805" y2="48.895" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="TXD"/>
<wire x1="-3.81" y1="38.1" x2="-6.35" y2="38.1" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="38.1" x2="-6.35" y2="24.765" width="0.1524" layer="91"/>
<wire x1="-6.35" y1="24.765" x2="86.995" y2="24.765" width="0.1524" layer="91"/>
<wire x1="86.995" y1="24.765" x2="86.995" y2="46.99" width="0.1524" layer="91"/>
<wire x1="86.995" y1="46.99" x2="86.36" y2="46.99" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$5"/>
<wire x1="86.995" y1="46.99" x2="90.805" y2="46.99" width="0.1524" layer="91"/>
<wire x1="90.805" y1="46.99" x2="90.805" y2="46.355" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="EN_VBB"/>
<wire x1="49.53" y1="58.42" x2="69.215" y2="58.42" width="0.1524" layer="91"/>
<wire x1="69.215" y1="58.42" x2="69.215" y2="43.815" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$6"/>
<wire x1="69.215" y1="43.815" x2="90.805" y2="43.815" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="IOVCC_REG"/>
<wire x1="49.53" y1="50.8" x2="66.675" y2="50.8" width="0.1524" layer="91"/>
<wire x1="66.675" y1="50.8" x2="66.675" y2="40.005" width="0.1524" layer="91"/>
<wire x1="66.675" y1="40.005" x2="81.915" y2="40.005" width="0.1524" layer="91"/>
<wire x1="81.915" y1="40.005" x2="81.915" y2="41.275" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$7"/>
<wire x1="81.915" y1="41.275" x2="90.805" y2="41.275" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="NRDY"/>
<wire x1="49.53" y1="45.72" x2="63.5" y2="45.72" width="0.1524" layer="91"/>
<wire x1="63.5" y1="45.72" x2="63.5" y2="37.465" width="0.1524" layer="91"/>
<wire x1="63.5" y1="37.465" x2="85.09" y2="37.465" width="0.1524" layer="91"/>
<wire x1="85.09" y1="37.465" x2="85.09" y2="38.735" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$8"/>
<wire x1="85.09" y1="38.735" x2="90.805" y2="38.735" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="PWM"/>
<wire x1="49.53" y1="38.1" x2="61.595" y2="38.1" width="0.1524" layer="91"/>
<wire x1="61.595" y1="38.1" x2="61.595" y2="34.29" width="0.1524" layer="91"/>
<wire x1="61.595" y1="34.29" x2="89.535" y2="34.29" width="0.1524" layer="91"/>
<wire x1="89.535" y1="34.29" x2="89.535" y2="36.195" width="0.1524" layer="91"/>
<pinref part="U$2" gate="G$1" pin="P$9"/>
<wire x1="89.535" y1="36.195" x2="90.805" y2="36.195" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
