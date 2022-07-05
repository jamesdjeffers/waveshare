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
<package name="2X5FEET">
<pad name="P$1" x="0" y="-2.54" drill="0.9"/>
<pad name="P$2" x="0" y="-5.08" drill="0.9"/>
<pad name="P$3" x="0" y="-7.62" drill="0.9"/>
<pad name="P$4" x="0" y="-10.16" drill="0.9"/>
<pad name="P$5" x="0" y="-12.7" drill="0.9"/>
<pad name="P$6" x="2.54" y="-2.54" drill="0.9"/>
<pad name="P$7" x="2.54" y="-5.08" drill="0.9"/>
<pad name="P$8" x="2.54" y="-7.62" drill="0.9"/>
<pad name="P$9" x="2.54" y="-10.16" drill="0.9"/>
<pad name="P$10" x="2.54" y="-12.7" drill="0.9"/>
<wire x1="-2.54" y1="0" x2="-2.54" y2="-15.24" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-15.24" x2="5.08" y2="-15.24" width="0.1524" layer="21"/>
<wire x1="5.08" y1="-15.24" x2="5.08" y2="0" width="0.1524" layer="21"/>
<wire x1="5.08" y1="0" x2="-2.54" y2="0" width="0.1524" layer="21"/>
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
<package name="MH-MINI-360">
<pad name="P$1" x="0" y="1" drill="0.9" shape="offset" rot="R270"/>
<pad name="P$2" x="9" y="1" drill="0.9" shape="offset" rot="R270"/>
<pad name="P$4" x="0" y="-16" drill="0.9" shape="offset" rot="R90"/>
<pad name="P$3" x="9" y="-16" drill="0.9" shape="offset" rot="R90"/>
<wire x1="-1" y1="0.5" x2="10" y2="0.5" width="0.1524" layer="21"/>
<wire x1="10" y1="0.5" x2="10" y2="-15.5" width="0.1524" layer="21"/>
<wire x1="10" y1="-15.5" x2="-1" y2="-15.5" width="0.1524" layer="21"/>
<wire x1="-1" y1="-15.5" x2="-1" y2="0.5" width="0.1524" layer="21"/>
<text x="-0.5" y="-2.5" size="1.27" layer="21">IN+</text>
<text x="7" y="-2.5" size="1.27" layer="21">IN-</text>
<text x="-0.5" y="-13" size="1.27" layer="21">OUT+</text>
<text x="5.5" y="-13" size="1.27" layer="21">OUT-</text>
</package>
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
</packages>
<symbols>
<symbol name="POWERIN">
<wire x1="-25.4" y1="2.54" x2="-7.62" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="2.54" x2="-7.62" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-7.62" y1="-10.16" x2="-25.4" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-25.4" y1="-10.16" x2="-25.4" y2="2.54" width="0.1524" layer="94"/>
<pin name="GND" x="-2.54" y="-5.08" length="middle" rot="R180"/>
<pin name="GND2" x="-2.54" y="-7.62" length="middle" rot="R180"/>
<pin name="VBB" x="-12.7" y="7.62" length="middle" rot="R270"/>
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
<symbol name="2X5FEET">
<pin name="P$1" x="-33.02" y="15.24" length="middle"/>
<pin name="P$2" x="-33.02" y="12.7" length="middle"/>
<pin name="P$3" x="-33.02" y="10.16" length="middle"/>
<pin name="P$4" x="-33.02" y="7.62" length="middle"/>
<pin name="P$5" x="-33.02" y="5.08" length="middle"/>
<pin name="P$6" x="-7.62" y="15.24" length="middle" rot="R180"/>
<pin name="P$7" x="-7.62" y="12.7" length="middle" rot="R180"/>
<pin name="P$8" x="-7.62" y="10.16" length="middle" rot="R180"/>
<pin name="P$9" x="-7.62" y="7.62" length="middle" rot="R180"/>
<pin name="P$10" x="-7.62" y="5.08" length="middle" rot="R180"/>
<wire x1="-27.94" y1="17.78" x2="-27.94" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-27.94" y1="2.54" x2="-12.7" y2="2.54" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="2.54" x2="-12.7" y2="17.78" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="17.78" x2="-27.94" y2="17.78" width="0.1524" layer="94"/>
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
<symbol name="MH-MINI-360">
<wire x1="-12.7" y1="7.62" x2="-12.7" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="-12.7" y1="-10.16" x2="2.54" y2="-10.16" width="0.1524" layer="94"/>
<wire x1="2.54" y1="7.62" x2="-12.7" y2="7.62" width="0.1524" layer="94"/>
<pin name="IN-" x="7.62" y="5.08" length="middle" rot="R180"/>
<pin name="OUT-" x="7.62" y="-7.62" length="middle" rot="R180"/>
<pin name="IN+" x="-17.78" y="5.08" length="middle"/>
<pin name="OUT+" x="-17.78" y="-7.62" length="middle"/>
<wire x1="2.54" y1="7.62" x2="2.54" y2="-10.16" width="0.1524" layer="94"/>
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
</symbols>
<devicesets>
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
<deviceset name="2X5FEET">
<gates>
<gate name="G$1" symbol="2X5FEET" x="10.16" y="-12.7"/>
</gates>
<devices>
<device name="" package="2X5FEET">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
<connect gate="G$1" pin="P$10" pad="P$10"/>
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
<deviceset name="MH-MINI-360">
<gates>
<gate name="G$1" symbol="MH-MINI-360" x="-43.18" y="5.08"/>
</gates>
<devices>
<device name="" package="MH-MINI-360">
<connects>
<connect gate="G$1" pin="IN+" pad="P$1"/>
<connect gate="G$1" pin="IN-" pad="P$2"/>
<connect gate="G$1" pin="OUT+" pad="P$4"/>
<connect gate="G$1" pin="OUT-" pad="P$3"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
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
<library name="untitled (1)">
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
<part name="U$3" library="untitled" deviceset="POWER" device=""/>
<part name="U$4" library="untitled" deviceset="POWER" device=""/>
<part name="U$5" library="untitled" deviceset="POWER" device=""/>
<part name="SW1" library="special" library_urn="urn:adsk.eagle:library:367" deviceset="SW_DIP-8" device="" package3d_urn="urn:adsk.eagle:package:26659/2"/>
<part name="U$10" library="untitled" deviceset="FEATHER" device=""/>
<part name="U$11" library="untitled" deviceset="RASPBERRYPI" device=""/>
<part name="U$14" library="untitled" deviceset="2X5FEET" device=""/>
<part name="U$15" library="untitled" deviceset="9FEETPIN" device=""/>
<part name="U$1" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$2" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$6" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$7" library="untitled" deviceset="MH-MINI-360" device=""/>
<part name="U$8" library="untitled" deviceset="PIN" device=""/>
<part name="U$9" library="untitled (1)" deviceset="PIN" device=""/>
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
<text x="135.255" y="31.115" size="1.4224" layer="95">Sensor RX------TX-D1</text>
<text x="135.89" y="34.925" size="1.4224" layer="95">TxD-----D13</text>
<text x="135.89" y="33.02" size="1.4224" layer="95">RxD-----D12</text>
<text x="135.89" y="38.735" size="1.4224" layer="95">EN_VBB ------D6</text>
<text x="135.89" y="36.83" size="1.4224" layer="95">NRDY ------D5</text>
<text x="135.255" y="29.21" size="1.4224" layer="95">Sensor TX -----RX -D0</text>
<text x="-34.925" y="-0.635" size="1.4224" layer="95">PWM</text>
<text x="-35.56" y="1.27" size="1.4224" layer="95">NRDY</text>
<text x="-41.275" y="3.81" size="1.4224" layer="95">IOVCC_REG</text>
<text x="-37.465" y="6.35" size="1.4224" layer="95">EN_VBB</text>
<text x="-34.29" y="8.89" size="1.4224" layer="95">TXD</text>
<text x="-34.29" y="11.43" size="1.4224" layer="95">RXD</text>
<text x="-36.83" y="13.97" size="1.4224" layer="95">IOVCC</text>
<text x="-34.29" y="16.51" size="1.4224" layer="95">VBB</text>
<text x="-34.925" y="19.05" size="1.4224" layer="95">GND</text>
<text x="12.7" y="43.815" size="1.4224" layer="95">12V</text>
<text x="10.795" y="41.275" size="1.4224" layer="95">7V</text>
<text x="10.795" y="38.735" size="1.4224" layer="95">5V</text>
<text x="10.795" y="36.83" size="1.4224" layer="95">3.3V</text>
<text x="43.815" y="44.45" size="1.4224" layer="95">GND</text>
<text x="44.45" y="41.91" size="1.4224" layer="95">GND</text>
<text x="45.085" y="39.37" size="1.4224" layer="95">GND</text>
<text x="45.085" y="34.29" size="1.4224" layer="95">GND</text>
<text x="45.085" y="36.83" size="1.4224" layer="95">GND</text>
<text x="176.53" y="36.195" size="1.778" layer="95">TxD</text>
<text x="176.53" y="33.02" size="1.778" layer="95">RxD</text>
<text x="176.53" y="30.48" size="1.778" layer="95">GND</text>
<text x="171.45" y="27.94" size="1.778" layer="95">VCC/3.3V</text>
</plain>
<instances>
<instance part="U$3" gate="G$1" x="6.985" y="74.295" smashed="yes" rot="R180"/>
<instance part="U$4" gate="G$1" x="172.085" y="-18.415" smashed="yes"/>
<instance part="U$5" gate="G$1" x="170.815" y="2.54" smashed="yes"/>
<instance part="SW1" gate="A" x="43.815" y="0.635" smashed="yes" rot="MR0">
<attribute name="NAME" x="46.99" y="11.43" size="1.778" layer="95" rot="MR0"/>
<attribute name="VALUE" x="48.895" y="-14.605" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="U$10" gate="G$1" x="3.175" y="-43.18" smashed="yes"/>
<instance part="U$11" gate="G$1" x="136.525" y="-38.1" smashed="yes"/>
<instance part="U$14" gate="G$1" x="49.53" y="28.575" smashed="yes"/>
<instance part="U$15" gate="G$1" x="-27.305" y="5.08" smashed="yes"/>
<instance part="U$1" gate="G$1" x="107.315" y="64.135" smashed="yes"/>
<instance part="U$2" gate="G$1" x="100.965" y="28.575" smashed="yes"/>
<instance part="U$6" gate="G$1" x="-22.86" y="59.69" smashed="yes"/>
<instance part="U$7" gate="G$1" x="147.32" y="64.135" smashed="yes"/>
<instance part="U$8" gate="G$1" x="210.185" y="19.685" smashed="yes"/>
<instance part="U$9" gate="G$1" x="79.375" y="-109.855" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="N$4" class="0">
<segment>
<pinref part="U$6" gate="G$1" pin="OUT+"/>
<wire x1="-40.64" y1="52.07" x2="-43.815" y2="52.07" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$2"/>
<wire x1="-43.815" y1="52.07" x2="-43.815" y2="41.275" width="0.1524" layer="91"/>
<wire x1="-43.815" y1="41.275" x2="3.175" y2="41.275" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="8"/>
<wire x1="3.175" y1="41.275" x2="16.51" y2="41.275" width="0.1524" layer="91"/>
<wire x1="36.195" y1="8.255" x2="3.175" y2="8.255" width="0.1524" layer="91"/>
<wire x1="3.175" y1="8.255" x2="3.175" y2="41.275" width="0.1524" layer="91"/>
<junction x="3.175" y="41.275"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="SW1" gate="A" pin="9"/>
<pinref part="U$15" gate="G$1" pin="P$2"/>
<wire x1="51.435" y1="8.255" x2="51.435" y2="17.78" width="0.1524" layer="91"/>
<wire x1="51.435" y1="17.78" x2="-17.145" y2="17.78" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="3.3V"/>
<wire x1="10.795" y1="-20.32" x2="24.13" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="24.13" y1="-20.32" x2="24.13" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$4"/>
<wire x1="16.51" y1="36.195" x2="10.16" y2="36.195" width="0.1524" layer="91"/>
<wire x1="10.16" y1="36.195" x2="10.16" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="10.16" y1="-10.16" x2="24.13" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="5"/>
<wire x1="36.195" y1="0.635" x2="24.13" y2="0.635" width="0.1524" layer="91"/>
<wire x1="24.13" y1="0.635" x2="24.13" y2="-6.985" width="0.1524" layer="91"/>
<junction x="24.13" y="-10.16"/>
<pinref part="SW1" gate="A" pin="2"/>
<wire x1="24.13" y1="-6.985" x2="24.13" y2="-10.16" width="0.1524" layer="91"/>
<wire x1="36.195" y1="-6.985" x2="24.13" y2="-6.985" width="0.1524" layer="91"/>
<junction x="24.13" y="-6.985"/>
</segment>
</net>
<net name="N$7" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="P$3"/>
<wire x1="57.15" y1="15.24" x2="-17.145" y2="15.24" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="12"/>
<wire x1="51.435" y1="0.635" x2="57.15" y2="0.635" width="0.1524" layer="91"/>
<wire x1="57.15" y1="0.635" x2="57.15" y2="15.24" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="P$4"/>
<wire x1="-17.145" y1="12.7" x2="31.75" y2="12.7" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D1"/>
<wire x1="31.75" y1="12.7" x2="31.75" y2="-53.34" width="0.1524" layer="91"/>
<wire x1="31.75" y1="-53.34" x2="10.795" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$9" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="P$5"/>
<wire x1="-17.145" y1="10.16" x2="27.305" y2="10.16" width="0.1524" layer="91"/>
<wire x1="27.305" y1="10.16" x2="27.305" y2="-50.8" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D0"/>
<wire x1="27.305" y1="-50.8" x2="10.795" y2="-50.8" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="U$2" gate="G$1" pin="OUT+"/>
<wire x1="83.185" y1="20.955" x2="78.105" y2="20.955" width="0.1524" layer="91"/>
<wire x1="78.105" y1="20.955" x2="71.755" y2="20.955" width="0.1524" layer="91"/>
<wire x1="71.755" y1="20.955" x2="71.755" y2="27.94" width="0.1524" layer="91"/>
<wire x1="71.755" y1="27.94" x2="17.145" y2="27.94" width="0.1524" layer="91"/>
<wire x1="17.145" y1="27.94" x2="13.335" y2="27.94" width="0.1524" layer="91"/>
<wire x1="13.335" y1="27.94" x2="13.335" y2="26.67" width="0.1524" layer="91"/>
<wire x1="13.335" y1="26.67" x2="5.715" y2="26.67" width="0.1524" layer="91"/>
<wire x1="5.715" y1="26.67" x2="5.715" y2="38.735" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$3"/>
<wire x1="5.715" y1="38.735" x2="16.51" y2="38.735" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="7"/>
<wire x1="36.195" y1="5.715" x2="33.02" y2="5.715" width="0.1524" layer="91"/>
<wire x1="33.02" y1="5.715" x2="33.02" y2="19.05" width="0.1524" layer="91"/>
<wire x1="33.02" y1="19.05" x2="78.105" y2="19.05" width="0.1524" layer="91"/>
<wire x1="78.105" y1="19.05" x2="78.105" y2="20.955" width="0.1524" layer="91"/>
<junction x="78.105" y="20.955"/>
<pinref part="SW1" gate="A" pin="6"/>
<wire x1="36.195" y1="3.175" x2="17.145" y2="3.175" width="0.1524" layer="91"/>
<wire x1="17.145" y1="3.175" x2="17.145" y2="27.94" width="0.1524" layer="91"/>
<junction x="17.145" y="27.94"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="SW1" gate="A" pin="10"/>
<wire x1="51.435" y1="5.715" x2="62.865" y2="5.715" width="0.1524" layer="91"/>
<wire x1="62.865" y1="5.715" x2="62.865" y2="23.495" width="0.1524" layer="91"/>
<wire x1="62.865" y1="23.495" x2="-13.335" y2="23.495" width="0.1524" layer="91"/>
<wire x1="-13.335" y1="23.495" x2="-13.335" y2="-6.35" width="0.1524" layer="91"/>
<wire x1="-13.335" y1="-6.35" x2="-33.02" y2="-6.35" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="-6.35" x2="-33.02" y2="-5.715" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="VBUS"/>
<wire x1="-33.02" y1="-6.35" x2="-33.02" y2="-33.02" width="0.1524" layer="91"/>
<wire x1="-33.02" y1="-33.02" x2="-27.305" y2="-33.02" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="SW1" gate="A" pin="11"/>
<wire x1="51.435" y1="3.175" x2="134.62" y2="3.175" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="5V/02"/>
<wire x1="134.62" y1="3.175" x2="134.62" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="134.62" y1="-20.32" x2="126.365" y2="-20.32" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$15" class="0">
<segment>
<wire x1="-33.655" y1="-55.88" x2="-33.655" y2="-13.335" width="0.1524" layer="91"/>
<wire x1="-33.655" y1="-13.335" x2="139.065" y2="-13.335" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="TXD/08"/>
<wire x1="139.065" y1="-13.335" x2="139.065" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="139.065" y1="-27.94" x2="126.365" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D2"/>
<wire x1="-33.655" y1="-55.88" x2="-27.305" y2="-55.88" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$16" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="RXD/10"/>
<wire x1="126.365" y1="-30.48" x2="137.16" y2="-30.48" width="0.1524" layer="91"/>
<wire x1="137.16" y1="-30.48" x2="137.16" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="137.16" y1="-7.62" x2="65.405" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="65.405" y1="-7.62" x2="65.405" y2="-6.985" width="0.1524" layer="91"/>
<wire x1="65.405" y1="-6.985" x2="62.865" y2="-6.985" width="0.1524" layer="91"/>
<wire x1="62.865" y1="-6.985" x2="62.865" y2="-23.495" width="0.1524" layer="91"/>
<wire x1="62.865" y1="-23.495" x2="18.415" y2="-23.495" width="0.1524" layer="91"/>
<wire x1="18.415" y1="-23.495" x2="18.415" y2="-3.81" width="0.1524" layer="91"/>
<wire x1="18.415" y1="-3.81" x2="-38.1" y2="-3.81" width="0.1524" layer="91"/>
<wire x1="-38.1" y1="-3.81" x2="-38.1" y2="-53.34" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="D3"/>
<wire x1="-38.1" y1="-53.34" x2="-27.305" y2="-53.34" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$17" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="OUT+"/>
<wire x1="89.535" y1="56.515" x2="89.535" y2="48.26" width="0.1524" layer="91"/>
<wire x1="89.535" y1="48.26" x2="75.565" y2="48.26" width="0.1524" layer="91"/>
<wire x1="75.565" y1="48.26" x2="75.565" y2="25.4" width="0.1524" layer="91"/>
<wire x1="75.565" y1="25.4" x2="24.13" y2="25.4" width="0.1524" layer="91"/>
<wire x1="24.13" y1="25.4" x2="24.13" y2="5.08" width="0.1524" layer="91"/>
<wire x1="24.13" y1="5.08" x2="20.955" y2="5.08" width="0.1524" layer="91"/>
<wire x1="20.955" y1="5.08" x2="20.955" y2="-3.81" width="0.1524" layer="91"/>
<wire x1="20.955" y1="-3.81" x2="29.845" y2="-3.81" width="0.1524" layer="91"/>
<wire x1="29.845" y1="-3.81" x2="29.845" y2="-1.905" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="4"/>
<wire x1="29.845" y1="-1.905" x2="36.195" y2="-1.905" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$14" class="0">
<segment>
<pinref part="SW1" gate="A" pin="13"/>
<wire x1="51.435" y1="-1.905" x2="123.825" y2="-1.905" width="0.1524" layer="91"/>
<wire x1="123.825" y1="-1.905" x2="123.825" y2="13.97" width="0.1524" layer="91"/>
<wire x1="123.825" y1="13.97" x2="158.115" y2="13.97" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="VBB"/>
<wire x1="158.115" y1="13.97" x2="158.115" y2="10.16" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$18" class="0">
<segment>
<pinref part="U$7" gate="G$1" pin="IN+"/>
<wire x1="129.54" y1="69.215" x2="129.54" y2="78.74" width="0.1524" layer="91"/>
<wire x1="129.54" y1="78.74" x2="44.45" y2="78.74" width="0.1524" layer="91"/>
<wire x1="44.45" y1="78.74" x2="44.45" y2="55.88" width="0.1524" layer="91"/>
<wire x1="44.45" y1="55.88" x2="10.795" y2="55.88" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="VBB"/>
<wire x1="19.685" y1="66.675" x2="19.685" y2="61.595" width="0.1524" layer="91"/>
<wire x1="19.685" y1="61.595" x2="19.685" y2="59.055" width="0.1524" layer="91"/>
<wire x1="19.685" y1="59.055" x2="19.685" y2="53.34" width="0.1524" layer="91"/>
<wire x1="19.685" y1="53.34" x2="10.795" y2="53.34" width="0.1524" layer="91"/>
<wire x1="10.795" y1="53.34" x2="6.35" y2="53.34" width="0.1524" layer="91"/>
<wire x1="6.35" y1="53.34" x2="6.35" y2="46.355" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$1"/>
<wire x1="6.35" y1="46.355" x2="6.35" y2="43.815" width="0.1524" layer="91"/>
<wire x1="6.35" y1="43.815" x2="16.51" y2="43.815" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="IN+"/>
<wire x1="-40.64" y1="64.77" x2="-44.45" y2="64.77" width="0.1524" layer="91"/>
<wire x1="-44.45" y1="64.77" x2="-44.45" y2="74.93" width="0.1524" layer="91"/>
<wire x1="-44.45" y1="74.93" x2="-2.54" y2="74.93" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="74.93" x2="-2.54" y2="46.355" width="0.1524" layer="91"/>
<wire x1="-2.54" y1="46.355" x2="6.35" y2="46.355" width="0.1524" layer="91"/>
<junction x="6.35" y="46.355"/>
<pinref part="U$2" gate="G$1" pin="IN+"/>
<wire x1="83.185" y1="33.655" x2="83.185" y2="59.055" width="0.1524" layer="91"/>
<wire x1="83.185" y1="59.055" x2="19.685" y2="59.055" width="0.1524" layer="91"/>
<junction x="19.685" y="59.055"/>
<pinref part="U$1" gate="G$1" pin="IN+"/>
<wire x1="89.535" y1="69.215" x2="89.535" y2="61.595" width="0.1524" layer="91"/>
<wire x1="89.535" y1="61.595" x2="19.685" y2="61.595" width="0.1524" layer="91"/>
<junction x="19.685" y="61.595"/>
<wire x1="10.795" y1="55.88" x2="10.795" y2="53.34" width="0.1524" layer="91"/>
<junction x="10.795" y="53.34"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="U$7" gate="G$1" pin="OUT+"/>
<wire x1="129.54" y1="56.515" x2="129.54" y2="46.355" width="0.1524" layer="91"/>
<wire x1="129.54" y1="46.355" x2="67.945" y2="46.355" width="0.1524" layer="91"/>
<wire x1="67.945" y1="46.355" x2="67.945" y2="20.955" width="0.1524" layer="91"/>
<wire x1="67.945" y1="20.955" x2="30.48" y2="20.955" width="0.1524" layer="91"/>
<wire x1="30.48" y1="20.955" x2="30.48" y2="-4.445" width="0.1524" layer="91"/>
<pinref part="SW1" gate="A" pin="3"/>
<wire x1="30.48" y1="-4.445" x2="36.195" y2="-4.445" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$19" class="0">
<segment>
<pinref part="SW1" gate="A" pin="14"/>
<wire x1="51.435" y1="-4.445" x2="144.145" y2="-4.445" width="0.1524" layer="91"/>
<wire x1="144.145" y1="-4.445" x2="144.145" y2="-11.43" width="0.1524" layer="91"/>
<pinref part="U$4" gate="G$1" pin="VBB"/>
<wire x1="144.145" y1="-11.43" x2="159.385" y2="-11.43" width="0.1524" layer="91"/>
<wire x1="159.385" y1="-11.43" x2="159.385" y2="-10.795" width="0.1524" layer="91"/>
</segment>
</net>
<net name="GND" class="0">
<segment>
<pinref part="U$4" gate="G$1" pin="GND2"/>
<wire x1="169.545" y1="-26.035" x2="177.8" y2="-26.035" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="GND"/>
<wire x1="177.8" y1="-26.035" x2="177.8" y2="-23.495" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-23.495" x2="177.8" y2="-5.08" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-5.08" x2="177.8" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="177.8" y1="-2.54" x2="168.275" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="GND2"/>
<wire x1="168.275" y1="-5.08" x2="177.8" y2="-5.08" width="0.1524" layer="91"/>
<junction x="177.8" y="-5.08"/>
<pinref part="U$4" gate="G$1" pin="GND"/>
<wire x1="169.545" y1="-23.495" x2="177.8" y2="-23.495" width="0.1524" layer="91"/>
<junction x="177.8" y="-23.495"/>
<wire x1="177.8" y1="-2.54" x2="177.8" y2="4.445" width="0.1524" layer="91"/>
<wire x1="177.8" y1="4.445" x2="177.8" y2="16.51" width="0.1524" layer="91"/>
<wire x1="177.8" y1="16.51" x2="54.61" y2="16.51" width="0.1524" layer="91"/>
<junction x="177.8" y="-2.54"/>
<pinref part="U$7" gate="G$1" pin="OUT-"/>
<wire x1="154.94" y1="56.515" x2="163.195" y2="56.515" width="0.1524" layer="91"/>
<pinref part="U$7" gate="G$1" pin="IN-"/>
<wire x1="163.195" y1="56.515" x2="163.195" y2="69.215" width="0.1524" layer="91"/>
<wire x1="163.195" y1="69.215" x2="154.94" y2="69.215" width="0.1524" layer="91"/>
<wire x1="163.195" y1="69.215" x2="163.195" y2="73.66" width="0.1524" layer="91"/>
<wire x1="163.195" y1="73.66" x2="120.015" y2="73.66" width="0.1524" layer="91"/>
<junction x="163.195" y="69.215"/>
<pinref part="U$1" gate="G$1" pin="OUT-"/>
<wire x1="114.935" y1="56.515" x2="120.015" y2="56.515" width="0.1524" layer="91"/>
<wire x1="120.015" y1="56.515" x2="120.015" y2="69.215" width="0.1524" layer="91"/>
<pinref part="U$1" gate="G$1" pin="IN-"/>
<wire x1="120.015" y1="69.215" x2="114.935" y2="69.215" width="0.1524" layer="91"/>
<wire x1="120.015" y1="73.66" x2="120.015" y2="69.215" width="0.1524" layer="91"/>
<junction x="120.015" y="69.215"/>
<pinref part="U$2" gate="G$1" pin="OUT-"/>
<wire x1="108.585" y1="20.955" x2="113.665" y2="20.955" width="0.1524" layer="91"/>
<wire x1="113.665" y1="20.955" x2="113.665" y2="40.64" width="0.1524" layer="91"/>
<wire x1="113.665" y1="40.64" x2="67.945" y2="40.64" width="0.1524" layer="91"/>
<wire x1="67.945" y1="40.64" x2="67.945" y2="38.735" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="GND"/>
<wire x1="9.525" y1="79.375" x2="2.54" y2="79.375" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="GND2"/>
<wire x1="9.525" y1="81.915" x2="2.54" y2="81.915" width="0.1524" layer="91"/>
<wire x1="2.54" y1="81.915" x2="2.54" y2="79.375" width="0.1524" layer="91"/>
<wire x1="2.54" y1="79.375" x2="2.54" y2="50.8" width="0.1524" layer="91"/>
<wire x1="2.54" y1="50.8" x2="66.675" y2="50.8" width="0.1524" layer="91"/>
<junction x="2.54" y="79.375"/>
<pinref part="U$14" gate="G$1" pin="P$6"/>
<wire x1="41.91" y1="43.815" x2="54.61" y2="43.815" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$10"/>
<wire x1="54.61" y1="43.815" x2="66.675" y2="43.815" width="0.1524" layer="91"/>
<wire x1="66.675" y1="43.815" x2="66.675" y2="41.275" width="0.1524" layer="91"/>
<wire x1="66.675" y1="41.275" x2="66.675" y2="38.735" width="0.1524" layer="91"/>
<wire x1="66.675" y1="38.735" x2="66.675" y2="36.195" width="0.1524" layer="91"/>
<wire x1="66.675" y1="36.195" x2="66.675" y2="34.925" width="0.1524" layer="91"/>
<wire x1="66.675" y1="34.925" x2="66.675" y2="33.655" width="0.1524" layer="91"/>
<wire x1="66.675" y1="33.655" x2="54.61" y2="33.655" width="0.1524" layer="91"/>
<pinref part="U$14" gate="G$1" pin="P$9"/>
<wire x1="54.61" y1="33.655" x2="41.91" y2="33.655" width="0.1524" layer="91"/>
<wire x1="41.91" y1="36.195" x2="66.675" y2="36.195" width="0.1524" layer="91"/>
<junction x="66.675" y="36.195"/>
<pinref part="U$14" gate="G$1" pin="P$8"/>
<wire x1="41.91" y1="38.735" x2="66.675" y2="38.735" width="0.1524" layer="91"/>
<junction x="66.675" y="38.735"/>
<pinref part="U$14" gate="G$1" pin="P$7"/>
<wire x1="41.91" y1="41.275" x2="66.675" y2="41.275" width="0.1524" layer="91"/>
<junction x="66.675" y="41.275"/>
<wire x1="66.675" y1="50.8" x2="66.675" y2="43.815" width="0.1524" layer="91"/>
<junction x="66.675" y="43.815"/>
<pinref part="U$15" gate="G$1" pin="P$1"/>
<wire x1="-17.145" y1="20.32" x2="66.675" y2="20.32" width="0.1524" layer="91"/>
<wire x1="66.675" y1="20.32" x2="66.675" y2="33.655" width="0.1524" layer="91"/>
<junction x="66.675" y="33.655"/>
<pinref part="U$6" gate="G$1" pin="IN-"/>
<wire x1="-15.24" y1="64.77" x2="66.675" y2="64.77" width="0.1524" layer="91"/>
<wire x1="66.675" y1="64.77" x2="66.675" y2="52.07" width="0.1524" layer="91"/>
<junction x="66.675" y="50.8"/>
<pinref part="U$6" gate="G$1" pin="OUT-"/>
<wire x1="66.675" y1="52.07" x2="66.675" y2="50.8" width="0.1524" layer="91"/>
<wire x1="-15.24" y1="52.07" x2="66.675" y2="52.07" width="0.1524" layer="91"/>
<junction x="66.675" y="52.07"/>
<pinref part="U$2" gate="G$1" pin="IN-"/>
<wire x1="108.585" y1="33.655" x2="108.585" y2="43.815" width="0.1524" layer="91"/>
<wire x1="108.585" y1="43.815" x2="66.675" y2="43.815" width="0.1524" layer="91"/>
<wire x1="67.945" y1="38.735" x2="66.675" y2="38.735" width="0.1524" layer="91"/>
<wire x1="66.675" y1="33.655" x2="71.12" y2="33.655" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="GND2"/>
<wire x1="10.795" y1="-55.88" x2="71.755" y2="-55.88" width="0.1524" layer="91"/>
<wire x1="71.755" y1="-55.88" x2="71.755" y2="-55.245" width="0.1524" layer="91"/>
<wire x1="71.12" y1="33.655" x2="71.12" y2="-55.245" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-55.245" x2="71.755" y2="-55.245" width="0.1524" layer="91"/>
<pinref part="U$11" gate="G$1" pin="34"/>
<wire x1="126.365" y1="-60.96" x2="142.24" y2="-60.96" width="0.1524" layer="91"/>
<wire x1="142.24" y1="-60.96" x2="142.24" y2="34.925" width="0.1524" layer="91"/>
<wire x1="142.24" y1="34.925" x2="66.675" y2="34.925" width="0.1524" layer="91"/>
<junction x="66.675" y="34.925"/>
<wire x1="120.015" y1="73.66" x2="54.61" y2="73.66" width="0.1524" layer="91"/>
<wire x1="54.61" y1="73.66" x2="54.61" y2="43.815" width="0.1524" layer="91"/>
<junction x="120.015" y="73.66"/>
<junction x="54.61" y="43.815"/>
<wire x1="54.61" y1="16.51" x2="54.61" y2="33.655" width="0.1524" layer="91"/>
<junction x="54.61" y="33.655"/>
<pinref part="U$8" gate="G$1" pin="P$2"/>
<wire x1="194.945" y1="31.75" x2="208.28" y2="31.75" width="0.1524" layer="91"/>
<wire x1="208.28" y1="31.75" x2="208.28" y2="4.445" width="0.1524" layer="91"/>
<wire x1="208.28" y1="4.445" x2="177.8" y2="4.445" width="0.1524" layer="91"/>
<junction x="177.8" y="4.445"/>
</segment>
</net>
<net name="N$13" class="0">
<segment>
<pinref part="SW1" gate="A" pin="15"/>
<wire x1="51.435" y1="-6.985" x2="59.69" y2="-6.985" width="0.1524" layer="91"/>
<wire x1="59.69" y1="-6.985" x2="59.69" y2="4.445" width="0.1524" layer="91"/>
<wire x1="59.69" y1="4.445" x2="116.84" y2="4.445" width="0.1524" layer="91"/>
<wire x1="116.84" y1="4.445" x2="116.84" y2="24.13" width="0.1524" layer="91"/>
<wire x1="116.84" y1="24.13" x2="200.66" y2="24.13" width="0.1524" layer="91"/>
<pinref part="U$8" gate="G$1" pin="P$1"/>
<wire x1="200.66" y1="24.13" x2="200.66" y2="29.21" width="0.1524" layer="91"/>
<wire x1="200.66" y1="29.21" x2="194.945" y2="29.21" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$6" class="0">
<segment>
<pinref part="U$8" gate="G$1" pin="P$4"/>
<wire x1="194.945" y1="36.83" x2="222.25" y2="36.83" width="0.1524" layer="91"/>
<wire x1="222.25" y1="36.83" x2="222.25" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="222.25" y1="-86.36" x2="223.52" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-86.36" x2="223.52" y2="-100.965" width="0.1524" layer="91"/>
<wire x1="223.52" y1="-100.965" x2="71.12" y2="-100.965" width="0.1524" layer="91"/>
<wire x1="71.12" y1="-100.965" x2="71.12" y2="-95.25" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="P$3"/>
<wire x1="71.12" y1="-95.25" x2="64.135" y2="-95.25" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$10" class="0">
<segment>
<pinref part="U$10" gate="G$1" pin="D5"/>
<wire x1="-40.64" y1="-86.36" x2="-40.64" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="-50.8" x2="-27.305" y2="-50.8" width="0.1524" layer="91"/>
<wire x1="-40.64" y1="-86.36" x2="69.215" y2="-86.36" width="0.1524" layer="91"/>
<wire x1="69.215" y1="-86.36" x2="69.215" y2="-92.71" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="P$4"/>
<wire x1="69.215" y1="-92.71" x2="64.135" y2="-92.71" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$20" class="0">
<segment>
<pinref part="U$11" gate="G$1" pin="07"/>
<wire x1="90.805" y1="-27.94" x2="76.835" y2="-27.94" width="0.1524" layer="91"/>
<wire x1="76.835" y1="-27.94" x2="76.835" y2="-94.615" width="0.1524" layer="91"/>
<wire x1="76.835" y1="-94.615" x2="73.66" y2="-94.615" width="0.1524" layer="91"/>
<wire x1="73.66" y1="-94.615" x2="73.66" y2="-90.17" width="0.1524" layer="91"/>
<pinref part="U$9" gate="G$1" pin="P$5"/>
<wire x1="73.66" y1="-90.17" x2="64.135" y2="-90.17" width="0.1524" layer="91"/>
<wire x1="64.135" y1="-90.17" x2="64.135" y2="-90.4875" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$21" class="0">
<segment>
<pinref part="U$15" gate="G$1" pin="P$6"/>
<wire x1="-17.145" y1="7.62" x2="-8.255" y2="7.62" width="0.1524" layer="91"/>
<wire x1="-8.255" y1="7.62" x2="-8.255" y2="5.08" width="0.1524" layer="91"/>
<wire x1="-8.255" y1="5.08" x2="15.875" y2="5.08" width="0.1524" layer="91"/>
<wire x1="15.875" y1="5.08" x2="15.875" y2="-27.94" width="0.1524" layer="91"/>
<pinref part="U$10" gate="G$1" pin="A0"/>
<wire x1="15.875" y1="-27.94" x2="10.795" y2="-27.94" width="0.1524" layer="91"/>
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
