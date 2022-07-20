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
<package name="PIN">
<wire x1="-2.54" y1="5.08" x2="-2.54" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-10.16" x2="2.54" y2="-10.16" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-10.16" x2="2.54" y2="5.08" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="5.08" x2="2.54" y2="5.08" width="0.1524" layer="21"/>
<pad name="P$1" x="0" y="-7.62" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$2" x="0" y="-5.08" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$3" x="0" y="-2.54" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$4" x="0" y="0" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$5" x="0" y="2.54" drill="0.9" diameter="1.143" shape="long"/>
</package>
<package name="POWERIN">
<wire x1="0" y1="0" x2="8.89" y2="0" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="8.89" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-13.97" x2="0" y2="-13.97" width="0.1524" layer="21"/>
<wire x1="0" y1="-13.97" x2="0" y2="0" width="0.1524" layer="21"/>
<text x="0" y="-2.54" size="1.778" layer="21">power in</text>
<pad name="P$3" x="0" y="-10.795" drill="2.54" diameter="3.81"/>
<pad name="P$2" x="4.445" y="-7.62" drill="2.54" diameter="3.81"/>
<pad name="P$1" x="4.445" y="-13.97" drill="2.54" diameter="3.81"/>
</package>
<package name="MH-MINI-360">
<wire x1="0" y1="0" x2="18" y2="0" width="0.1524" layer="21"/>
<wire x1="18" y1="0" x2="18" y2="-11" width="0.1524" layer="21"/>
<wire x1="18" y1="-11" x2="0" y2="-11" width="0.1524" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="-11" width="0.1524" layer="21"/>
<text x="2.54" y="-1.27" size="0.6096" layer="21">IN-</text>
<text x="2.54" y="-10.16" size="0.6096" layer="21">IN+</text>
<text x="13.97" y="-1.27" size="0.6096" layer="21">OUT-</text>
<text x="13.97" y="-10.16" size="0.6096" layer="21">OUT+</text>
<pad name="P$1" x="17.25" y="-0.75" drill="0.9" diameter="1.143"/>
<pad name="P$2" x="17.25" y="-10.25" drill="0.9" diameter="1.143"/>
<pad name="P$3" x="0.75" y="-0.75" drill="0.9" diameter="1.143"/>
<pad name="P$4" x="0.75" y="-10.25" drill="0.9" diameter="1.143"/>
</package>
<package name="FEATHER">
<wire x1="-1.27" y1="1.27" x2="21.59" y2="1.27" width="0.127" layer="21"/>
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
<pad name="P$1" x="0" y="-5.08" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$2" x="0" y="-7.62" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$3" x="0" y="-10.16" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$4" x="0" y="-12.7" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$5" x="0" y="-15.24" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$6" x="0" y="-17.78" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$7" x="0" y="-20.32" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$8" x="0" y="-22.86" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$9" x="0" y="-25.4" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$10" x="0" y="-27.94" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$11" x="0" y="-30.48" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$12" x="0" y="-33.02" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$13" x="20.32" y="-5.08" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$14" x="20.32" y="-7.62" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$15" x="20.32" y="-10.16" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$16" x="20.32" y="-12.7" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$17" x="20.32" y="-15.24" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$18" x="20.32" y="-17.78" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$19" x="20.32" y="-20.32" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$20" x="20.32" y="-22.86" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$21" x="20.32" y="-25.4" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$22" x="20.32" y="-27.94" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$23" x="20.32" y="-30.48" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$24" x="20.32" y="-33.02" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$25" x="20.32" y="-35.56" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$26" x="20.32" y="-38.1" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$27" x="20.32" y="-40.64" drill="0.9" diameter="1.143" shape="long"/>
<pad name="P$28" x="20.32" y="-43.18" drill="0.9" diameter="1.143" shape="long"/>
</package>
<package name="RASPBERRYPI">
<wire x1="0" y1="0" x2="0" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="0" y1="-3.81" x2="0" y2="-8.89" width="0.1524" layer="21"/>
<wire x1="0" y1="-8.89" x2="0" y2="-33.528" width="0.1524" layer="21"/>
<wire x1="0" y1="-33.528" x2="8.89" y2="-33.528" width="0.1524" layer="21"/>
<wire x1="8.89" y1="-33.528" x2="59.69" y2="-33.528" width="0.1524" layer="21"/>
<wire x1="59.69" y1="-33.528" x2="68.326" y2="-33.528" width="0.1524" layer="21"/>
<wire x1="68.326" y1="-33.528" x2="68.326" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="68.326" y1="-3.81" x2="68.326" y2="0" width="0.1524" layer="21"/>
<wire x1="68.326" y1="0" x2="59.69" y2="0" width="0.1524" layer="21"/>
<wire x1="59.69" y1="0" x2="8.89" y2="0" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="0" y2="0" width="0.1524" layer="21"/>
<wire x1="0" y1="-3.81" x2="68.326" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="0" y1="-8.89" x2="68.58" y2="-8.89" width="0.1524" layer="21"/>
<wire x1="8.89" y1="0" x2="8.89" y2="-33.528" width="0.1524" layer="21"/>
<wire x1="59.69" y1="0" x2="59.69" y2="-33.528" width="0.1524" layer="21"/>
<text x="19.304" y="-3.302" size="0.508" layer="21">RxD/10</text>
<text x="9.398" y="-3.302" size="0.508" layer="21">5V/02</text>
<text x="11.684" y="-3.302" size="0.508" layer="21">5V/04</text>
<text x="14.224" y="-3.302" size="0.508" layer="21">GND/06</text>
<text x="17.018" y="-3.302" size="0.508" layer="21">TxD/08</text>
<text x="22.352" y="-3.302" size="0.508" layer="21">12</text>
<text x="24.892" y="-3.302" size="0.508" layer="21">14</text>
<text x="27.432" y="-3.302" size="0.508" layer="21">16</text>
<text x="29.972" y="-3.302" size="0.508" layer="21">18</text>
<text x="32.512" y="-3.302" size="0.508" layer="21">20</text>
<text x="35.052" y="-3.302" size="0.508" layer="21">22</text>
<text x="37.846" y="-3.302" size="0.508" layer="21">24</text>
<text x="40.386" y="-3.302" size="0.508" layer="21">26</text>
<text x="42.926" y="-3.302" size="0.508" layer="21">28</text>
<text x="45.466" y="-3.302" size="0.508" layer="21">30</text>
<text x="48.006" y="-3.302" size="0.508" layer="21">32</text>
<text x="50.546" y="-3.302" size="0.508" layer="21">34</text>
<text x="53.086" y="-3.302" size="0.508" layer="21">36</text>
<text x="55.626" y="-3.302" size="0.508" layer="21">38</text>
<text x="58.166" y="-3.302" size="0.508" layer="21">40</text>
<text x="9.398" y="-9.652" size="0.508" layer="21">3.3V/01</text>
<text x="12.7" y="-9.652" size="0.508" layer="21">03</text>
<text x="14.732" y="-9.652" size="0.508" layer="21">05</text>
<text x="17.526" y="-9.652" size="0.508" layer="21">07</text>
<text x="20.066" y="-9.652" size="0.508" layer="21">09</text>
<text x="22.606" y="-9.652" size="0.508" layer="21">11</text>
<text x="25.146" y="-9.652" size="0.508" layer="21">13</text>
<text x="27.686" y="-9.652" size="0.508" layer="21">15</text>
<text x="30.226" y="-9.652" size="0.508" layer="21">17</text>
<text x="32.766" y="-9.652" size="0.508" layer="21">19</text>
<text x="35.306" y="-9.652" size="0.508" layer="21">21</text>
<text x="37.846" y="-9.652" size="0.508" layer="21">23</text>
<text x="40.386" y="-9.652" size="0.508" layer="21">25</text>
<text x="42.926" y="-9.652" size="0.508" layer="21">27</text>
<text x="45.72" y="-9.652" size="0.508" layer="21">29</text>
<text x="48.006" y="-9.652" size="0.508" layer="21">31</text>
<text x="50.546" y="-9.652" size="0.508" layer="21">33</text>
<text x="53.086" y="-9.652" size="0.508" layer="21">35</text>
<text x="55.626" y="-9.652" size="0.508" layer="21">37</text>
<text x="58.166" y="-9.652" size="0.508" layer="21">39</text>
<pad name="P$21" x="10.16" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$1" x="10.16" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$2" x="12.7" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$3" x="15.24" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$4" x="17.78" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$5" x="20.32" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$6" x="22.86" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$7" x="25.4" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$8" x="27.94" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$9" x="30.48" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$10" x="33.02" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$11" x="35.56" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$12" x="38.1" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$13" x="40.64" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$14" x="43.18" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$15" x="45.72" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$16" x="48.26" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$17" x="50.8" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$18" x="53.34" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$19" x="55.88" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$20" x="58.42" y="-5.08" drill="0.9" diameter="1.143"/>
<pad name="P$22" x="12.7" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$23" x="15.24" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$24" x="17.78" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$25" x="20.32" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$26" x="22.86" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$27" x="25.4" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$28" x="27.94" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$29" x="30.48" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$30" x="33.02" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$31" x="35.56" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$32" x="38.1" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$33" x="40.64" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$34" x="43.18" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$35" x="45.72" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$36" x="48.26" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$37" x="50.8" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$38" x="53.34" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$39" x="55.88" y="-7.62" drill="0.9" diameter="1.143"/>
<pad name="P$40" x="58.42" y="-7.62" drill="0.9" diameter="1.143"/>
</package>
</packages>
<symbols>
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
<symbol name="MH-MINI-360">
<wire x1="-7.62" y1="7.62" x2="-7.62" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="7.62" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="7.62" y1="-10.16" x2="7.62" y2="7.62" width="0.1524" layer="94"/>
<wire x1="7.62" y1="7.62" x2="-7.62" y2="7.62" width="0.1524" layer="94"/>
<pin name="OUT-" x="12.7" y="5.08" length="middle" rot="R180"/>
<pin name="OUT+" x="12.7" y="-7.62" length="middle" rot="R180"/>
<pin name="IN-" x="-12.7" y="5.08" length="middle"/>
<pin name="IN+" x="-12.7" y="-7.62" length="middle"/>
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
<symbol name="RASPBERRYPI">
<wire x1="-40.64" y1="20.32" x2="-15.24" y2="20.32" width="0.1524" layer="94"/>
<pin name="5V/02" x="-10.16" y="17.78" length="middle" rot="R180"/>
<pin name="5V/04" x="-10.16" y="15.24" length="middle" rot="R180"/>
<pin name="GND/06" x="-10.16" y="12.7" length="middle" rot="R180"/>
<pin name="TXD/08" x="-10.16" y="10.16" length="middle" rot="R180"/>
<pin name="RXD/10" x="-10.16" y="7.62" length="middle" rot="R180"/>
<pin name="12" x="-10.16" y="5.08" length="middle" rot="R180"/>
<pin name="14" x="-10.16" y="2.54" length="middle" rot="R180"/>
<pin name="16" x="-10.16" y="0" length="middle" rot="R180"/>
<pin name="18" x="-10.16" y="-2.54" length="middle" rot="R180"/>
<pin name="20" x="-10.16" y="-5.08" length="middle" rot="R180"/>
<pin name="22" x="-10.16" y="-7.62" length="middle" rot="R180"/>
<pin name="24" x="-10.16" y="-10.16" length="middle" rot="R180"/>
<pin name="26" x="-10.16" y="-12.7" length="middle" rot="R180"/>
<pin name="28" x="-10.16" y="-15.24" length="middle" rot="R180"/>
<pin name="30" x="-10.16" y="-17.78" length="middle" rot="R180"/>
<pin name="32" x="-10.16" y="-20.32" length="middle" rot="R180"/>
<pin name="34" x="-10.16" y="-22.86" length="middle" rot="R180"/>
<pin name="36" x="-10.16" y="-25.4" length="middle" rot="R180"/>
<pin name="38" x="-10.16" y="-27.94" length="middle" rot="R180"/>
<pin name="40" x="-10.16" y="-30.48" length="middle" rot="R180"/>
<wire x1="-15.24" y1="20.32" x2="-15.24" y2="-33.02" width="0.1524" layer="94"/>
<wire x1="-15.24" y1="-33.02" x2="-40.64" y2="-33.02" width="0.1524" layer="94"/>
<wire x1="-40.64" y1="-33.02" x2="-40.64" y2="20.32" width="0.1524" layer="94"/>
<pin name="3.3V/01" x="-45.72" y="17.78" length="middle"/>
<pin name="03" x="-45.72" y="15.24" length="middle"/>
<pin name="05" x="-45.72" y="12.7" length="middle"/>
<pin name="07" x="-45.72" y="10.16" length="middle"/>
<pin name="09" x="-45.72" y="7.62" length="middle"/>
<pin name="11" x="-45.72" y="5.08" length="middle"/>
<pin name="13" x="-45.72" y="2.54" length="middle"/>
<pin name="15" x="-45.72" y="0" length="middle"/>
<pin name="17" x="-45.72" y="-2.54" length="middle"/>
<pin name="19" x="-45.72" y="-5.08" length="middle"/>
<pin name="21" x="-45.72" y="-7.62" length="middle"/>
<pin name="25" x="-45.72" y="-12.7" length="middle"/>
<pin name="23" x="-45.72" y="-10.16" length="middle"/>
<pin name="27" x="-45.72" y="-15.24" length="middle"/>
<pin name="29" x="-45.72" y="-17.78" length="middle"/>
<pin name="31" x="-45.72" y="-20.32" length="middle"/>
<pin name="33" x="-45.72" y="-22.86" length="middle"/>
<pin name="35" x="-45.72" y="-25.4" length="middle"/>
<pin name="37" x="-45.72" y="-27.94" length="middle"/>
<pin name="39" x="-45.72" y="-30.48" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="PIN">
<gates>
<gate name="G$1" symbol="PIN" x="-2.54" y="2.54"/>
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
<gate name="G$1" symbol="POWERIN" x="-5.08" y="-5.08"/>
</gates>
<devices>
<device name="" package="POWERIN">
<connects>
<connect gate="G$1" pin="GND" pad="P$3"/>
<connect gate="G$1" pin="GND2" pad="P$2"/>
<connect gate="G$1" pin="VBB" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MH-MINI-360">
<gates>
<gate name="G$1" symbol="MH-MINI-360" x="0" y="5.08"/>
</gates>
<devices>
<device name="" package="MH-MINI-360">
<connects>
<connect gate="G$1" pin="IN+" pad="P$4"/>
<connect gate="G$1" pin="IN-" pad="P$3"/>
<connect gate="G$1" pin="OUT+" pad="P$2"/>
<connect gate="G$1" pin="OUT-" pad="P$1"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FEATHER">
<gates>
<gate name="G$1" symbol="FEATHER" x="-2.54" y="2.54"/>
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
<deviceset name="RASPBERRYPI">
<gates>
<gate name="G$1" symbol="RASPBERRYPI" x="10.16" y="10.16"/>
</gates>
<devices>
<device name="" package="RASPBERRYPI">
<connects>
<connect gate="G$1" pin="03" pad="P$22"/>
<connect gate="G$1" pin="05" pad="P$23"/>
<connect gate="G$1" pin="07" pad="P$24"/>
<connect gate="G$1" pin="09" pad="P$25"/>
<connect gate="G$1" pin="11" pad="P$26"/>
<connect gate="G$1" pin="12" pad="P$6"/>
<connect gate="G$1" pin="13" pad="P$27"/>
<connect gate="G$1" pin="14" pad="P$7"/>
<connect gate="G$1" pin="15" pad="P$28"/>
<connect gate="G$1" pin="16" pad="P$8"/>
<connect gate="G$1" pin="17" pad="P$29"/>
<connect gate="G$1" pin="18" pad="P$9"/>
<connect gate="G$1" pin="19" pad="P$30"/>
<connect gate="G$1" pin="20" pad="P$10"/>
<connect gate="G$1" pin="21" pad="P$31"/>
<connect gate="G$1" pin="22" pad="P$11"/>
<connect gate="G$1" pin="23" pad="P$32"/>
<connect gate="G$1" pin="24" pad="P$12"/>
<connect gate="G$1" pin="25" pad="P$33"/>
<connect gate="G$1" pin="26" pad="P$13"/>
<connect gate="G$1" pin="27" pad="P$34"/>
<connect gate="G$1" pin="28" pad="P$14"/>
<connect gate="G$1" pin="29" pad="P$35"/>
<connect gate="G$1" pin="3.3V/01" pad="P$21"/>
<connect gate="G$1" pin="30" pad="P$15"/>
<connect gate="G$1" pin="31" pad="P$36"/>
<connect gate="G$1" pin="32" pad="P$16"/>
<connect gate="G$1" pin="33" pad="P$37"/>
<connect gate="G$1" pin="34" pad="P$17"/>
<connect gate="G$1" pin="35" pad="P$38"/>
<connect gate="G$1" pin="36" pad="P$18"/>
<connect gate="G$1" pin="37" pad="P$39"/>
<connect gate="G$1" pin="38" pad="P$19"/>
<connect gate="G$1" pin="39" pad="P$40"/>
<connect gate="G$1" pin="40" pad="P$20"/>
<connect gate="G$1" pin="5V/02" pad="P$1"/>
<connect gate="G$1" pin="5V/04" pad="P$2"/>
<connect gate="G$1" pin="GND/06" pad="P$3"/>
<connect gate="G$1" pin="RXD/10" pad="P$5"/>
<connect gate="G$1" pin="TXD/08" pad="P$4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="special" urn="urn:adsk.eagle:library:367">
<description>&lt;b&gt;Special Devices&lt;/b&gt;&lt;p&gt;
7-segment displays, switches, heatsinks, crystals, transformers, etc.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="EDG-08" urn="urn:adsk.eagle:footprint:26573/1" library_version="3">
<description>&lt;b&gt;DIP SWITCH&lt;/b&gt;</description>
<wire x1="-10.922" y1="-4.953" x2="10.922" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="10.922" y1="4.953" x2="-10.922" y2="4.953" width="0.1524" layer="21"/>
<wire x1="-10.922" y1="4.953" x2="-10.922" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-10.922" y1="-1.651" x2="-10.414" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="-1.651" x2="-10.414" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-10.414" y1="1.651" x2="-10.922" y2="1.651" width="0.1524" layer="21"/>
<wire x1="-10.922" y1="-1.651" x2="-10.922" y2="-4.953" width="0.1524" layer="21"/>
<wire x1="-10.922" y1="1.651" x2="-10.922" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="10.922" y1="-4.953" x2="10.922" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="10.922" y1="1.651" x2="10.414" y2="1.651" width="0.1524" layer="21"/>
<wire x1="10.414" y1="1.651" x2="10.414" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="10.414" y1="-1.651" x2="10.922" y2="-1.651" width="0.1524" layer="21"/>
<wire x1="10.922" y1="1.651" x2="10.922" y2="4.953" width="0.1524" layer="21"/>
<wire x1="10.922" y1="-1.651" x2="10.922" y2="1.651" width="0.1524" layer="21"/>
<wire x1="8.128" y1="1.905" x2="8.128" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="8.128" y1="1.905" x2="9.652" y2="1.905" width="0.1524" layer="21"/>
<wire x1="9.652" y1="-1.905" x2="9.652" y2="1.905" width="0.1524" layer="21"/>
<wire x1="9.652" y1="-1.905" x2="8.128" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.588" y1="1.905" x2="5.588" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="5.588" y1="1.905" x2="7.112" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.112" y1="-1.905" x2="7.112" y2="1.905" width="0.1524" layer="21"/>
<wire x1="7.112" y1="-1.905" x2="5.588" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.048" y1="1.905" x2="3.048" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="3.048" y1="1.905" x2="4.572" y2="1.905" width="0.1524" layer="21"/>
<wire x1="4.572" y1="-1.905" x2="4.572" y2="1.905" width="0.1524" layer="21"/>
<wire x1="4.572" y1="-1.905" x2="3.048" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0.508" y1="1.905" x2="0.508" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="0.508" y1="1.905" x2="2.032" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-1.905" x2="2.032" y2="1.905" width="0.1524" layer="21"/>
<wire x1="2.032" y1="-1.905" x2="0.508" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.905" x2="-2.032" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.032" y1="1.905" x2="-0.508" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="-1.905" x2="-0.508" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-0.508" y1="-1.905" x2="-2.032" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-4.572" y1="1.905" x2="-4.572" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-4.572" y1="1.905" x2="-3.048" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-1.905" x2="-3.048" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-3.048" y1="-1.905" x2="-4.572" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="1.905" x2="-7.112" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-7.112" y1="1.905" x2="-5.588" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.588" y1="-1.905" x2="-5.588" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-5.588" y1="-1.905" x2="-7.112" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-9.652" y1="1.905" x2="-9.652" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-9.652" y1="1.905" x2="-8.128" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-1.905" x2="-8.128" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-8.128" y1="-1.905" x2="-9.652" y2="-1.905" width="0.1524" layer="21"/>
<pad name="1" x="-8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="2" x="-6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="7" x="6.35" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="8" x="8.89" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="3" x="-3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="4" x="-1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="6" x="3.81" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="5" x="1.27" y="-3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="9" x="8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="10" x="6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="11" x="3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="12" x="1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="13" x="-1.27" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="14" x="-3.81" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="15" x="-6.35" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<pad name="16" x="-8.89" y="3.81" drill="0.8128" shape="long" rot="R90"/>
<text x="-9.144" y="-4.191" size="1.524" layer="51" ratio="10">1</text>
<text x="-10.16" y="2.54" size="1.524" layer="51" ratio="10">ON</text>
<text x="-6.858" y="-4.191" size="1.524" layer="51" ratio="10">2</text>
<text x="-4.318" y="-4.191" size="1.524" layer="51" ratio="10">3</text>
<text x="-1.778" y="-4.191" size="1.524" layer="51" ratio="10">4</text>
<text x="0.762" y="-4.191" size="1.524" layer="51" ratio="10">5</text>
<text x="3.302" y="-4.191" size="1.524" layer="51" ratio="10">6</text>
<text x="5.842" y="-4.191" size="1.524" layer="51" ratio="10">7</text>
<text x="8.382" y="-4.191" size="1.524" layer="51" ratio="10">8</text>
<text x="6.35" y="2.54" size="1.524" layer="51" ratio="10">EDG</text>
<text x="-3.81" y="5.334" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-10.922" y="5.334" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<rectangle x1="8.382" y1="-0.381" x2="9.398" y2="0" layer="21"/>
<rectangle x1="8.382" y1="-1.016" x2="9.398" y2="-0.635" layer="21"/>
<rectangle x1="8.382" y1="-1.651" x2="9.398" y2="-1.27" layer="21"/>
<rectangle x1="5.842" y1="-0.381" x2="6.858" y2="0" layer="21"/>
<rectangle x1="5.842" y1="-1.016" x2="6.858" y2="-0.635" layer="21"/>
<rectangle x1="5.842" y1="-1.651" x2="6.858" y2="-1.27" layer="21"/>
<rectangle x1="3.302" y1="-0.381" x2="4.318" y2="0" layer="21"/>
<rectangle x1="3.302" y1="-1.016" x2="4.318" y2="-0.635" layer="21"/>
<rectangle x1="3.302" y1="-1.651" x2="4.318" y2="-1.27" layer="21"/>
<rectangle x1="0.762" y1="-0.381" x2="1.778" y2="0" layer="21"/>
<rectangle x1="0.762" y1="-1.016" x2="1.778" y2="-0.635" layer="21"/>
<rectangle x1="0.762" y1="-1.651" x2="1.778" y2="-1.27" layer="21"/>
<rectangle x1="-1.778" y1="-0.381" x2="-0.762" y2="0" layer="21"/>
<rectangle x1="-1.778" y1="-1.016" x2="-0.762" y2="-0.635" layer="21"/>
<rectangle x1="-1.778" y1="-1.651" x2="-0.762" y2="-1.27" layer="21"/>
<rectangle x1="-4.318" y1="-0.381" x2="-3.302" y2="0" layer="21"/>
<rectangle x1="-4.318" y1="-1.016" x2="-3.302" y2="-0.635" layer="21"/>
<rectangle x1="-4.318" y1="-1.651" x2="-3.302" y2="-1.27" layer="21"/>
<rectangle x1="-6.858" y1="-0.381" x2="-5.842" y2="0" layer="21"/>
<rectangle x1="-6.858" y1="-1.016" x2="-5.842" y2="-0.635" layer="21"/>
<rectangle x1="-6.858" y1="-1.651" x2="-5.842" y2="-1.27" layer="21"/>
<rectangle x1="-9.398" y1="-0.381" x2="-8.382" y2="0" layer="21"/>
<rectangle x1="-9.398" y1="-1.016" x2="-8.382" y2="-0.635" layer="21"/>
<rectangle x1="-9.398" y1="-1.651" x2="-8.382" y2="-1.27" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="EDG-08" urn="urn:adsk.eagle:package:26659/2" type="model" library_version="3">
<description>DIP SWITCH</description>
<packageinstances>
<packageinstance name="EDG-08"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="SW_DIP-8" urn="urn:adsk.eagle:symbol:26572/1" library_version="3">
<wire x1="-3.302" y1="8.128" x2="0" y2="8.128" width="0.1524" layer="94"/>
<wire x1="3.302" y1="8.128" x2="3.302" y2="7.112" width="0.1524" layer="94"/>
<wire x1="3.302" y1="7.112" x2="0" y2="7.112" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="7.112" x2="-3.302" y2="8.128" width="0.1524" layer="94"/>
<wire x1="0" y1="8.128" x2="0" y2="7.112" width="0.1524" layer="94"/>
<wire x1="0" y1="8.128" x2="3.302" y2="8.128" width="0.1524" layer="94"/>
<wire x1="0" y1="7.112" x2="-3.302" y2="7.112" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="5.588" x2="0" y2="5.588" width="0.1524" layer="94"/>
<wire x1="3.302" y1="5.588" x2="3.302" y2="4.572" width="0.1524" layer="94"/>
<wire x1="3.302" y1="4.572" x2="0" y2="4.572" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="4.572" x2="-3.302" y2="5.588" width="0.1524" layer="94"/>
<wire x1="0" y1="5.588" x2="0" y2="4.572" width="0.1524" layer="94"/>
<wire x1="0" y1="5.588" x2="3.302" y2="5.588" width="0.1524" layer="94"/>
<wire x1="0" y1="4.572" x2="-3.302" y2="4.572" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="3.048" x2="0" y2="3.048" width="0.1524" layer="94"/>
<wire x1="3.302" y1="3.048" x2="3.302" y2="2.032" width="0.1524" layer="94"/>
<wire x1="3.302" y1="2.032" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="2.032" x2="-3.302" y2="3.048" width="0.1524" layer="94"/>
<wire x1="0" y1="3.048" x2="0" y2="2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="3.048" x2="3.302" y2="3.048" width="0.1524" layer="94"/>
<wire x1="0" y1="2.032" x2="-3.302" y2="2.032" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="0.508" x2="0" y2="0.508" width="0.1524" layer="94"/>
<wire x1="3.302" y1="0.508" x2="3.302" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-0.508" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-0.508" x2="-3.302" y2="0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="0.508" x2="0" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="0.508" x2="3.302" y2="0.508" width="0.1524" layer="94"/>
<wire x1="0" y1="-0.508" x2="-3.302" y2="-0.508" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-2.032" x2="0" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-2.032" x2="3.302" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-3.048" x2="0" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-3.048" x2="-3.302" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="0" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="0" y1="-2.032" x2="3.302" y2="-2.032" width="0.1524" layer="94"/>
<wire x1="0" y1="-3.048" x2="-3.302" y2="-3.048" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-4.572" x2="0" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-4.572" x2="3.302" y2="-5.588" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-5.588" x2="0" y2="-5.588" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-5.588" x2="-3.302" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="0" y1="-4.572" x2="0" y2="-5.588" width="0.1524" layer="94"/>
<wire x1="0" y1="-4.572" x2="3.302" y2="-4.572" width="0.1524" layer="94"/>
<wire x1="0" y1="-5.588" x2="-3.302" y2="-5.588" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-7.112" x2="0" y2="-7.112" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-7.112" x2="3.302" y2="-8.128" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-8.128" x2="0" y2="-8.128" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-8.128" x2="-3.302" y2="-7.112" width="0.1524" layer="94"/>
<wire x1="0" y1="-7.112" x2="0" y2="-8.128" width="0.1524" layer="94"/>
<wire x1="0" y1="-7.112" x2="3.302" y2="-7.112" width="0.1524" layer="94"/>
<wire x1="0" y1="-8.128" x2="-3.302" y2="-8.128" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-9.652" x2="0" y2="-9.652" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-9.652" x2="3.302" y2="-10.668" width="0.1524" layer="94"/>
<wire x1="3.302" y1="-10.668" x2="0" y2="-10.668" width="0.1524" layer="94"/>
<wire x1="-3.302" y1="-10.668" x2="-3.302" y2="-9.652" width="0.1524" layer="94"/>
<wire x1="0" y1="-9.652" x2="0" y2="-10.668" width="0.1524" layer="94"/>
<wire x1="0" y1="-9.652" x2="3.302" y2="-9.652" width="0.1524" layer="94"/>
<wire x1="0" y1="-10.668" x2="-3.302" y2="-10.668" width="0.1524" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="-12.7" x2="5.08" y2="-12.7" width="0.4064" layer="94"/>
<wire x1="5.08" y1="-12.7" x2="5.08" y2="10.16" width="0.4064" layer="94"/>
<wire x1="5.08" y1="10.16" x2="-5.08" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.397" y1="7.874" x2="1.905" y2="7.874" width="0" layer="94"/>
<wire x1="1.397" y1="7.366" x2="1.905" y2="7.366" width="0" layer="94"/>
<wire x1="1.397" y1="5.334" x2="1.905" y2="5.334" width="0" layer="94"/>
<wire x1="1.397" y1="4.826" x2="1.905" y2="4.826" width="0" layer="94"/>
<wire x1="1.397" y1="2.794" x2="1.905" y2="2.794" width="0" layer="94"/>
<wire x1="1.397" y1="2.286" x2="1.905" y2="2.286" width="0" layer="94"/>
<wire x1="1.397" y1="0.254" x2="1.905" y2="0.254" width="0" layer="94"/>
<wire x1="1.397" y1="-0.254" x2="1.905" y2="-0.254" width="0" layer="94"/>
<wire x1="1.397" y1="-2.286" x2="1.905" y2="-2.286" width="0" layer="94"/>
<wire x1="1.397" y1="-2.794" x2="1.905" y2="-2.794" width="0" layer="94"/>
<wire x1="1.397" y1="-4.826" x2="1.905" y2="-4.826" width="0" layer="94"/>
<wire x1="1.397" y1="-5.334" x2="1.905" y2="-5.334" width="0" layer="94"/>
<wire x1="1.397" y1="-7.366" x2="1.905" y2="-7.366" width="0" layer="94"/>
<wire x1="1.397" y1="-7.874" x2="1.905" y2="-7.874" width="0" layer="94"/>
<wire x1="1.397" y1="-9.906" x2="1.905" y2="-9.906" width="0" layer="94"/>
<wire x1="1.397" y1="-10.414" x2="1.905" y2="-10.414" width="0" layer="94"/>
<text x="-5.08" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="-15.24" size="1.778" layer="96">&gt;VALUE</text>
<text x="-3.556" y="-12.319" size="1.27" layer="94" ratio="10" rot="R90">ON</text>
<text x="4.826" y="-10.414" size="1.27" layer="94" ratio="10" rot="R90">1</text>
<text x="4.826" y="-8.128" size="1.27" layer="94" ratio="10" rot="R90">2</text>
<text x="4.826" y="-5.588" size="1.27" layer="94" ratio="10" rot="R90">3</text>
<text x="4.826" y="-3.048" size="1.27" layer="94" ratio="10" rot="R90">4</text>
<text x="4.826" y="-0.381" size="1.27" layer="94" ratio="10" rot="R90">5</text>
<text x="4.826" y="2.159" size="1.27" layer="94" ratio="10" rot="R90">6</text>
<text x="4.826" y="4.699" size="1.27" layer="94" ratio="10" rot="R90">7</text>
<text x="4.826" y="7.112" size="1.27" layer="94" ratio="10" rot="R90">8</text>
<rectangle x1="0.381" y1="7.366" x2="1.397" y2="7.874" layer="94"/>
<rectangle x1="1.905" y1="7.366" x2="2.921" y2="7.874" layer="94"/>
<rectangle x1="0.381" y1="4.826" x2="1.397" y2="5.334" layer="94"/>
<rectangle x1="1.905" y1="4.826" x2="2.921" y2="5.334" layer="94"/>
<rectangle x1="0.381" y1="2.286" x2="1.397" y2="2.794" layer="94"/>
<rectangle x1="1.905" y1="2.286" x2="2.921" y2="2.794" layer="94"/>
<rectangle x1="0.381" y1="-0.254" x2="1.397" y2="0.254" layer="94"/>
<rectangle x1="1.905" y1="-0.254" x2="2.921" y2="0.254" layer="94"/>
<rectangle x1="0.381" y1="-2.794" x2="1.397" y2="-2.286" layer="94"/>
<rectangle x1="1.905" y1="-2.794" x2="2.921" y2="-2.286" layer="94"/>
<rectangle x1="0.381" y1="-5.334" x2="1.397" y2="-4.826" layer="94"/>
<rectangle x1="1.905" y1="-5.334" x2="2.921" y2="-4.826" layer="94"/>
<rectangle x1="0.381" y1="-7.874" x2="1.397" y2="-7.366" layer="94"/>
<rectangle x1="1.905" y1="-7.874" x2="2.921" y2="-7.366" layer="94"/>
<rectangle x1="0.381" y1="-10.414" x2="1.397" y2="-9.906" layer="94"/>
<rectangle x1="1.905" y1="-10.414" x2="2.921" y2="-9.906" layer="94"/>
<pin name="9" x="-7.62" y="7.62" visible="pad" length="short" direction="pas" swaplevel="8"/>
<pin name="10" x="-7.62" y="5.08" visible="pad" length="short" direction="pas" swaplevel="7"/>
<pin name="11" x="-7.62" y="2.54" visible="pad" length="short" direction="pas" swaplevel="6"/>
<pin name="12" x="-7.62" y="0" visible="pad" length="short" direction="pas" swaplevel="5"/>
<pin name="13" x="-7.62" y="-2.54" visible="pad" length="short" direction="pas" swaplevel="4"/>
<pin name="14" x="-7.62" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="3"/>
<pin name="15" x="-7.62" y="-7.62" visible="pad" length="short" direction="pas" swaplevel="2"/>
<pin name="16" x="-7.62" y="-10.16" visible="pad" length="short" direction="pas" swaplevel="1"/>
<pin name="1" x="7.62" y="-10.16" visible="pad" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="-7.62" visible="pad" length="short" direction="pas" swaplevel="2" rot="R180"/>
<pin name="3" x="7.62" y="-5.08" visible="pad" length="short" direction="pas" swaplevel="3" rot="R180"/>
<pin name="4" x="7.62" y="-2.54" visible="pad" length="short" direction="pas" swaplevel="4" rot="R180"/>
<pin name="5" x="7.62" y="0" visible="pad" length="short" direction="pas" swaplevel="5" rot="R180"/>
<pin name="6" x="7.62" y="2.54" visible="pad" length="short" direction="pas" swaplevel="6" rot="R180"/>
<pin name="7" x="7.62" y="5.08" visible="pad" length="short" direction="pas" swaplevel="7" rot="R180"/>
<pin name="8" x="7.62" y="7.62" visible="pad" length="short" direction="pas" swaplevel="8" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="SW_DIP-8" urn="urn:adsk.eagle:component:26683/3" prefix="SW" uservalue="yes" library_version="3">
<description>&lt;b&gt;DIP SWITCH&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="SW_DIP-8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="EDG-08">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="10" pad="10"/>
<connect gate="A" pin="11" pad="11"/>
<connect gate="A" pin="12" pad="12"/>
<connect gate="A" pin="13" pad="13"/>
<connect gate="A" pin="14" pad="14"/>
<connect gate="A" pin="15" pad="15"/>
<connect gate="A" pin="16" pad="16"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
<connect gate="A" pin="7" pad="7"/>
<connect gate="A" pin="8" pad="8"/>
<connect gate="A" pin="9" pad="9"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:26659/2"/>
</package3dinstances>
<technologies>
<technology name="">
<attribute name="POPULARITY" value="5" constant="no"/>
</technology>
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
<part name="U$1" library="untitled" deviceset="PIN" device=""/>
<part name="U$2" library="untitled" deviceset="PIN" device=""/>
<part name="U$3" library="untitled" deviceset="POWER" device=""/>
<part name="U$4" library="untitled" deviceset="POWER" device=""/>
<part name="U$5" library="untitled" deviceset="POWER" device=""/>
<part name="SW1" library="special" library_urn="urn:adsk.eagle:library:367" deviceset="SW_DIP-8" device="" package3d_urn="urn:adsk.eagle:package:26659/2"/>
<part name="U$6" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$7" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$8" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$9" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$10" library="untitled" deviceset="FEATHER" device=""/>
<part name="U$11" library="untitled" deviceset="RASPBERRYPI" device=""/>
<part name="U$12" library="untitled" deviceset="PIN" device=""/>
<part name="U$13" library="untitled" deviceset="PIN" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="-22.86" y="91.44" size="1.4224" layer="95">GND</text>
<text x="-22.86" y="88.9" size="1.4224" layer="95">VBB</text>
<text x="-22.86" y="86.36" size="1.4224" layer="95">IOVCC</text>
<text x="-22.86" y="83.82" size="1.4224" layer="95">RXD</text>
<text x="-22.86" y="81.28" size="1.4224" layer="95">TXD</text>
<text x="-26.67" y="73.66" size="1.4224" layer="95">EN_VBB</text>
<text x="-29.845" y="71.12" size="1.4224" layer="95">IOVCC_REG</text>
<text x="-25.4" y="68.58" size="1.4224" layer="95">NRDY</text>
<text x="-24.13" y="66.04" size="1.4224" layer="95">PWM</text>
<text x="-33.02" y="162.56" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="160.02" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="157.48" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="154.94" size="1.4224" layer="95">GND</text>
<text x="-33.02" y="152.4" size="1.4224" layer="95">GND</text>
<text x="-33.655" y="114.935" size="1.4224" layer="95">DC 12V</text>
<text x="-29.845" y="113.03" size="1.4224" layer="95">7V</text>
<text x="-29.845" y="110.49" size="1.4224" layer="95">5V</text>
<text x="-30.48" y="107.95" size="1.4224" layer="95">3.3V</text>
<text x="135.255" y="31.115" size="1.4224" layer="95">Sensor RX------TX-D1</text>
<text x="135.89" y="34.925" size="1.4224" layer="95">TxD-----D13</text>
<text x="135.89" y="33.02" size="1.4224" layer="95">RxD-----D12</text>
<text x="135.89" y="38.735" size="1.4224" layer="95">EN_VBB ------D6</text>
<text x="135.89" y="36.83" size="1.4224" layer="95">NRDY ------D5</text>
<text x="135.255" y="29.21" size="1.4224" layer="95">Sensor TX -----RX -D0</text>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="10.16" y="72.39" smashed="yes"/>
<instance part="U$2" gate="G$1" x="9.525" y="53.975" smashed="yes"/>
<instance part="U$3" gate="G$1" x="21.59" y="141.605" smashed="yes" rot="R180"/>
<instance part="U$4" gate="G$1" x="9.525" y="-13.335" smashed="yes"/>
<instance part="U$5" gate="G$1" x="13.335" y="15.875" smashed="yes"/>
<instance part="SW1" gate="A" x="94.615" y="110.49" smashed="yes">
<attribute name="NAME" x="89.535" y="121.285" size="1.778" layer="95"/>
<attribute name="VALUE" x="89.535" y="95.25" size="1.778" layer="96"/>
</instance>
<instance part="U$6" gate="G$1" x="50.8" y="114.3" smashed="yes"/>
<instance part="U$7" gate="G$1" x="46.355" y="-18.415" smashed="yes"/>
<instance part="U$8" gate="G$1" x="50.8" y="75.565" smashed="yes"/>
<instance part="U$9" gate="G$1" x="50.8" y="94.615" smashed="yes"/>
<instance part="U$10" gate="G$1" x="165.735" y="69.85" smashed="yes"/>
<instance part="U$11" gate="G$1" x="123.825" y="43.815" smashed="yes"/>
<instance part="U$12" gate="G$1" x="2.54" y="96.52" smashed="yes"/>
<instance part="U$13" gate="G$1" x="0.635" y="144.145" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$3" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="OUT+"/>
<wire x1="63.5" y1="106.68" x2="71.755" y2="106.68" width="0.1524" layer="91"/>
<wire x1="71.755" y1="106.68" x2="74.93" y2="106.68" width="0.1524" layer="91"/>
<wire x1="74.93" y1="106.68" x2="74.93" y2="118.745" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="9"/>
<wire x1="74.93" y1="118.745" x2="86.995" y2="118.745" width="0.1524" layer="91"/>
<wire x1="86.995" y1="118.745" x2="86.995" y2="118.11" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="P$4"/>
<wire x1="-12.7" y1="113.665" x2="24.13" y2="113.665" width="0.1524" layer="91"/>
<wire x1="24.13" y1="113.665" x2="24.13" y2="128.905" width="0.1524" layer="91"/>
<wire x1="24.13" y1="128.905" x2="71.755" y2="128.905" width="0.1524" layer="91"/>
<wire x1="71.755" y1="128.905" x2="71.755" y2="106.68" width="0.1524" layer="91"/>
<junction x="71.755" y="106.68"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$9" gate="G$1" pin="OUT+"/>
<wire x1="63.5" y1="86.995" x2="69.215" y2="86.995" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="10"/>
<wire x1="69.215" y1="86.995" x2="80.645" y2="86.995" width="0.1524" layer="91"/>
<wire x1="80.645" y1="86.995" x2="80.645" y2="92.075" width="0.1524" layer="91"/>
<wire x1="80.645" y1="92.075" x2="80.645" y2="115.57" width="0.1524" layer="91"/>
<wire x1="80.645" y1="115.57" x2="86.995" y2="115.57" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="P$3"/>
<wire x1="-12.7" y1="111.125" x2="69.215" y2="111.125" width="0.1524" layer="91"/>
<wire x1="69.215" y1="111.125" x2="69.215" y2="86.995" width="0.1524" layer="91"/>
<junction x="69.215" y="86.995"/>
<pinref part="SW1" gate="A" pin="11"/>
<wire x1="86.995" y1="113.03" x2="82.55" y2="113.03" width="0.1524" layer="91"/>
<wire x1="82.55" y1="113.03" x2="82.55" y2="92.075" width="0.1524" layer="91"/>
<wire x1="82.55" y1="92.075" x2="80.645" y2="92.075" width="0.1524" layer="91"/>
<junction x="80.645" y="92.075"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="SW1" gate="A" pin="8"/>
<wire x1="102.235" y1="118.11" x2="106.68" y2="118.11" width="0.1524" layer="91"/>
<wire x1="106.68" y1="118.11" x2="106.68" y2="125.095" width="0.1524" layer="91"/>
<wire x1="106.68" y1="125.095" x2="39.37" y2="125.095" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="P$4"/>
<wire x1="39.37" y1="125.095" x2="39.37" y2="89.535" width="0.1524" layer="91"/>
<wire x1="39.37" y1="89.535" x2="-5.08" y2="89.535" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$2"/>
<wire x1="-5.08" y1="84.455" x2="-5.08" y2="85.725" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="85.725" x2="123.19" y2="85.725" width="0.1524" layer="91"/>
<wire x1="123.19" y1="85.725" x2="123.19" y2="120.015" width="0.1524" layer="91"/>
<wire x1="123.19" y1="120.015" x2="212.725" y2="120.015" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D1"/>
<wire x1="212.725" y1="120.015" x2="212.725" y2="59.69" width="0.1524" layer="91"/>
<wire x1="212.725" y1="59.69" x2="173.355" y2="59.69" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$1"/>
<wire x1="-5.08" y1="81.915" x2="116.84" y2="81.915" width="0.1524" layer="91"/>
<wire x1="116.84" y1="81.915" x2="116.84" y2="114.935" width="0.1524" layer="91"/>
<wire x1="116.84" y1="114.935" x2="204.47" y2="114.935" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D0"/>
<wire x1="204.47" y1="114.935" x2="204.47" y2="62.23" width="0.1524" layer="91"/>
<wire x1="204.47" y1="62.23" x2="173.355" y2="62.23" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$3"/>
<wire x1="-5.08" y1="86.995" x2="8.89" y2="86.995" width="0.1524" layer="91"/>
<wire x1="8.89" y1="86.995" x2="8.89" y2="77.47" width="0.1524" layer="91"/>
<wire x1="8.89" y1="77.47" x2="127" y2="77.47" width="0.1524" layer="91"/>
<wire x1="127" y1="77.47" x2="127" y2="108.585" width="0.1524" layer="91"/>
<wire x1="127" y1="108.585" x2="183.515" y2="108.585" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="3.3V"/>
<wire x1="183.515" y1="108.585" x2="183.515" y2="92.71" width="0.1524" layer="91"/>
<wire x1="183.515" y1="92.71" x2="173.355" y2="92.71" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="P$5"/>
<wire x1="-5.715" y1="73.3425" x2="127.635" y2="73.3425" width="0.1524" layer="91"/>
<wire x1="127.635" y1="73.3425" x2="127.635" y2="69.85" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D6"/>
<wire x1="135.255" y1="64.77" x2="133.35" y2="64.77" width="0.1524" layer="91"/>
<wire x1="133.35" y1="64.77" x2="133.35" y2="69.85" width="0.1524" layer="91"/>
<wire x1="133.35" y1="69.85" x2="127.635" y2="69.85" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="P$3"/>
<wire x1="-5.715" y1="68.58" x2="131.445" y2="68.58" width="0.1524" layer="91"/>
<wire x1="131.445" y1="68.58" x2="131.445" y2="62.23" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D5"/>
<wire x1="135.255" y1="62.23" x2="131.445" y2="62.23" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="SW1" gate="A" pin="7"/>
<wire x1="102.235" y1="115.57" x2="120.65" y2="115.57" width="0.1524" layer="91"/>
<wire x1="120.65" y1="115.57" x2="120.65" y2="79.375" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="VBUS"/>
<wire x1="120.65" y1="79.375" x2="135.255" y2="79.375" width="0.1524" layer="91"/>
<wire x1="135.255" y1="79.375" x2="135.255" y2="80.01" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="SW1" gate="A" pin="6"/>
<wire x1="102.235" y1="113.03" x2="114.3" y2="113.03" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="5V/02"/>
<wire x1="114.3" y1="113.03" x2="114.3" y2="61.595" width="0.1524" layer="91"/>
<wire x1="114.3" y1="61.595" x2="113.665" y2="61.595" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="TXD/08"/>
<wire x1="113.665" y1="53.975" x2="128.27" y2="53.975" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D13"/>
<wire x1="128.27" y1="53.975" x2="128.27" y2="77.47" width="0.1524" layer="91"/>
<wire x1="128.27" y1="77.47" x2="135.255" y2="77.47" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="RXD/10"/>
<wire x1="113.665" y1="51.435" x2="130.175" y2="51.435" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D12"/>
<wire x1="130.175" y1="51.435" x2="130.175" y2="74.93" width="0.1524" layer="91"/>
<wire x1="130.175" y1="74.93" x2="135.255" y2="74.93" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="IN+"/>
<wire x1="38.1" y1="67.945" x2="27.94" y2="67.945" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="VBB"/>
<wire x1="34.29" y1="133.985" x2="34.29" y2="123.825" width="0.1524" layer="91"/>
<wire x1="34.29" y1="123.825" x2="29.845" y2="123.825" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="P$5"/>
<wire x1="29.845" y1="123.825" x2="27.94" y2="123.825" width="0.1524" layer="91"/>
<wire x1="27.94" y1="123.825" x2="13.97" y2="123.825" width="0.1524" layer="91"/>
<wire x1="13.97" y1="123.825" x2="6.985" y2="123.825" width="0.1524" layer="91"/>
<wire x1="6.985" y1="123.825" x2="-12.7" y2="123.825" width="0.1524" layer="91"/>
<wire x1="-12.7" y1="123.825" x2="-12.7" y2="115.8875" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="IN+"/>
<wire x1="38.1" y1="106.68" x2="29.845" y2="106.68" width="0.1524" layer="91"/>
<wire x1="29.845" y1="106.68" x2="29.845" y2="123.825" width="0.1524" layer="91"/>
<junction x="29.845" y="123.825"/>
<pinref part="U$9" gate="G$1" pin="IN+"/>
<wire x1="38.1" y1="86.995" x2="13.97" y2="86.995" width="0.1524" layer="91"/>
<wire x1="13.97" y1="86.995" x2="13.97" y2="123.825" width="0.1524" layer="91"/>
<junction x="13.97" y="123.825"/>
<pinref part="U$1" gate="G$1" pin="P$5"/>
<wire x1="-5.08" y1="91.7575" x2="6.985" y2="91.7575" width="0.1524" layer="91"/>
<wire x1="6.985" y1="91.7575" x2="6.985" y2="123.825" width="0.1524" layer="91"/>
<junction x="6.985" y="123.825"/>
<wire x1="27.94" y1="67.945" x2="27.94" y2="123.825" width="0.1524" layer="91"/>
<junction x="27.94" y="123.825"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="IN-"/>
<wire x1="38.1" y1="80.645" x2="-5.08" y2="80.645" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="80.645" x2="-5.08" y2="156.21" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="34"/>
<wire x1="113.665" y1="20.955" x2="125.095" y2="20.955" width="0.1524" layer="91"/>
<wire x1="125.095" y1="20.955" x2="125.095" y2="96.52" width="0.1524" layer="91"/>
<wire x1="125.095" y1="96.52" x2="-5.715" y2="96.52" width="0.1524" layer="91"/>
<wire x1="-5.715" y1="96.52" x2="-5.715" y2="153.67" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="GND2"/>
<wire x1="173.355" y1="57.15" x2="199.39" y2="57.15" width="0.1524" layer="91"/>
<wire x1="199.39" y1="57.15" x2="199.39" y2="163.83" width="0.1524" layer="91"/>
<wire x1="199.39" y1="163.83" x2="200.025" y2="163.83" width="0.1524" layer="91"/>
<wire x1="199.39" y1="163.83" x2="73.66" y2="163.83" width="0.1524" layer="91"/>
<wire x1="73.66" y1="163.83" x2="1.27" y2="163.83" width="0.1524" layer="91"/>
<wire x1="1.27" y1="163.83" x2="1.27" y2="158.115" width="0.1524" layer="91"/>
<wire x1="1.27" y1="158.115" x2="-5.715" y2="158.115" width="0.1524" layer="91"/>
<wire x1="-5.715" y1="158.115" x2="-5.715" y2="158.75" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="IN-"/>
<wire x1="38.1" y1="99.695" x2="24.13" y2="99.695" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="OUT-"/>
<wire x1="63.5" y1="99.695" x2="63.5" y2="102.87" width="0.1524" layer="91"/>
<wire x1="63.5" y1="102.87" x2="24.13" y2="102.87" width="0.1524" layer="91"/>
<wire x1="24.13" y1="102.87" x2="24.13" y2="99.695" width="0.1524" layer="91"/>
<junction x="24.13" y="99.695"/>
<wire x1="24.13" y1="99.695" x2="-1.27" y2="99.695" width="0.1524" layer="91"/>
<wire x1="-1.27" y1="99.695" x2="-1.27" y2="162.56" width="0.1524" layer="91"/>
<pinref part="U$13" gate="G$1" pin="P$1"/>
<pinref part="U$13" gate="G$1" pin="P$2"/>
<pinref part="U$13" gate="G$1" pin="P$3"/>
<junction x="-14.605" y="156.21"/>
<pinref part="U$13" gate="G$1" pin="P$4"/>
<wire x1="-14.605" y1="158.75" x2="-14.605" y2="161.29" width="0.1524" layer="91"/>
<junction x="-14.605" y="158.75"/>
<junction x="-14.605" y="161.29"/>
<pinref part="U$3" gate="G$1" pin="GND2"/>
<wire x1="24.13" y1="149.225" x2="16.51" y2="149.225" width="0.1524" layer="91"/>
<wire x1="16.51" y1="149.225" x2="11.43" y2="149.225" width="0.1524" layer="91"/>
<wire x1="11.43" y1="149.225" x2="5.715" y2="149.225" width="0.1524" layer="91"/>
<wire x1="5.715" y1="149.225" x2="5.715" y2="165.1" width="0.1524" layer="91"/>
<pinref part="U$13" gate="G$1" pin="P$5"/>
<wire x1="5.715" y1="165.1" x2="5.715" y2="165.735" width="0.1524" layer="91"/>
<wire x1="5.715" y1="165.735" x2="-14.605" y2="165.735" width="0.1524" layer="91"/>
<wire x1="-14.605" y1="165.735" x2="-14.605" y2="163.5125" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="GND"/>
<wire x1="24.13" y1="146.685" x2="11.43" y2="146.685" width="0.1524" layer="91"/>
<wire x1="11.43" y1="146.685" x2="11.43" y2="149.225" width="0.1524" layer="91"/>
<junction x="11.43" y="149.225"/>
<pinref part="U$6" gate="G$1" pin="IN-"/>
<wire x1="38.1" y1="119.38" x2="16.51" y2="119.38" width="0.1524" layer="91"/>
<wire x1="16.51" y1="119.38" x2="16.51" y2="149.225" width="0.1524" layer="91"/>
<junction x="16.51" y="149.225"/>
<pinref part="U$6" gate="G$1" pin="OUT-"/>
<wire x1="63.5" y1="119.38" x2="63.5" y2="165.1" width="0.1524" layer="91"/>
<wire x1="63.5" y1="165.1" x2="5.715" y2="165.1" width="0.1524" layer="91"/>
<junction x="5.715" y="165.1"/>
<junction x="-14.605" y="163.5125"/>
<wire x1="-14.605" y1="153.67" x2="-14.605" y2="156.21" width="0.1524" layer="91"/>
<junction x="-14.605" y="153.67"/>
<wire x1="-14.605" y1="156.21" x2="-14.605" y2="158.75" width="0.1524" layer="91"/>
<wire x1="-14.605" y1="158.75" x2="-14.605" y2="162.56" width="0.1524" layer="91"/>
<wire x1="-14.605" y1="162.56" x2="-14.605" y2="163.5125" width="0.1524" layer="91"/>
<wire x1="-1.27" y1="162.56" x2="-14.605" y2="162.56" width="0.1524" layer="91"/>
<junction x="-14.605" y="162.56"/>
<wire x1="-5.715" y1="158.75" x2="-14.605" y2="158.75" width="0.1524" layer="91"/>
<wire x1="-5.715" y1="153.67" x2="-14.605" y2="153.67" width="0.1524" layer="91"/>
<wire x1="-5.08" y1="156.21" x2="-14.605" y2="156.21" width="0.1524" layer="91"/>
<pinref part="U$8" gate="G$1" pin="OUT-"/>
<wire x1="63.5" y1="80.645" x2="73.66" y2="80.645" width="0.1524" layer="91"/>
<wire x1="73.66" y1="80.645" x2="73.66" y2="163.83" width="0.1524" layer="91"/>
<junction x="73.66" y="163.83"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="OUT+"/>
<wire x1="63.5" y1="67.945" x2="84.455" y2="67.945" width="0.1524" layer="91"/>
<wire x1="84.455" y1="67.945" x2="84.455" y2="89.535" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="12"/>
<wire x1="84.455" y1="89.535" x2="84.455" y2="110.49" width="0.1524" layer="91"/>
<wire x1="84.455" y1="110.49" x2="86.995" y2="110.49" width="0.1524" layer="91"/>
<pinref part="U$12" gate="G$1" pin="P$2"/>
<wire x1="-12.7" y1="108.585" x2="76.2" y2="108.585" width="0.1524" layer="91"/>
<wire x1="76.2" y1="108.585" x2="76.2" y2="89.535" width="0.1524" layer="91"/>
<wire x1="76.2" y1="89.535" x2="84.455" y2="89.535" width="0.1524" layer="91"/>
<junction x="84.455" y="89.535"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
