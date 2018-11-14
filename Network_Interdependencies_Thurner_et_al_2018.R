# necessary R-packages


library(statnet)
library(xergm)
library(xergm.common)
library(PRROC)
library(reshape)
library(ggplot2)
library(reshape)
library(gridExtra)
library(igraph)
library(grid)
library(plyr)




## file to read in SIPRI Data

laenderliste <- read.csv("laenderliste.csv", header=FALSE)

## help-function to find the row number of a given nation

natnum<-function(nation){which((laenderliste$V1)==nation)}


## help-function to find the nation for a given COW-number (Correlates of War)

cownat<- function(number){which((laenderliste$COW)==number)}

cownat2<- function(number){which((laenderliste$COW2)==number)}


# adding COW to laenderliste

laenderliste$COW<-0

laenderliste$COW[2]<-700
laenderliste$COW[3]<-339
laenderliste$COW[4]<-615
laenderliste$COW[5]<-232
laenderliste$COW[6]<-540
laenderliste$COW[7]<-58
laenderliste$COW[8]<-160
laenderliste$COW[9]<-371
laenderliste$COW[11]<-900
laenderliste$COW[12]<-305
laenderliste$COW[13]<-373
laenderliste$COW[14]<-31
laenderliste$COW[15]<-692
laenderliste$COW[16]<-771
laenderliste$COW[17]<-53
laenderliste$COW[18]<-370
laenderliste$COW[19]<-211
laenderliste$COW[20]<-80
laenderliste$COW[21]<-434
laenderliste$COW[22]<-760
laenderliste$COW[24]<-145
laenderliste$COW[25]<-346
laenderliste$COW[26]<-571
laenderliste$COW[27]<-140
laenderliste$COW[28]<-835
laenderliste$COW[29]<-355
laenderliste$COW[30]<-439
laenderliste$COW[31]<-516
laenderliste$COW[32]<-811
laenderliste$COW[33]<-471
laenderliste$COW[34]<-20
laenderliste$COW[35]<-402
laenderliste$COW[36]<-482
laenderliste$COW[37]<-483
laenderliste$COW[38]<-155
laenderliste$COW[39]<-710
laenderliste$COW[40]<-100
laenderliste$COW[41]<-581
laenderliste$COW[42]<-490
laenderliste$COW[43]<-484
laenderliste$COW[45]<-94
laenderliste$COW[46]<-437
laenderliste$COW[47]<-344
laenderliste$COW[48]<-40
laenderliste$COW[49]<-352
laenderliste$COW[51]<-316
laenderliste$COW[52]<-315
laenderliste$COW[54]<-390
laenderliste$COW[55]<-522
laenderliste$COW[56]<-54
laenderliste$COW[57]<-42
laenderliste$COW[58]<-130
laenderliste$COW[59]<-651
laenderliste$COW[60]<-92
laenderliste$COW[61]<-411
laenderliste$COW[62]<-531
laenderliste$COW[63]<-366
laenderliste$COW[64]<-530
laenderliste$COW[65]<-950
laenderliste$COW[66]<-375
laenderliste$COW[67]<-220
laenderliste$COW[68]<-481
laenderliste$COW[69]<-420
laenderliste$COW[70]<-372
laenderliste$COW[71]<-265
laenderliste$COW[72]<-255
laenderliste$COW[73]<-452
laenderliste$COW[74]<-350
laenderliste$COW[75]<-55
laenderliste$COW[76]<-90
laenderliste$COW[77]<-438
laenderliste$COW[78]<-404
laenderliste$COW[79]<-110
laenderliste$COW[80]<-41
laenderliste$COW[81]<-91
laenderliste$COW[82]<-310
laenderliste$COW[83]<-395
laenderliste$COW[84]<-750
laenderliste$COW[85]<-850
laenderliste$COW[86]<-630
laenderliste$COW[87]<-645
laenderliste$COW[88]<-205
laenderliste$COW[89]<-666
laenderliste$COW[90]<-325
laenderliste$COW[91]<-51
laenderliste$COW[92]<-740
laenderliste$COW[93]<-663
laenderliste$COW[95]<-705
laenderliste$COW[96]<-501
laenderliste$COW[97]<-946
laenderliste$COW[98]<-731
laenderliste$COW[99]<-732
laenderliste$COW[100]<-347
laenderliste$COW[101]<-690
laenderliste$COW[102]<-703
laenderliste$COW[103]<-812
laenderliste$COW[104]<-367
laenderliste$COW[105]<-660
laenderliste$COW[106]<-570
laenderliste$COW[107]<-450
laenderliste$COW[108]<-620
laenderliste$COW[109]<-223
laenderliste$COW[110]<-368
laenderliste$COW[111]<-212
laenderliste$COW[112]<-343
laenderliste$COW[113]<-580
laenderliste$COW[114]<-553
laenderliste$COW[115]<-820
laenderliste$COW[116]<-781
laenderliste$COW[117]<-432
laenderliste$COW[118]<-338
laenderliste$COW[119]<-983
laenderliste$COW[120]<-435
laenderliste$COW[121]<-590
laenderliste$COW[122]<-70
laenderliste$COW[123]<-987
laenderliste$COW[124]<-359
laenderliste$COW[125]<-221
laenderliste$COW[126]<-712
laenderliste$COW[127]<-431
laenderliste$COW[128]<-600
laenderliste$COW[129]<-541
laenderliste$COW[130]<-775
laenderliste$COW[131]<-565
laenderliste$COW[132]<-970
laenderliste$COW[133]<-790
laenderliste$COW[134]<-210
laenderliste$COW[135]<-920
laenderliste$COW[136]<-93
laenderliste$COW[137]<-436
laenderliste$COW[138]<-475
laenderliste$COW[140]<-385
laenderliste$COW[141]<-698
laenderliste$COW[142]<-770
laenderliste$COW[143]<-986
laenderliste$COW[144]<-0
laenderliste$COW[145]<-95
laenderliste$COW[146]<-910
laenderliste$COW[147]<-150
laenderliste$COW[148]<-135
laenderliste$COW[149]<-840
laenderliste$COW[150]<-290
laenderliste$COW[151]<-235
laenderliste$COW[152]<-694
laenderliste$COW[153]<-360
laenderliste$COW[154]<-365
laenderliste$COW[155]<-517
laenderliste$COW[156]<-60
laenderliste$COW[157]<-56
laenderliste$COW[158]<-57
laenderliste$COW[159]<-990
laenderliste$COW[160]<-331
laenderliste$COW[161]<-403
laenderliste$COW[162]<-670
laenderliste$COW[163]<-433
laenderliste$COW[164]<-345
laenderliste$COW[165]<-591
laenderliste$COW[166]<-451
laenderliste$COW[167]<-830
laenderliste$COW[168]<-317
laenderliste$COW[169]<-349
laenderliste$COW[170]<-940
laenderliste$COW[171]<-520
laenderliste$COW[173]<-560
laenderliste$COW[175]<-626
laenderliste$COW[176]<-365
laenderliste$COW[177]<-230
laenderliste$COW[178]<-780
laenderliste$COW[179]<-625
laenderliste$COW[180]<-115
laenderliste$COW[181]<-572
laenderliste$COW[182]<-380
laenderliste$COW[183]<-225
laenderliste$COW[184]<-652
laenderliste$COW[185]<-713
laenderliste$COW[186]<-702
laenderliste$COW[187]<-510
laenderliste$COW[188]<-800
laenderliste$COW[189]<-860
laenderliste$COW[190]<-461
laenderliste$COW[191]<-955
laenderliste$COW[193]<-52
laenderliste$COW[194]<-616
laenderliste$COW[195]<-640
laenderliste$COW[196]<-701
laenderliste$COW[197]<-947
laenderliste$COW[198]<-500
laenderliste$COW[199]<-369
laenderliste$COW[200]<-696
laenderliste$COW[201]<-200
laenderliste$COW[202]<-2
laenderliste$COW[209]<-165
laenderliste$COW[210]<-704
laenderliste$COW[211]<-935
laenderliste$COW[212]<-327
laenderliste$COW[213]<-101
laenderliste$COW[214]<-816
laenderliste$COW[216]<-817
laenderliste$COW[218]<-679
laenderliste$COW[219]<-678
laenderliste$COW[220]<-680
laenderliste$COW[221]<-345
laenderliste$COW[222]<-551
laenderliste$COW[223]<-511
laenderliste$COW[224]<-552
#View(laenderliste)

# country label in SIPRI Data

laenderliste$SIPRI<-0

laenderliste$SIPRI[1]<-'Abkhazia' 
laenderliste$SIPRI[2]<- 'Afghanistan'
laenderliste$SIPRI[3]<- 'Albania'
laenderliste$SIPRI[4]<- 'Algeria'
laenderliste$SIPRI[5]<- 'Andorra'
laenderliste$SIPRI[6]<- 'Angola'
laenderliste$SIPRI[7]<- 'Antigua and Barbuda'
laenderliste$SIPRI[8]<- 'Argentina'
laenderliste$SIPRI[9]<- 'Armenia'
laenderliste$SIPRI[10]<- 'Aruba'
laenderliste$SIPRI[11]<- 'Australia'
laenderliste$SIPRI[12]<- 'Austria'
laenderliste$SIPRI[13]<- 'Azerbaijan'
laenderliste$SIPRI[14]<- 'Bahamas'
laenderliste$SIPRI[15]<- 'Bahrain'
laenderliste$SIPRI[16]<- 'Bangladesh'
laenderliste$SIPRI[17]<- 'Barbados'
laenderliste$SIPRI[18]<- 'Belarus'
laenderliste$SIPRI[19]<- 'Belgium'
laenderliste$SIPRI[20]<- 'Belize'
laenderliste$SIPRI[21]<- 'Benin'
laenderliste$SIPRI[22]<- 'Bhutan'
laenderliste$SIPRI[23]<- 'Biafra'
laenderliste$SIPRI[24]<- 'Bolivia'
laenderliste$SIPRI[25]<- 'Bosnia and Herzegovina'
laenderliste$SIPRI[26]<- 'Botswana'
laenderliste$SIPRI[27]<- 'Brazil'
laenderliste$SIPRI[28]<- 'Brunei'
laenderliste$SIPRI[29]<- 'Bulgaria'
laenderliste$SIPRI[30]<- 'Burkina Faso'
laenderliste$SIPRI[31]<- 'Burundi'
laenderliste$SIPRI[32]<- 'Cambodia'
laenderliste$SIPRI[33]<- 'Cameroon'
laenderliste$SIPRI[34]<- 'Canada'
laenderliste$SIPRI[35]<- 'Cape Verde'
laenderliste$SIPRI[36]<- 'Central African Republic'
laenderliste$SIPRI[37]<- 'Chad'
laenderliste$SIPRI[38]<- 'Chile'
laenderliste$SIPRI[39]<- 'China'
laenderliste$SIPRI[40]<- 'Colombia'
laenderliste$SIPRI[41]<- 'Comoros'
laenderliste$SIPRI[42]<- 'DR Congo'
laenderliste$SIPRI[43]<- 'Congo'
laenderliste$SIPRI[44]<- 'Cook Islands'
laenderliste$SIPRI[45]<- 'Costa Rica'
laenderliste$SIPRI[46]<- 'Cote dIvoire'
laenderliste$SIPRI[47]<- 'Croatia'
laenderliste$SIPRI[48]<- 'Cuba'
laenderliste$SIPRI[49]<- 'Cyprus'
laenderliste$SIPRI[50]<- 'Northern Cyprus'
laenderliste$SIPRI[51]<- 'Czech Republic'
laenderliste$SIPRI[52]<- 'Czechoslovakia'
laenderliste$SIPRI[53]<- 'Darfur'
laenderliste$SIPRI[54]<- 'Denmark'
laenderliste$SIPRI[55]<- 'Djibouti'
laenderliste$SIPRI[56]<- 'Dominica'
laenderliste$SIPRI[57]<- 'Dominican Republic'
laenderliste$SIPRI[58]<- 'Ecuador'
laenderliste$SIPRI[59]<- 'Egypt'
laenderliste$SIPRI[60]<- 'El Salvador'
laenderliste$SIPRI[61]<- 'Equatorial Guinea'
laenderliste$SIPRI[62]<- 'Eritrea'
laenderliste$SIPRI[63]<- 'Estonia'
laenderliste$SIPRI[64]<- 'Ethiopia'
laenderliste$SIPRI[65]<- 'Fiji'
laenderliste$SIPRI[66]<- 'Finland'
laenderliste$SIPRI[67]<- 'France'
laenderliste$SIPRI[68]<- 'Gabon'
laenderliste$SIPRI[69]<- 'Gambia'
laenderliste$SIPRI[70]<- 'Georgia'
laenderliste$SIPRI[71]<- 'German Democratic Republic'
laenderliste$SIPRI[72]<- 'Germany (FRG)'
laenderliste$SIPRI[73]<- 'Ghana'
laenderliste$SIPRI[74]<- 'Greece'
laenderliste$SIPRI[75]<- 'Grenada'
laenderliste$SIPRI[76]<- 'Guatemala'
laenderliste$SIPRI[77]<- 'Guinea'
laenderliste$SIPRI[78]<- 'Guinea-Bissau'
laenderliste$SIPRI[79]<- 'Guyana'
laenderliste$SIPRI[80]<- 'Haiti'
laenderliste$SIPRI[81]<- 'Honduras'
laenderliste$SIPRI[82]<- 'Hungary'
laenderliste$SIPRI[83]<- 'Iceland'
laenderliste$SIPRI[84]<- 'India'
laenderliste$SIPRI[85]<- 'Indonesia'
laenderliste$SIPRI[86]<- 'Iran'
laenderliste$SIPRI[87]<- 'Iraq'
laenderliste$SIPRI[88]<- 'Ireland'
laenderliste$SIPRI[89]<- 'Israel'
laenderliste$SIPRI[90]<- 'Italy'
laenderliste$SIPRI[91]<- 'Jamaica'
laenderliste$SIPRI[92]<- 'Japan'
laenderliste$SIPRI[93]<- 'Jordan'
laenderliste$SIPRI[94]<- 'Katanga'
laenderliste$SIPRI[95]<- 'Kazakhstan'
laenderliste$SIPRI[96]<- 'Kenya'
laenderliste$SIPRI[97]<- 'Kiribati'
laenderliste$SIPRI[98]<- 'North Korea (DPRK)'
laenderliste$SIPRI[99]<- 'South Korea (ROK)'
laenderliste$SIPRI[100]<- 'Kosovo'
laenderliste$SIPRI[101]<- 'Kuwait'
laenderliste$SIPRI[102]<- 'Kyrgyzstan'
laenderliste$SIPRI[103]<- 'Laos'
laenderliste$SIPRI[104]<- 'Latvia'
laenderliste$SIPRI[105]<- 'Lebanon'
laenderliste$SIPRI[106]<- 'Lesotho'
laenderliste$SIPRI[107]<- 'Liberia'
laenderliste$SIPRI[108]<- 'Libya'
laenderliste$SIPRI[109]<- 'Liechtenstein'
laenderliste$SIPRI[110]<- 'Lithuania'
laenderliste$SIPRI[111]<- 'Luxembourg'
laenderliste$SIPRI[112]<- 'Macedonia (FYROM)'
laenderliste$SIPRI[113]<- 'Madagascar'
laenderliste$SIPRI[114]<- 'Malawi'
laenderliste$SIPRI[115]<- 'Malaysia'
laenderliste$SIPRI[116]<- 'Maldives'
laenderliste$SIPRI[117]<- 'Mali'
laenderliste$SIPRI[118]<- 'Malta'
laenderliste$SIPRI[119]<- 'Marshall Islands'
laenderliste$SIPRI[120]<- 'Mauritania'
laenderliste$SIPRI[121]<- 'Mauritius'
laenderliste$SIPRI[122]<- 'Mexico'
laenderliste$SIPRI[123]<- 'Micronesia'
laenderliste$SIPRI[124]<- 'Moldova'
laenderliste$SIPRI[125]<- 'Monaco'
laenderliste$SIPRI[126]<- 'Mongolia'
laenderliste$SIPRI[127]<- 'Montenegro'
laenderliste$SIPRI[128]<- 'Morocco'
laenderliste$SIPRI[129]<- 'Mozambique'
laenderliste$SIPRI[130]<- 'Myanmar'
laenderliste$SIPRI[131]<- 'Namibia'
laenderliste$SIPRI[132]<- 'Nauru'
laenderliste$SIPRI[133]<- 'Nepal'
laenderliste$SIPRI[134]<- 'Netherlands'
laenderliste$SIPRI[135]<- 'New Zealand'
laenderliste$SIPRI[136]<- 'Nicaragua'
laenderliste$SIPRI[137]<- 'Niger'
laenderliste$SIPRI[138]<- 'Nigeria'
laenderliste$SIPRI[139]<- 'Niue'
laenderliste$SIPRI[140]<- 'Norway'
laenderliste$SIPRI[141]<- 'Oman'
laenderliste$SIPRI[142]<- 'Pakistan'
laenderliste$SIPRI[143]<- 'Palau'
laenderliste$SIPRI[144]<- 'Palestine'
laenderliste$SIPRI[145]<- 'Panama'
laenderliste$SIPRI[146]<- 'Papua New Guinea'
laenderliste$SIPRI[147]<- 'Paraguay'
laenderliste$SIPRI[148]<- 'Peru'
laenderliste$SIPRI[149]<- 'Philippines'
laenderliste$SIPRI[150]<- 'Poland'
laenderliste$SIPRI[151]<- 'Portugal'
laenderliste$SIPRI[152]<- 'Qatar'
laenderliste$SIPRI[153]<- 'Romania'
laenderliste$SIPRI[154]<- 'Russia'
laenderliste$SIPRI[155]<- 'Rwanda'
laenderliste$SIPRI[156]<- 'Saint Kitts and Nevis'
laenderliste$SIPRI[157]<- 'Saint Lucia'
laenderliste$SIPRI[158]<- 'Saint Vincent'
laenderliste$SIPRI[159]<- 'Samoa'
laenderliste$SIPRI[160]<- 'San Marino'
laenderliste$SIPRI[161]<- 'Sao Tome and Principe'
laenderliste$SIPRI[162]<- 'Saudi Arabia'
laenderliste$SIPRI[163]<- 'Senegal'
laenderliste$SIPRI[164]<- 'Serbia'
laenderliste$SIPRI[165]<- 'Seychelles'
laenderliste$SIPRI[166]<- 'Sierra Leone'
laenderliste$SIPRI[167]<- 'Singapore'
laenderliste$SIPRI[168]<- 'Slovakia'
laenderliste$SIPRI[169]<- 'Slovenia'
laenderliste$SIPRI[170]<- 'Solomon Islands'
laenderliste$SIPRI[171]<- 'Somalia'
laenderliste$SIPRI[172]<- 'Somaliland'
laenderliste$SIPRI[173]<- 'South Africa'
laenderliste$SIPRI[174]<- 'South Ossetia'
laenderliste$SIPRI[175]<- 'South Sudan'
laenderliste$SIPRI[176]<- 'Soviet Union'
laenderliste$SIPRI[177]<- 'Spain'
laenderliste$SIPRI[178]<- 'Sri Lanka'
laenderliste$SIPRI[179]<- 'Sudan'
laenderliste$SIPRI[180]<- 'Suriname'
laenderliste$SIPRI[181]<- 'Swaziland'
laenderliste$SIPRI[182]<- 'Sweden'
laenderliste$SIPRI[183]<- 'Switzerland'
laenderliste$SIPRI[184]<- 'Syria'
laenderliste$SIPRI[185]<- 'Taiwan'
laenderliste$SIPRI[186]<- 'Tajikistan'
laenderliste$SIPRI[187]<- 'Tanzania'
laenderliste$SIPRI[188]<- 'Thailand'
laenderliste$SIPRI[189]<- 'Timor-Leste'
laenderliste$SIPRI[190]<- 'Togo'
laenderliste$SIPRI[191]<- 'Tonga'
laenderliste$SIPRI[192]<- 'Trans-Dniester'
laenderliste$SIPRI[193]<- 'Trinidad and Tobago'
laenderliste$SIPRI[194]<- 'Tunisia'
laenderliste$SIPRI[195]<- 'Turkey'
laenderliste$SIPRI[196]<- 'Turkmenistan'
laenderliste$SIPRI[197]<- 'Tuvalu'
laenderliste$SIPRI[198]<- 'Uganda'
laenderliste$SIPRI[199]<- 'Ukraine'
laenderliste$SIPRI[200]<- 'UAE'
laenderliste$SIPRI[201]<- 'United Kingdom'
laenderliste$SIPRI[202]<- 'United States'
laenderliste$SIPRI[203]<- ''
laenderliste$SIPRI[204]<- ''
laenderliste$SIPRI[205]<- ''
laenderliste$SIPRI[206]<- ''
laenderliste$SIPRI[207]<- ''
laenderliste$SIPRI[208]<- ''
laenderliste$SIPRI[209]<- 'Uruguay'
laenderliste$SIPRI[210]<- 'Uzbekistan'
laenderliste$SIPRI[211]<- 'Vanuatu'
laenderliste$SIPRI[212]<- 'Vatican (Holy See)'
laenderliste$SIPRI[213]<- 'Venezuela'
laenderliste$SIPRI[214]<- 'Viet Nam'
laenderliste$SIPRI[215]<- 'North Vietnam'
laenderliste$SIPRI[216]<- 'South Vietnam'
laenderliste$SIPRI[217]<- 'Western Sahara'
laenderliste$SIPRI[218]<- 'Yemen'
laenderliste$SIPRI[219]<- 'North Yemen'
laenderliste$SIPRI[220]<- 'South Yemen'
laenderliste$SIPRI[221]<- 'Yugoslavia'
laenderliste$SIPRI[222]<- 'Zambia'
laenderliste$SIPRI[223]<- 'Zanzibar'
laenderliste$SIPRI[224]<- 'Zimbabwe'
laenderliste$SIPRI[225]<-'African Union**'
laenderliste$SIPRI[226]<-  'Amal (Lebanon)*'
laenderliste$SIPRI[227]<-  'Armas (Guatemala)*'
laenderliste$SIPRI[228]<-  'Contras (Nicaragua)*'
laenderliste$SIPRI[229]<- 'ENLF (Ethiopia)*'
laenderliste$SIPRI[230]<- 'FMLN (El Salvador)*'
laenderliste$SIPRI[231]<-  'GUNT (Chad)*'
laenderliste$SIPRI[232]<- 'Hamas (Palestine)*'
laenderliste$SIPRI[233]<- 'Hezbollah (Lebanon)*'
laenderliste$SIPRI[234]<- 'Khmer Rouge (Cambodia)*'
laenderliste$SIPRI[235]<- 'Lebanon Palestinian rebels*'
laenderliste$SIPRI[236]<- 'LF (Lebanon)*'
laenderliste$SIPRI[237]<- 'LTTE (Sri Lanka)*'
laenderliste$SIPRI[238]<- 'MPLA (Portugal)*'
laenderliste$SIPRI[239]<- 'MTA (Myanmar)*'
laenderliste$SIPRI[240]<- 'Mujahedin (Afghanistan)*'
laenderliste$SIPRI[241]<- 'NATO**'
laenderliste$SIPRI[242]<- 'Northern Alliance (Afghanistan)*'
laenderliste$SIPRI[243]<- 'PAIGC (Portugal)*'
laenderliste$SIPRI[244]<- 'Pathet Lao (Laos)*'
laenderliste$SIPRI[245]<- 'PKK (Turkey)*'
laenderliste$SIPRI[246]<- 'PLO (Israel)*'
laenderliste$SIPRI[247]<- 'Provisional IRA (UK)*'
laenderliste$SIPRI[248]<- 'RUI (Sierra Leone)*'
laenderliste$SIPRI[249]<- 'SLA (Lebanon)*'
laenderliste$SIPRI[250]<- 'Southern rebels (Yemen)*'
laenderliste$SIPRI[251]<- 'SPLA (Sudan)*'
laenderliste$SIPRI[252]<- 'Syria rebels*'
laenderliste$SIPRI[253]<- 'UNITA (Angola)*'
laenderliste$SIPRI[254]<- 'United Nations**'
laenderliste$SIPRI[255]<- 'Viet Cong (South Vietnam)*'
laenderliste$SIPRI[256]<- 'ZAPU (Zimbabwe)*'
laenderliste$SIPRI[257]<- 'Unknown country'


# country abbreviations in COW Data

laenderliste$COW2<-laenderliste$COW
laenderliste[72,4]<-260

laenderliste$cepii<-0
laenderliste$cepii[2]<-'AFG'
laenderliste$cepii[3]<-'ALB'
laenderliste$cepii[4]<-'DZA'
laenderliste$cepii[5]<-'AND'
laenderliste$cepii[6]<-'AGO'
laenderliste$cepii[7]<-'ATG'
laenderliste$cepii[8]<-'ARG'
laenderliste$cepii[9]<-'ARM'
laenderliste$cepii[11]<-'AUS'
laenderliste$cepii[12]<-'AUT'
laenderliste$cepii[13]<-'AZE'
laenderliste$cepii[14]<-'BHS'
laenderliste$cepii[15]<-'BHR'
laenderliste$cepii[16]<-'BGD'
laenderliste$cepii[17]<-'BRB'
laenderliste$cepii[18]<-'BLR'
laenderliste$cepii[19]<-'BEL'
laenderliste$cepii[20]<-'BLZ'
laenderliste$cepii[21]<-'BEN'
laenderliste$cepii[22]<-'BTN'
laenderliste$cepii[24]<-  'BOL'
laenderliste$cepii[25]<- 'BIH'
laenderliste$cepii[26]<-'BWA'
laenderliste$cepii[27]<-'BRA'
laenderliste$cepii[28]<-'BRN'
laenderliste$cepii[29]<-'BGR'
laenderliste$cepii[30]<-'BFA'
laenderliste$cepii[31]<-'BDI'
laenderliste$cepii[32]<-'KHM'
laenderliste$cepii[33]<-'CMR'
laenderliste$cepii[34]<-'CAN'
laenderliste$cepii[35]<-'CPV'
laenderliste$cepii[36]<-'CAF'
laenderliste$cepii[37]<-'TCD'
laenderliste$cepii[38]<-'CHL'
laenderliste$cepii[39]<-'CHN'
laenderliste$cepii[40]<-'COL'
laenderliste$cepii[41]<-'COM'
laenderliste$cepii[42]<-'ZAR'
laenderliste$cepii[43]<-'COG'
laenderliste$cepii[44]<-'COK'
laenderliste$cepii[45]<-'CRI'
laenderliste$cepii[46]<-'CIV'
laenderliste$cepii[47]<-'HRV'
laenderliste$cepii[48]<-'CUB'
laenderliste$cepii[49]<-'CYP'
laenderliste$cepii[50]<-'CYP'
laenderliste$cepii[51]<-'CZE'
laenderliste$cepii[52]<-'CZE'
laenderliste$cepii[54]<-'DNK'
laenderliste$cepii[55]<-'DJI'
laenderliste$cepii[56]<-'DMA'
laenderliste$cepii[57]<-'DOM'
laenderliste$cepii[58]<-'ECU'
laenderliste$cepii[59]<-'EGY'
laenderliste$cepii[60]<-'SLV'
laenderliste$cepii[61]<-'GNQ'
laenderliste$cepii[62]<-'ERI'
laenderliste$cepii[63]<-'EST'
laenderliste$cepii[64]<-'ETH'
laenderliste$cepii[65]<-'FJI'
laenderliste$cepii[66]<-'FIN'
laenderliste$cepii[67]<-'FRA'
laenderliste$cepii[68]<-'GAB'
laenderliste$cepii[69]<-'GMB'
laenderliste$cepii[70]<-'GEO'
laenderliste$cepii[71]<-'DEU'
laenderliste$cepii[72]<-'DEU'
laenderliste$cepii[73]<-'GHA'
laenderliste$cepii[74]<-'GRC'
laenderliste$cepii[75]<-'GRD'
laenderliste$cepii[76]<-'GTM'
laenderliste$cepii[77]<-'GIN'
laenderliste$cepii[78]<-'GNB'
laenderliste$cepii[79]<-'GUY'
laenderliste$cepii[80]<-'HTI'
laenderliste$cepii[81]<-'HND'
laenderliste$cepii[82]<-'HUN'
laenderliste$cepii[83]<-'ISL'
laenderliste$cepii[84]<-'IND'
laenderliste$cepii[85]<-'IDN'
laenderliste$cepii[86]<-'IRN'
laenderliste$cepii[87]<-'IRQ'
laenderliste$cepii[88]<-'IRL'
laenderliste$cepii[89]<-'ISR'
laenderliste$cepii[90]<-'ITA'
laenderliste$cepii[91]<-'JAM'
laenderliste$cepii[92]<-'JPN'
laenderliste$cepii[93]<-'JOR'
laenderliste$cepii[95]<-'KAZ'
laenderliste$cepii[96]<-'KEN'
laenderliste$cepii[97]<-'KIR'
laenderliste$cepii[98]<-'PRK'
laenderliste$cepii[99]<-'KOR'
laenderliste$cepii[101]<-'KWT'
laenderliste$cepii[102]<-'KGZ'
laenderliste$cepii[103]<-'LAO'
laenderliste$cepii[104]<-'LVA'
laenderliste$cepii[105]<-'LBN'
laenderliste$cepii[106]<-'LSO'
laenderliste$cepii[107]<-'LBR'
laenderliste$cepii[108]<-'LBY'
laenderliste$cepii[110]<-'LTU'
laenderliste$cepii[111]<-'LUX'
laenderliste$cepii[112]<-'MKD'
laenderliste$cepii[113]<-'MDG'
laenderliste$cepii[114]<-'MWI'
laenderliste$cepii[115]<-'MYS'
laenderliste$cepii[116]<-'MDV'
laenderliste$cepii[117]<-'MLI'
laenderliste$cepii[118]<-'MLT'
laenderliste$cepii[119]<-'MHL'
laenderliste$cepii[120]<-'MRT'
laenderliste$cepii[121]<-'MUS'
laenderliste$cepii[122]<-'MEX'
laenderliste$cepii[123]<-'FSM'
laenderliste$cepii[124]<-'MDA'
laenderliste$cepii[126]<-'MNG'
laenderliste$cepii[127]<-'YUG'
laenderliste$cepii[128]<-'MAR'
laenderliste$cepii[129]<-'MOZ'
laenderliste$cepii[131]<-'NAM'
laenderliste$cepii[132]<-'NRU'
laenderliste$cepii[133]<-'NPL'
laenderliste$cepii[134]<-'NLD'
laenderliste$cepii[135]<-'NZL'
laenderliste$cepii[136]<-'NIC'
laenderliste$cepii[137]<-'NER'
laenderliste$cepii[138]<-'NGA'
laenderliste$cepii[139]<-'NIU'
laenderliste$cepii[140]<-'NOR'
laenderliste$cepii[141]<-'OMN'
laenderliste$cepii[142]<-'PAK'
laenderliste$cepii[143]<-'PLW'
laenderliste$cepii[144]<-'PAL'
laenderliste$cepii[145]<-'PAN'
laenderliste$cepii[146]<-'PNG'
laenderliste$cepii[147]<-'PRY'
laenderliste$cepii[148]<-'PER'
laenderliste$cepii[149]<-'PHL'
laenderliste$cepii[150]<-'POL'
laenderliste$cepii[151]<-'PRT'
laenderliste$cepii[152]<-'QAT'
laenderliste$cepii[153]<-'ROM'
laenderliste$cepii[154]<-'RUS'
laenderliste$cepii[155]<-'RWA'
laenderliste$cepii[156]<-'KNA'
laenderliste$cepii[157]<-'LCA'
laenderliste$cepii[158]<-'VCT'
laenderliste$cepii[159]<-'WSM'
laenderliste$cepii[160]<-'SMR'
laenderliste$cepii[161]<-'STP'
laenderliste$cepii[162]<-'SAU'
laenderliste$cepii[163]<-'SEN'
laenderliste$cepii[164]<-'YUG'
laenderliste$cepii[165]<-'SYC'
laenderliste$cepii[166]<-'SLE'
laenderliste$cepii[167]<-'SGP'
laenderliste$cepii[168]<-'SVK'
laenderliste$cepii[169]<-'SVN'
laenderliste$cepii[170]<-'SLB'
laenderliste$cepii[171]<-'SOM'
laenderliste$cepii[173]<-'ZAF'
laenderliste$cepii[176]<-'RUS'
laenderliste$cepii[177]<-'ESP'
laenderliste$cepii[178]<-'LKA'
laenderliste$cepii[179]<-'SDN'
laenderliste$cepii[180]<-'SUR'
laenderliste$cepii[181]<-'SWZ'
laenderliste$cepii[182]<-'SWE'
laenderliste$cepii[183]<-'CHE'
laenderliste$cepii[184]<-'SYR'
laenderliste$cepii[185]<-'TWN'
laenderliste$cepii[186]<-'TJK'
laenderliste$cepii[187]<-'TZA'
laenderliste$cepii[188]<-'THA'
laenderliste$cepii[189]<-'TMP'
laenderliste$cepii[190]<-'TGO'
laenderliste$cepii[191]<-'TON'
laenderliste$cepii[193]<-'TTO'
laenderliste$cepii[194]<-'TUN'
laenderliste$cepii[195]<-'TUR'
laenderliste$cepii[196]<-'TKM'
laenderliste$cepii[197]<-'TUV'
laenderliste$cepii[198]<-'UGA'
laenderliste$cepii[199]<-'UKR'
laenderliste$cepii[200]<-'ARE'
laenderliste$cepii[201]<-'GBR'
laenderliste$cepii[202]<-'USA'
laenderliste$cepii[209]<-'URY'
laenderliste$cepii[210]<-'UZB'
laenderliste$cepii[211]<-'VUT'
laenderliste$cepii[213]<-'VEN'
laenderliste$cepii[214]<-'VNM'
laenderliste$cepii[215]<-'VNM'
laenderliste$cepii[216]<-'VNM'
laenderliste$cepii[217]<-'ESH'
laenderliste$cepii[218]<-'YEM'
laenderliste$cepii[219]<-'YEM'
laenderliste$cepii[220]<-'YEM'
laenderliste$cepii[221]<-'YUG'
laenderliste$cepii[222]<-'ZMB'
laenderliste$cepii[224]<-'ZWE'


laenderliste$ID<-1:257



########################################################
##
## create a matrix EX where columns represent years from 1950-2013 and rows the actors in network
## EX[i,j]=1 means that country i did exist in year j,
## EX[i,j]=0 means that country i did not exist in year j
## smallest countries that were not considered in analysis are muted out
##
########################################################


# create existence matrix

EX<- matrix(0,257,64)
rownames(EX)<-laenderliste$V1
colnames(EX)<-1950:2013

EX[2,]<-1
EX[3,]<-1
EX[4,13:64]<-1
EX[6,26:64]<-1
EX[8,]<-1
EX[9,42:64]<-1
EX[11,]<-1
EX[12,]<-1
EX[13,42:64]<-1
EX[15,22:64]<-1
EX[16,22:64]<-1
EX[18,42:64]<-1
EX[19,]<-1
#EX[20,32:64]<-1
EX[21,12:64]<-1
EX[24,]<-1
EX[25,43:64]<-1
EX[26,17:64]<-1
EX[27,]<-1
#EX[28,]<-1
EX[29,]<-1
EX[30,11:64]<-1
EX[31,13:64]<-1
EX[32,4:64]<-1
EX[33,11:64]<-1
EX[34,]<-1
EX[35,26:64]<-1
EX[36,11:64]<-1
EX[37,11:64]<-1
EX[38,]<-1
EX[39,]<-1
EX[40,]<-1
EX[42,11:64]<-1
EX[43,11:64]<-1
EX[45,]<-1
EX[46,11:64]<-1
EX[47,42:64]<-1
EX[48,]<-1
EX[49,11:64]<-1
EX[51,44:64]<-1
EX[52,1:42]<-1
EX[54,]<-1
EX[55,28:64]<-1
EX[57,]<-1
EX[58,]<-1
EX[59,]<-1
EX[60,]<-1
EX[61,19:64]<-1
EX[62,44:64]<-1
EX[63,42:64]<-1
EX[64,]<-1
EX[65,21:64]<-1
EX[66,]<-1
EX[67,]<-1
EX[68,11:64]<-1
EX[69,16:64]<-1
EX[70,42:64]<-1
EX[71,1:42]<-1
EX[72,]<-1
EX[73,8:64]<-1
EX[74,]<-1
#EX[75,25:64]<-1
EX[76,]<-1
EX[77,9:64]<-1
EX[78,24:64]<-1
EX[79,17:64]<-1
EX[80,]<-1
EX[81,]<-1
EX[82,]<-1
#EX[83,]<-1
EX[84,]<-1
EX[85,]<-1
EX[86,]<-1
EX[87,]<-1
EX[88,]<-1
EX[89,]<-1
EX[90,]<-1
EX[91,13:64]<-1
EX[92,]<-1
EX[93,]<-1
EX[95,42:64]<-1
EX[96,14:64]<-1
#EX[97,30:64]<-1
EX[98,]<-1
EX[99,]<-1
EX[101,12:64]<-1
EX[102,42:64]<-1
EX[103,]<-1
EX[104,42:64]<-1
EX[105,]<-1
EX[106,17:64]<-1
EX[107,]<-1
EX[108,2:64]<-1
EX[110,41:64]<-1
EX[111,]<-1
EX[112,42:64]<-1
EX[113,11:64]<-1
EX[114,15:64]<-1
EX[115,8:64]<-1
EX[117,11:64]<-1
#EX[118,15:64]<-1
EX[120,11:64]<-1
EX[121,19:64]<-1
EX[122,]<-1
EX[124,42:64]<-1
EX[126,]<-1
EX[127,57:64]<-1
EX[128,7:64]<-1
EX[129,26:64]<-1
EX[130,]<-1
EX[131,]<-1
EX[133,]<-1
EX[134,]<-1
EX[135,]<-1
EX[136,]<-1
EX[137,11:64]<-1
EX[138,11:64]<-1
EX[140,]<-1
EX[141,]<-1
EX[142,]<-1
EX[145,]<-1
EX[146,26:64]<-1
EX[147,]<-1
EX[148,]<-1
EX[149,]<-1
EX[150,]<-1
EX[151,]<-1
EX[152,]<-1
EX[153,]<-1
EX[154,43:64]<-1
EX[155,13:64]<-1
EX[162,]<-1
EX[163,11:64]<-1
EX[164,43:64]<-1
#EX[165,27:64]<-1
EX[166,12:64]<-1
EX[167,16:64]<-1
EX[168,44:64]<-1
EX[169,42:64]<-1
EX[171,11:64]<-1
EX[173,]<-1
EX[175,56:64]<-1
EX[176,1:42]<-1
EX[177,]<-1
EX[178,]<-1
EX[179,7:64]<-1
EX[181,19:64]<-1
EX[182,]<-1
EX[183,]<-1
EX[184,]<-1
EX[185,]<-1
EX[186,42:64]<-1
EX[187,12:64]<-1
EX[188,]<-1
EX[189,53:64]<-1
EX[190,11:64]<-1
EX[193,13:64]<-1
EX[194,7:64]<-1
EX[195,]<-1
EX[196,42:64]<-1
EX[198,13:64]<-1
EX[199,42:64]<-1
EX[200,22:64]<-1
EX[201,]<-1
EX[202,]<-1
EX[209,]<-1
EX[210,42:64]<-1
EX[213,]<-1
EX[214,27:64]<-1
EX[216,1:26]<-1
EX[218,42:64]<-1
EX[219,1:42]<-1
EX[220,1:42]<-1
EX[221,1:43]<-1
EX[222,15:64]<-1
EX[224,]<-1
#EX[5,]<-1
#EX[7,32:64]<-1
#EX[14,24:64]<-1
#EX[17,17:64]<-1
EX[22,]<-1
EX[23,18:20]<-1
EX[41,26:64]<-1
#EX[44,16:64]<-1
EX[56,29:64]<-1
EX[100,59:64]<-1
#EX[109,]<-1
#EX[116,16:64]<-1
#EX[119,37:64]<-1
EX[123,37:64]<-1
EX[125,]<-1
#EX[132,19:64]<-1
#EX[143,45:64]<-1
#EX[156,34:64]<-1
#EX[157,30:64]<-1
#EX[158,30:64]<-1
#EX[159,13:64]<-1
#EX[160,]<-1
#EX[161,26:64]<-1
EX[170,29:64]<-1
EX[180,26:64]<-1
EX[191,21:64]<-1
#EX[197,29:64]<-1
#EX[211,31:64]<-1
#EX[212,]<-1
EX[215,1:27]<-1
EX[217,27:64]<-1



######################################################################################################################
##
## read in SIPRI data, we create a list where each entry in the list represents the import data of a certain country
##
######################################################################################################################


dfl<-list()
dfl[[1]]<- read.csv("Data/SIPRI/Albania.csv", sep=";")
dfl[[2]]<- read.csv("Data/SIPRI/Algeria.csv", sep=";")
dfl[[3]]<- read.csv("Data/SIPRI/Angola.csv", sep=";")
dfl[[4]]<- read.csv("Data/SIPRI/Argentina.csv", sep=";")
dfl[[5]]<- read.csv("Data/SIPRI/Australia.csv", sep=";")
dfl[[6]]<- read.csv("Data/SIPRI/Austria.csv", sep=";")
dfl[[7]]<- read.csv("Data/SIPRI/Belarus.csv", sep=";")
dfl[[8]]<- read.csv("Data/SIPRI/Belgium.csv", sep=";")
dfl[[9]]<- read.csv("Data/SIPRI/Bosnia and Herzegovina.csv", sep=";")
dfl[[10]]<- read.csv("Data/SIPRI/Brazil.csv", sep=";")
dfl[[11]]<- read.csv("Data/SIPRI/Bulgaria.csv", sep=";")
dfl[[12]]<- read.csv("Data/SIPRI/Cambodia.csv", sep=";")
dfl[[13]]<- read.csv("Data/SIPRI/Canada.csv", sep=";")
dfl[[14]]<- read.csv("Data/SIPRI/Chad.csv", sep=";")
dfl[[15]]<- read.csv("Data/SIPRI/Chile.csv", sep=";")
dfl[[16]]<- read.csv("Data/SIPRI/China.csv", sep=";")
dfl[[17]]<- read.csv("Data/SIPRI/Cuba.csv", sep=";")
dfl[[18]]<- read.csv("Data/SIPRI/Czech Republic.csv", sep=";")
dfl[[19]]<- read.csv("Data/SIPRI/Czechoslovakia.csv", sep=";")
dfl[[20]]<- read.csv("Data/SIPRI/Denmark.csv", sep=";")
dfl[[21]]<- read.csv("Data/SIPRI/Egypt.csv", sep=";")
dfl[[22]]<- read.csv("Data/SIPRI/Eritrea.csv", sep=";")
dfl[[23]]<- read.csv("Data/SIPRI/Ethiopia.csv", sep=";")
dfl[[24]]<- read.csv("Data/SIPRI/Finland.csv", sep=";")
dfl[[25]]<- read.csv("Data/SIPRI/France.csv", sep=";")
dfl[[26]]<- read.csv("Data/SIPRI/Georgia.csv", sep=";")
dfl[[27]]<- read.csv("Data/SIPRI/German Democratic Republic.csv", sep=";")
dfl[[28]]<- read.csv("Data/SIPRI/Germany.csv", sep=";")
dfl[[29]]<- read.csv("Data/SIPRI/Ghana.csv", sep=";")
dfl[[30]]<- read.csv("Data/SIPRI/Greece.csv", sep=";")
dfl[[31]]<- read.csv("Data/SIPRI/Hungary.csv", sep=";")
dfl[[32]]<- read.csv("Data/SIPRI/Iceland.csv", sep=";")
dfl[[33]]<- read.csv("Data/SIPRI/India.csv", sep=";")
dfl[[34]]<- read.csv("Data/SIPRI/Indonesia.csv", sep=";")
dfl[[35]]<- read.csv("Data/SIPRI/Iran.csv", sep=";")
dfl[[36]]<- read.csv("Data/SIPRI/Iraq.csv", sep=";")
dfl[[37]]<- read.csv("Data/SIPRI/Ireland.csv", sep=";")
dfl[[38]]<- read.csv("Data/SIPRI/Israel.csv", sep=";")
dfl[[39]]<- read.csv("Data/SIPRI/Italy.csv", sep=";")
dfl[[40]]<- read.csv("Data/SIPRI/Japan.csv", sep=";")
dfl[[41]]<- read.csv("Data/SIPRI/Jordan.csv", sep=";")
dfl[[42]]<- read.csv("Data/SIPRI/Kazakhstan.csv", sep=";")
dfl[[43]]<- read.csv("Data/SIPRI/Kenya.csv", sep=";")
dfl[[44]]<- read.csv("Data/SIPRI/Kuwait.csv", sep=";")
dfl[[45]]<- read.csv("Data/SIPRI/Kyrgyzstan.csv", sep=";")
dfl[[46]]<- read.csv("Data/SIPRI/Lebanon.csv", sep=";")
dfl[[47]]<- read.csv("Data/SIPRI/Libya.csv", sep=";")
dfl[[48]]<- read.csv("Data/SIPRI/Malaysia.csv", sep=";")
dfl[[49]]<- read.csv("Data/SIPRI/Moldova.csv", sep=";")
dfl[[50]]<- read.csv("Data/SIPRI/Montenegro.csv", sep=";")
dfl[[51]]<- read.csv("Data/SIPRI/Morocco.csv", sep=";")
dfl[[52]]<- read.csv("Data/SIPRI/Netherlands.csv", sep=";")
dfl[[53]]<- read.csv("Data/SIPRI/New Zealand.csv", sep=";")
dfl[[54]]<- read.csv("Data/SIPRI/Nicaragua.csv", sep=";")
dfl[[55]]<- read.csv("Data/SIPRI/Nigeria.csv", sep=";")
dfl[[56]]<- read.csv("Data/SIPRI/North Korea.csv", sep=";")
dfl[[57]]<- read.csv("Data/SIPRI/Norway.csv", sep=";")
dfl[[58]]<- read.csv("Data/SIPRI/Oman.csv", sep=";")
dfl[[59]]<- read.csv("Data/SIPRI/Pakistan.csv", sep=";")
dfl[[60]]<- read.csv("Data/SIPRI/Peru.csv", sep=";")
dfl[[61]]<- read.csv("Data/SIPRI/Philippines.csv", sep=";")
dfl[[62]]<- read.csv("Data/SIPRI/Poland.csv", sep=";")
dfl[[63]]<- read.csv("Data/SIPRI/Qatar.csv", sep=";")
dfl[[64]]<- read.csv("Data/SIPRI/Romania.csv", sep=";")
dfl[[65]]<- read.csv("Data/SIPRI/Russia.csv", sep=";")
dfl[[66]]<- read.csv("Data/SIPRI/Saudi Arabia.csv", sep=";")
dfl[[67]]<- read.csv("Data/SIPRI/Serbia.csv", sep=";")
dfl[[68]]<- read.csv("Data/SIPRI/Singapore.csv", sep=";")
dfl[[69]]<- read.csv("Data/SIPRI/Slovakia.csv", sep=";")
dfl[[70]]<- read.csv("Data/SIPRI/South Africa.csv", sep=";")
dfl[[71]]<- read.csv("Data/SIPRI/South Korea.csv", sep=";")
dfl[[72]]<- read.csv("Data/SIPRI/South Yemen.csv", sep=";")
dfl[[73]]<- read.csv("Data/SIPRI/Soviet Union1.csv", sep=";")
dfl[[74]]<- read.csv("Data/SIPRI/Soviet Union2.csv", sep=";")
dfl[[75]]<- read.csv("Data/SIPRI/Spain.csv", sep=";")
dfl[[76]]<- read.csv("Data/SIPRI/Sudan.csv", sep=";")
dfl[[77]]<- read.csv("Data/SIPRI/Sweden.csv", sep=";")
dfl[[78]]<- read.csv("Data/SIPRI/Switzerland.csv", sep=";")
dfl[[79]]<- read.csv("Data/SIPRI/Syria.csv", sep=";")
dfl[[80]]<- read.csv("Data/SIPRI/Taiwan.csv", sep=";")
dfl[[81]]<- read.csv("Data/SIPRI/Thailand.csv", sep=";")
dfl[[82]]<- read.csv("Data/SIPRI/Turkey.csv", sep=";")
dfl[[83]]<- read.csv("Data/SIPRI/Ukraine.csv", sep=";")
dfl[[84]]<- read.csv("Data/SIPRI/United Arab Emirates.csv", sep=";")
dfl[[85]]<- read.csv("Data/SIPRI/United Kingdom.csv", sep=";")
dfl[[86]]<- read.csv("Data/SIPRI/United States1.csv", sep=";")
dfl[[87]]<- read.csv("Data/SIPRI/United States2.csv", sep=";")
dfl[[88]]<- read.csv("Data/SIPRI/United States3.csv", sep=";")
dfl[[89]]<- read.csv("Data/SIPRI/Uruguay.csv", sep=";")
dfl[[90]]<- read.csv("Data/SIPRI/Uzbekistan.csv", sep=";")
dfl[[91]]<- read.csv("Data/SIPRI/Venezuela.csv", sep=";")
dfl[[92]]<- read.csv("Data/SIPRI/Viet Nam.csv", sep=";")
dfl[[93]]<- read.csv("Data/SIPRI/Yugoslavia.csv", sep=";")
dfl[[94]]<- read.csv("Data/SIPRI/Zimbabwe.csv", sep=";")
dfl[[95]]<- read.csv("Data/SIPRI/Unknown country.csv", sep=";")




############################################################################################
##
## read in the trade flow from country i to j in year x into the adjacency matrix of year x
##
############################################################################################



amk<- list()
# create a list of 64 adjacency matrices, one for each year from 1950:2013. amk[[1]] = 1950,...m amk[[64]]=2013 
for (i in 1:64){
  amk[[i]]<- matrix(0,257,257)
  colnames(amk[[i]])<-laenderliste$V1
  rownames(amk[[i]])<-laenderliste$V1
}

# take each data set in dfl, identify seller, buyer, year and amount and save amount in the right entry of
# the right adjacency matrix
for (j in 1: 95){
  l<-dim(dfl[[j]])[1]
  s<- which((laenderliste$SIPRI)==dfl[[j]][1,2])
  
  for (i in 1:l){
    v<- dfl[[j]][i,16] #value
    t<- dfl[[j]][i,11] #delivery year
    r<- which((laenderliste$SIPRI)==dfl[[j]][i,3])         
    a<-amk[[t-1949]][s,r]
    amk[[t-1949]][s,r]<- v+a
    
  }
}



########################################################################
########################################################################
##
## read in additional data (covariates)
##
########################################################################
########################################################################

#################################
# Alliance
#################################

alliance <- read.csv("Data/alliance_v4.1_by_dyad_yearly.csv")

# getting rid of unnecessary columns
alliance<-alliance[,-19]
alliance<-alliance[,-(15:17)]
alliance<-alliance[,-(6:13)]
alliance<-alliance[,-1]

d<-dim(alliance)[1]

# getting rid of data prior 1950

for(i in d:1){
  if(alliance[i,6]<1950){
    alliance<-alliance[-i,]
  }
}

# create empty matrices to store data
d<-dim(alliance)[1]
daml2<-list()
for(i in 1:64){
  daml2[[i]]<-matrix(0,224,224)
  rownames(daml2[[i]])<-laenderliste$V1[1:224]
  colnames(daml2[[i]])<-laenderliste$V1[1:224]
}

# read in data into the right entry of the right matrix
for (i in 1:d){
  
  if(alliance[i,5]==1){
    r<-which(alliance[i,1]==laenderliste$COW)
    t<-which(alliance[i,3]==laenderliste$COW)
    daml2[[alliance[i,6]-1949]][r,t]<-1
    daml2[[alliance[i,6]-1949]][t,r]<-1
  }
}

# some countries, especialy Germany, have two different COW IDs
for (i in 1:d){
  if(alliance[i,5]==1){
    r<-which(alliance[i,1]==laenderliste$COW2)
    t<-which(alliance[i,3]==laenderliste$COW2)
    daml2[[alliance[i,6]-1949]][r,t]<-1
    daml2[[alliance[i,6]-1949]][t,r]<-1
  }
}

# we don't have data for 2013. We assume the same alliances as 2012
daml2[[64]]<-daml2[[63]]
daml<-daml2
rm(daml2, alliance, d, i, r, t)

##############################
# Distance between Capitals
##############################

# read in data

capdist <- read.csv("Data/capdist.csv")

# create empty matrix
cdist<- matrix(0,224,224)
colnames(cdist)<-laenderliste$V1[1:224]
rownames(cdist)<-laenderliste$V1[1:224]

# enter data in matrix
for(i in 1:nrow(capdist)){
  a<- which(capdist[i,1]==laenderliste$COW2)
  b<- which(capdist[i,3]==laenderliste$COW2)
  cdist[a,b]<-capdist[i,5]
}

# divide by 1000 and round
cdist<-cdist/1000
cdist<-round(cdist)


# no data for Kosovo and Montenegro -> take distances for Macedonia
cdist[100,]<- cdist[112,]
cdist[127,]<- cdist[112,]
# no data for South Sudan -> take distances for Uganda
cdist[175,]<- cdist[198,]

rm(a,b,capdist)


###################################
## Cinc
###################################

# military capability

NMC_v4_0 <- read.csv("Data/NMC_v4_0.csv")

MC<- NMC_v4_0

# getting rid of unnecessary columns
MC<-MC[,-11]
MC<-MC[,-(4:9)]

#delete CINC values prior 1950
for (i in nrow(MC):1){
  if(MC[i,3]<1950){
    MC<-MC[-i,]
  }
}


######################################
## CINC

# create empty matrix to fill with values
MiC<- matrix(0,224,64)
rownames(MiC)<- laenderliste$V1[1:224]
colnames(MiC)<-1950:2013

for(i in 1:nrow(MC)){
  d<-which(MC[i,2]==laenderliste$COW)
  s<-MC[i,3]-1949
  MiC[d,s]<-MC[i,4]
}



MC<-MiC
# Germany has different COW from 1950-1990
MC[72,6]<-NMC_v4_0[5334,10]
MC[72,7]<-NMC_v4_0[5335,10]
MC[72,8]<-NMC_v4_0[5336,10]
MC[72,9]<-NMC_v4_0[5337,10]
MC[72,10]<-NMC_v4_0[5338,10]
MC[72,11]<-NMC_v4_0[5339,10]
MC[72,12]<-NMC_v4_0[5340,10]
MC[72,13]<-NMC_v4_0[5341,10]
MC[72,14]<-NMC_v4_0[5342,10]
MC[72,15]<-NMC_v4_0[5343,10]
MC[72,16]<-NMC_v4_0[5344,10]
MC[72,17]<-NMC_v4_0[5345,10]
MC[72,18]<-NMC_v4_0[5346,10]
MC[72,19]<-NMC_v4_0[5347,10]
MC[72,20]<-NMC_v4_0[5348,10]
MC[72,21]<-NMC_v4_0[5349,10]
MC[72,22]<-NMC_v4_0[5350,10]
MC[72,23]<-NMC_v4_0[5351,10]
MC[72,24]<-NMC_v4_0[5352,10]
MC[72,25]<-NMC_v4_0[5353,10]
MC[72,26]<-NMC_v4_0[5354,10]
MC[72,27]<-NMC_v4_0[5355,10]
MC[72,28]<-NMC_v4_0[5356,10]
MC[72,29]<-NMC_v4_0[5357,10]
MC[72,30]<-NMC_v4_0[5358,10]
MC[72,31]<-NMC_v4_0[5359,10]
MC[72,32]<-NMC_v4_0[5360,10]
MC[72,33]<-NMC_v4_0[5361,10]
MC[72,34]<-NMC_v4_0[5362,10]
MC[72,35]<-NMC_v4_0[5363,10]
MC[72,36]<-NMC_v4_0[5364,10]
MC[72,37]<-NMC_v4_0[5365,10]
MC[72,38]<-NMC_v4_0[5366,10]
MC[72,39]<-NMC_v4_0[5367,10]
MC[72,40]<-NMC_v4_0[5368,10]
MC[72,41]<-NMC_v4_0[5369,10]
MC[16,22]<-0





# data only till 2007 -> extending until 2013 using linear extrapolation

for(i in 1: 224){
  if(EX[i,58]==1){ # if country still exist in year 2007
    first.year<-min(which(EX[i,]==1)) # first year the country existed, minium=1950
    last.year<-max(which(EX[i,]==1)) # last year a country existed, maximum = 2013
    if(last.year> 58){    # set last year to 2007
      last.year<- 58
    }
    if(first.year<41){    # set first year to 1990 => neglect previous trends
      first.year<- 41
    }
    x<- first.year:last.year
    linExp <- lm(MC[i,first.year:last.year]~ x) # fit linear model for CINC
    
    MC[i,59]<- coef(linExp)[1]+ coef(linExp)[2]*59
    MC[i,60]<- coef(linExp)[1]+ coef(linExp)[2]*60
    MC[i,61]<- coef(linExp)[1]+ coef(linExp)[2]*61
    MC[i,62]<- coef(linExp)[1]+ coef(linExp)[2]*62
    MC[i,63]<- coef(linExp)[1]+ coef(linExp)[2]*63
    MC[i,64]<- coef(linExp)[1]+ coef(linExp)[2]*64
    
    
  }
}


##################################
## Intrastate Conflicts
##################################

# intrastate conflicts

conflict <- read.csv("Data/conflict.csv")

# preprocessing data
C<-conflict
C<-C[,-(6:8)]
C<-C[,-3]

# empty matrix
coml<- matrix(0,224,70)
rownames(coml)<-laenderliste$V1[1:224]
colnames(coml)<-1945:2014

# getting rid of interstate conflicts in data
for(i in nrow(C):1){
  if(C[i,5]==0){
    C<-C[-i,]
  }
}

C<-C[-(267:268),]
C<-C[-(260:261),]
C<-C[-21,]

# read in values into matrix
for (i in 1:nrow(C)){
  s<-which(laenderliste$V1==as.vector(C[i,4]))
  for(j in C[i,1]:(as.integer(C[i,2])+1944)){
    coml[s,j-1944]<-C[i,3]+coml[s,j-1944]
  }
}

rm(i,j,s,C)



###########################################################
## GDP
###########################################################

# read in and delete unnecessary columns
gdp <- read.delim("Data/gdpv6.txt")
gdp<-gdp[,-(6:8)]
gdp<-gdp[,-4]

GDPm<- matrix(NA,224, 64) # NA's not 0
colnames(GDPm)<- 1950:2013
rownames(GDPm)<- laenderliste$V1[1:224]

# save GDP in matrix
for(i in 1:nrow(gdp)){
  n<-which(gdp[i,1]==laenderliste$COW2)
  y<- gdp[i,3]
  GDPm[n,y-1949]<-gdp[i,4]
  
  
}

# GDP data missing for last two years. We simply use the latest available values
GDPm[,63]<-GDPm[,62]
GDPm[,64]<-GDPm[,62]

rm(gdp, n,y)

# Gleditsch and World Bank data merged
load("Data/merged_GDP_1950-2016.RData")

# replace NA holes with previous or next years GDP

# data for czech republic and czechoslovakia is changed from 2012-2016
GDPimp[51, 63:67]<- GDPimp[52, 63:67]

# 2012- 2013 no data for DR Congo -> take same as 2011
GDPimp[42, 63:67]<- GDPimp[42, 62]

# 2012- 2013 no data for Eritrea -> take same as 2011
GDPimp[62, 63:67]<- GDPimp[62, 62]

# 2012- 2013 no data for North Korea -> take same as 2011
GDPimp[98, 63:67]<- GDPimp[98, 62]

# 2012- 2013 no data for Kosovo -> take same as 2011
GDPimp[100, 63:67]<- GDPimp[100, 62]

# 2012- 2013 no data for Libya -> take same as 2011
GDPimp[108, 63:67]<- GDPimp[108, 62]

# 2012- 2013 no data for Monaco -> take same as 2011
GDPimp[125, 63:67]<- GDPimp[125, 62]

# 2012- 2013 no data for Romania -> take same as 2011
GDPimp[153, 63:67]<- GDPimp[153, 62]

# 2012- 2013 no data for Somalia -> take same as 2011
GDPimp[171, 63:67]<- GDPimp[171, 62]

# 2012- 2013 no data for Syria -> take same as 2011
GDPimp[184, 63:67]<- GDPimp[184, 62]

# 2012- 2013 no data for Taiwan -> take same as 2011
GDPimp[185, 63:67]<- GDPimp[185, 62]

# 2012- 2013 no data for Timor-Leste -> take same as 2011
GDPimp[189, 63:67]<- GDPimp[189, 62]

# remaining NA's set 0
GDPimp[is.na(GDPimp)]<-0


##############################################################
## Path Dependency
##############################################################

# Path Dependency

pathdep<- function(time){
  a<-matrix(0,257,257)
  # rownames(a)<- laenderliste$V1
  #colnames(a)<- laenderliste$V1
  for (i in (time-1954):(time-1950)){
    a<-a+amk[[i]]   
  }
  return(a)
}

PathD<-list()
PathD[[1]]<-matrix(0,257,257) # 1950
rownames(PathD[[1]])<-laenderliste$V1
colnames(PathD[[1]])<-laenderliste$V1
PathD[[2]]<-amk[[1]]
PathD[[3]]<-amk[[2]]+amk[[1]]
PathD[[4]]<-amk[[1]]+amk[[2]]+amk[[3]]
PathD[[5]]<-amk[[1]]+amk[[2]]+amk[[3]]+amk[[4]]
PathD[[6]]<-pathdep(1955)
PathD[[7]]<-pathdep(1956)
PathD[[8]]<-pathdep(1957)
PathD[[9]]<-pathdep(1958)
PathD[[10]]<-pathdep(1959)
PathD[[11]]<-pathdep(1960)
PathD[[12]]<-pathdep(1961)
PathD[[13]]<-pathdep(1962)
PathD[[14]]<-pathdep(1963)
PathD[[15]]<-pathdep(1964)
PathD[[16]]<-pathdep(1965)
PathD[[17]]<-pathdep(1966)
PathD[[18]]<-pathdep(1967)
PathD[[19]]<-pathdep(1968)
PathD[[20]]<-pathdep(1969)
PathD[[21]]<-pathdep(1970)
PathD[[22]]<-pathdep(1971)
PathD[[23]]<-pathdep(1972)
PathD[[24]]<-pathdep(1973)
PathD[[25]]<-pathdep(1974)
PathD[[26]]<-pathdep(1975)
PathD[[27]]<-pathdep(1976)
PathD[[28]]<-pathdep(1977)
PathD[[29]]<-pathdep(1978)
PathD[[30]]<-pathdep(1979)
PathD[[31]]<-pathdep(1980)
PathD[[32]]<-pathdep(1981)
PathD[[33]]<-pathdep(1982)
PathD[[34]]<-pathdep(1983)
PathD[[35]]<-pathdep(1984)
PathD[[36]]<-pathdep(1985)
PathD[[37]]<-pathdep(1986)
PathD[[38]]<-pathdep(1987)
PathD[[39]]<-pathdep(1988)
PathD[[40]]<-pathdep(1989)
PathD[[41]]<-pathdep(1990)
PathD[[42]]<-pathdep(1991)
PathD[[43]]<-pathdep(1992)
PathD[[44]]<-pathdep(1993)
PathD[[45]]<-pathdep(1994)
PathD[[46]]<-pathdep(1995)
PathD[[47]]<-pathdep(1996)
PathD[[48]]<-pathdep(1997)
PathD[[49]]<-pathdep(1998)
PathD[[50]]<-pathdep(1999)
PathD[[51]]<-pathdep(2000)
PathD[[52]]<-pathdep(2001)
PathD[[53]]<-pathdep(2002)
PathD[[54]]<-pathdep(2003)
PathD[[55]]<-pathdep(2004)
PathD[[56]]<-pathdep(2005)
PathD[[57]]<-pathdep(2006)
PathD[[58]]<-pathdep(2007)
PathD[[59]]<-pathdep(2008)
PathD[[60]]<-pathdep(2009)
PathD[[61]]<-pathdep(2010)
PathD[[62]]<-pathdep(2011)
PathD[[63]]<-pathdep(2012)
PathD[[64]]<-pathdep(2013)

rm(pathdep)


##########################################
## Polity 4
##########################################

#polity <- read.csv("C:/Users/Landsberg/Desktop/Uni/consulting/p4v2013csv.csv")
polity <- read.csv("Data/p4v2013csv.csv")



# delete unnecessary columns
polity<- polity[,-(12:36)]
polity<- polity[,-(6:10)]
polity<- polity[,-3]
polity<- polity[,-1]

# delete data prior 1950
for (i in nrow(polity):1){
  if (polity[i,3]<1950){
    polity<-polity[-i,] 
  }
}

# create empty matrix to store values
M<- matrix(0,257, 64)
colnames(M)<-1950:2013
rownames(M)<- laenderliste$V1
M<-M[-(225:257),]

# save data in matrix
for (i in 1:nrow(polity)){
  M[cownat(polity[i,1]),polity[i,3]-1949]<-polity[i,4]  
}

# find NA

for(i in 1:224){
  for(j in 1:64){
    if (is.na(M[i,j])==TRUE){
      print(i)
      print(j)
    }
  }
}

M[is.na(M)==TRUE]<-0

# different COW for Germany -> manual entry
M[72,]<-10
# same for Soviet Union
M[176, 1:5]<- -9
M[176, 6:40]<- -7
M[176, 41]<- -6
M[176, 42]<- 0
# manual entry for Timro Leste, data from http://www.systemicpeace.org/polity/polity4.htm
M[189, 53:57]<- 6
M[189, 58:64]<- 7


polity<-M
rm(M)

# create adjacency matrix with polity IV difference

poldiff<-function(time){
  M<- matrix(0,224,224)
  colnames(M)<-laenderliste$V1[1:224]
  rownames(M)<- laenderliste$V1[1:224]
  for(i in 1:224){
    a<- polity[i,time-1949]
    for (j in 1:224){
      b<- polity[j,time-1949]
      M[i,j]<- abs(a-b)
    }}
  return(M)
}

rm(i,j)






# Path Dependency 5 years

AR5 <- list()
AR5[[1]]<- amk[[1]]
AR5[[2]]<- amk[[1]]
AR5[[3]]<- amk[[1]]+ amk[[2]]
AR5[[4]]<- amk[[1]]+ amk[[2]]+ amk[[3]]
AR5[[5]]<- amk[[1]]+ amk[[2]]+ amk[[3]]+ amk[[4]]
for(i in 6:64){
  AR5[[i]]<- amk[[i-1]]+amk[[i-2]]+amk[[i-3]]+amk[[i-4]]+amk[[i-5]]
  
}

# Path Dependency 1 year

AR1 <- list()
AR1[[1]]<- amk[[1]]
for(i in 2:64){
  AR1[[i]]<- amk[[i-1]]
  
}


#######################################################################
## Help function   (cuts adjacency matrices and covariates into right shape for a year i,
##                  i.e. deletes all countries from data that did not exist at year i)
########################################################################


# t-2 lag


amperiod2<- function(from,year, plus, mod, tiv=1){
  A<- amk[[year-1949]]
  
  # Einträge ungleich Null gleich Eins setzen
  
  A[A <= tiv] <-0
  A[A > tiv] <-1
  
  #binarization with threshold
  a1<- amk[[from+plus-1949]]
  a1[a1 <= tiv]<-0
  a1[a1>tiv]<-1
  
  DA<-daml[[from+plus-1951]]
  
  pol<- poldiff(from+plus)
  pd<-PathD[[from+plus-1951]]
  
  mc<-MC[, from+plus-1951]
  mc2<-MC2[, from+plus-1951]
  
  co<-coml[,from+plus-1946]
  cad<- cdist
  
  gd<- GDPimp[, from+plus-1951]
  
  ar1<-AR1[[from+plus-1951]]
  
  ar5<-AR5[[from+plus-1951]]
  
  for (k in 257:1){
    if (EX[k,year-1949]==0){
      a1<-a1[-k,]
      a1<-a1[,-k]
      
      DA<-DA[-k,]
      DA<-DA[,-k]
      
      gd<-gd[-k]
      
      co<-co[-k]
      
      cad<-cad[-k,]
      cad<-cad[,-k]
      
      pol<-pol[-k,]
      pol<-pol[,-k]
      
      pd<-pd[-k,]
      pd<-pd[,-k]
      
      
      mc<-mc[-k]
      mc2<-mc2[-k]
      
      ar1<-ar1[-k,]
      ar1<-ar1[,-k]
      
      ar5<-ar5[-k,]
      ar5<-ar5[,-k]
      
    }
  }
  if (mod==1){
    return(a1)}
  if (mod==2){
    return(DA)}
  if (mod==6){
    return(pol)}
  if (mod==8){
    return(mc)}
  if (mod==10){
    return(co)}
  if (mod==19){
    return(mc2)}
  if (mod==20){
    return(G9o)}
  if (mod==21){
    return(G9i)}
  if (mod==22){
    return(gd)}
  if (mod==23){
    return(cad)}
  if (mod==24){
    return(ar1)}
  if (mod==25){
    return(pd)}
  if (mod==26){
    return(ar5)}
}



########################################################
## help function for single year (necessary for some figures)
########################################################


amallr<- function(year, tiv){
  
  A<-amk[[year-1949]]  
  A[A <= tiv] <-0
  A[A > tiv] <-1
  
  for (i in 257:1){
    if (EX[i,year-1949]==0){
      A<-A[-i,]
      
      A<-A[,-i]
      
      
    }
  }
  return(A)
  
}


###########################################################################################
###########################################################################################
########
########                                 Simulation
########
###########################################################################################
###########################################################################################



# create empty matrix to store results
# t-2 lag
# matrix to add results
ReMa<-matrix(0,59,58)
colnames(ReMa)<-1956:2013
rownames(ReMa)<-c('edges', 'KI', 'KI',    'gwi', 'KI', 'KI','gwo', 'KI', 'KI',
                  'mutual','KI','KI','triangle','KI','KI','DA',
                  'KI', 'KI', 'Go', 'KI',
                  'KI', 'Gi', 'KI', 'KI','capdist','Ki', 'Ki', 'Pol','Ki', 'Ki', 'patd',
                  'KI', 'KI', 'conf', 'KI', 'KI', 
                  'MiCi','KI', 'KI', 'MiCo','KI', 'KI',
                  'pedges',    'pgwi', 'pgwo',
                  'pmutual','triangle', 'DA',
                  'Go', 
                  'Gi','DC', 'Pol', 'patd',
                  'conf', 
                  'MiCi','MiCo',  "sd_DA", "sd_GDPout", "sd_GDPin")


# set seed and start simulation
set.seed(1)
for(i in 1956:2013){ # If i=1956,
  # we simulate a TERGM for the years 1952-1956, where the covariates for each year follow a t-2 lag. This means the covariates for
  # 1952 are based on year 1950
  print(i)
  
  # read in networks for the time interval (i-4, i)
  # the function amperiod2(from, year, plus, mode, tiv) creates and adjacency matrix for all the countries that existed in year i
  # amperiod2(from, year, plus, mode): e.g. amperiod2(1960,1965,1,1,2) creates an adjacency matrix for year 1960+1 based 
  # on countries that existed in year 1965. A tie is defined if the trade was 2Mio TIV or more. The TERGM requires networks on the same set of vertices.
  # Mode=1 returns MCW adjacency matrix. By changing the mode parameter the covariates can be cut into the right form as well.
  # mod=1, MCW
  # mod=2, Defense Alliance
  # mod=6, polity IV
  # mod=24, path dependency, 1-year
  # mod=8, military capability, CINC
  # mod=10, intrastate conflicts
  # mod=22 GDP
  # mod=23 capital distance
  # The tiv parameter (default is tiv=1) allows to control the binarization of the network, e.g. if tiv=1 is set, all ties with 
  # more or equal 1 (in million tiv) are taken as ties in the network, while all trades with less than 1 are neglected.
  
  # prepare networks
  networks<-list() 
  networks[[1]]<- network(amperiod2(i-4,i,0,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[2]]<- network(amperiod2(i-4,i,1,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[3]]<- network(amperiod2(i-4,i,2,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[4]]<- network(amperiod2(i-4,i,3,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[5]]<- network(amperiod2(i-4,i,4,1,0.5), directed=TRUE) # replace 0.5 for a different threshold

  ### prepare covariates
  # prepare alliance data
  alliance<- list()
  alliance[[1]]<- network(amperiod2(i-4,i,0,2))
  alliance[[2]]<- network(amperiod2(i-4,i,1,2))
  alliance[[3]]<- network(amperiod2(i-4,i,2,2))
  alliance[[4]]<- network(amperiod2(i-4,i,3,2))
  alliance[[5]]<- network(amperiod2(i-4,i,4,2))
 
  # prepare capital distance data
  capdist<- list()
  capdist[[1]]<- network(amperiod2(i-4,i,0,23))
  capdist[[2]]<- network(amperiod2(i-4,i,1,23))
  capdist[[3]]<- network(amperiod2(i-4,i,2,23))
  capdist[[4]]<- network(amperiod2(i-4,i,3,23))
  capdist[[5]]<- network(amperiod2(i-4,i,4,23))
 
  # prepare polity IV data
  pol<- list()
  pol[[1]]<- network(amperiod2(i-4,i,0,6))
  pol[[2]]<- network(amperiod2(i-4,i,1,6))
  pol[[3]]<- network(amperiod2(i-4,i,2,6))
  pol[[4]]<- network(amperiod2(i-4,i,3,6))
  pol[[5]]<- network(amperiod2(i-4,i,4,6))
 
  # prepare path dependency data
  patd<-list()
  patd[[1]]<-network(amperiod2(i-4,i,0,25))  # 
  patd[[2]]<-network(amperiod2(i-4,i,1,25))
  patd[[3]]<-network(amperiod2(i-4,i,2,25))
  patd[[4]]<-network(amperiod2(i-4,i,3,25))
  patd[[5]]<-network(amperiod2(i-4,i,4,25))
 
  # prepare CINC data
  mica<-amperiod2(i-4,i,0,8)    
  networks[[1]]<- set.vertex.attribute(networks[[1]],"MiC", mica)
  mica<-amperiod2(i-4,i,1,8)    
  networks[[2]]<- set.vertex.attribute(networks[[2]],"MiC", mica)
  mica<-amperiod2(i-4,i,2,8)    
  networks[[3]]<- set.vertex.attribute(networks[[3]],"MiC", mica)
  mica<-amperiod2(i-4,i,3,8)    
  networks[[4]]<- set.vertex.attribute(networks[[4]],"MiC", mica)
  mica<-amperiod2(i-4,i,4,8)    
  networks[[5]]<- set.vertex.attribute(networks[[5]],"MiC", mica)
  
  
  # prepare conflict data
  conf<-amperiod2(i-4,i,0,10)    
  networks[[1]]<- set.vertex.attribute(networks[[1]],"CO", conf)
  conf<-amperiod2(i-4,i,1,10)    
  networks[[2]]<- set.vertex.attribute(networks[[2]],"CO", conf)
  conf<-amperiod2(i-4,i,2,10)    
  networks[[3]]<- set.vertex.attribute(networks[[3]],"CO", conf)
  conf<-amperiod2(i-4,i,3,10)    
  networks[[4]]<- set.vertex.attribute(networks[[4]],"CO", conf)
  conf<-amperiod2(i-4,i,4,10)    
  networks[[5]]<- set.vertex.attribute(networks[[5]],"CO", conf)
 
  # prepare GDP data
  bi<-amperiod2(i-4,i,0,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[1]]<- set.vertex.attribute(networks[[1]],"GDP", bi)
  bi<-amperiod2(i-4,i,1,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[2]]<- set.vertex.attribute(networks[[2]],"GDP", bi)
  bi<-amperiod2(i-4,i,2,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[3]]<- set.vertex.attribute(networks[[3]],"GDP", bi)
  bi<-amperiod2(i-4,i,3,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[4]]<- set.vertex.attribute(networks[[4]],"GDP", bi)
  bi<-amperiod2(i-4,i,4,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[5]]<- set.vertex.attribute(networks[[5]],"GDP", bi)
  
  print('tergm')
  
  # run model
  model<- btergm(networks~edges+
                   gwodegree(1, fixed=TRUE)+
                   gwidegree(1, fixed=TRUE)+mutual+
                   gwesp(1.5, fixed=TRUE)+
                   edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
                   edgecov(capdist)+edgecov(pol)+ 
                   nodeicov('CO')+
                   nodeicov('MiC')+nodeocov('MiC')+ edgecov(patd))
  
  
  
  ReMa[1,i-1955]<- summary(model)[1,1]
  ReMa[2,i-1955]<- summary(model)[1,2]
  ReMa[3,i-1955]<- summary(model)[1,3]
  ReMa[4,i-1955]<- summary(model)[2,1]
  ReMa[5,i-1955]<- summary(model)[2,2]
  ReMa[6,i-1955]<- summary(model)[2,3]
  ReMa[7,i-1955]<- summary(model)[3,1]
  ReMa[8,i-1955]<- summary(model)[3,2]
  ReMa[9,i-1955]<- summary(model)[3,3]
  ReMa[10,i-1955]<- summary(model)[4,1]
  ReMa[11,i-1955]<- summary(model)[4,2]
  ReMa[12,i-1955]<- summary(model)[4,3]
  ReMa[13,i-1955]<- summary(model)[5,1]
  ReMa[14,i-1955]<- summary(model)[5,2]
  ReMa[15,i-1955]<- summary(model)[5,3]
  ReMa[16,i-1955]<- summary(model)[6,1]
  ReMa[17,i-1955]<- summary(model)[6,2]
  ReMa[18,i-1955]<- summary(model)[6,3]
  ReMa[19,i-1955]<- summary(model)[7,1]
  ReMa[20,i-1955]<- summary(model)[7,2]
  ReMa[21,i-1955]<- summary(model)[7,3]
  ReMa[22,i-1955]<- summary(model)[8,1]
  ReMa[23,i-1955]<- summary(model)[8,2]
  ReMa[24,i-1955]<- summary(model)[8,3]
  ReMa[25,i-1955]<- summary(model)[9,1]
  ReMa[26,i-1955]<- summary(model)[9,2]
  ReMa[27,i-1955]<- summary(model)[9,3]
  ReMa[28,i-1955]<- summary(model)[10,1]
  ReMa[29,i-1955]<- summary(model)[10,2]
  ReMa[30,i-1955]<- summary(model)[10,3]
  ReMa[31,i-1955]<- summary(model)[11,1]
  ReMa[32,i-1955]<- summary(model)[11,2]
  ReMa[33,i-1955]<- summary(model)[11,3]
  ReMa[34,i-1955]<- summary(model)[12,1]
  ReMa[35,i-1955]<- summary(model)[12,2]
  ReMa[36,i-1955]<- summary(model)[12,3]
  ReMa[37,i-1955]<- summary(model)[13,1]
  ReMa[38,i-1955]<- summary(model)[13,2]
  ReMa[39,i-1955]<- summary(model)[13,3]
  ReMa[40,i-1955]<- summary(model)[14,1]
  ReMa[41,i-1955]<- summary(model)[14,2]
  ReMa[42,i-1955]<- summary(model)[14,3]
  ReMa[43,i-1955]<- btergm.se(model)[1,4]
  ReMa[44,i-1955]<- btergm.se(model)[2,4]
  ReMa[45,i-1955]<- btergm.se(model)[3,4]
  ReMa[46,i-1955]<- btergm.se(model)[4,4]
  ReMa[47,i-1955]<- btergm.se(model)[5,4]
  ReMa[48,i-1955]<- btergm.se(model)[6,4]
  ReMa[49,i-1955]<- btergm.se(model)[7,4]
  ReMa[50,i-1955]<- btergm.se(model)[8,4]
  ReMa[51,i-1955]<- btergm.se(model)[9,4]
  ReMa[52,i-1955]<- btergm.se(model)[10,4]
  ReMa[53,i-1955]<- btergm.se(model)[11,4]
  ReMa[54,i-1955]<- btergm.se(model)[12,4]
  ReMa[55,i-1955]<- btergm.se(model)[13,4]
  ReMa[56,i-1955]<- btergm.se(model)[14,4]
  ReMa[57,i-1955]<- btergm.se(model)[6,2] #Alliance
  ReMa[58,i-1955]<- btergm.se(model)[7,2] #GDPout
  ReMa[59,i-1955]<- btergm.se(model)[8,2] #GDPin
  
  
  
  write.csv(ReMa, file = "ReMa.csv")
}




########################################
###     plot results (Figure 5)
########################################


G=ReMa

library(ggplot2)
library(reshape)
library(gridExtra)

Year<- 1956:2013
# p-values
S<-matrix(0,16,58)
S<-G[43:56,]
S[is.na(S)]<-8
S[S>0.1]<-8
S[S>0.05 & S<0.1]<-6
S[S<0.05]<-4
#S[4,]<-c(1,2,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,3,2,3,3,3,3,3,1,1,1,1,1,1,3,3,3,3,3,3,3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)
colnames(G)=Year

data<- data.frame(Year, G[1,], S[1,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[3,], ymin = G[2,])
p1<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Edges')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p1<-p1+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p1<-p1+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[4,], S[2,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[6,], ymin = G[5,])
p2<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('GW-Outdegree')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p2<-p2+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p2<-p2+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[7,], S[3,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[9,], ymin = G[8,])
p3<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('GW-Indegree')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p3<-p3+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p3<-p3+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[10,], S[4,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[12,], ymin = G[11,])
p4<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Mutual')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p4<-p4+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p4<-p4+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[13,], S[5,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[15,], ymin = G[14,])
p5<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('GWESP')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p5<-p5+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p5<-p5+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[16,], S[6,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[18,], ymin = G[17,])
p6<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Defense Agreement')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p6<-p6+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p6<-p6+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[19,], S[7,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[21,], ymin = G[20,])
p7<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Log GDP Exporter')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p7<-p7+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p7<-p7+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[22,], S[8,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[24,], ymin = G[23,])
p8<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Log GDP Importer')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p8<-p8+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p8<-p8+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[25,], S[9,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[27,], ymin = G[26,])
p9<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Geographic Distance')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p9<-p9+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p9<-p9+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
             plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[28,], S[10,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[30,], ymin = G[29,])
p10<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Absolute Difference in Polity Score')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p10<-p10+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p10<-p10+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
               plot.title=element_text(size=14, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[40,], S[14,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[42,], ymin = G[41,])
p11<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Path Dependency')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p11<-p11+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p11<-p11+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
               plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[34,], S[12,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[36,], ymin = G[35,])
p12<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('CINC Importer')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p12<-p12+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p12<-p12+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
               plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[37,], S[13,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[39,], ymin = G[38,])
p13<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('CINC Exporter')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p13<-p13+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p13<-p13+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
               plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 


data<- data.frame(Year, G[31,], S[11,])
colnames(data)<- c('year', 'mean', 'pi')
eb <- aes(ymax = G[33,], ymin = G[32,])
p14<- ggplot(data = data, aes(x = year, y = mean, shape=factor(pi), group=1)) +ggtitle('Intra-State Conflict Importer')+
  geom_line() + 
  geom_ribbon(eb, alpha = 0.3)
p14<-p14+scale_colour_manual(values=c('21'='springgreen4', '22'='orange1', '23'='red'))
p14<-p14+theme(legend.position='none', axis.text=element_text(size=12),axis.title=element_text(size=14),
               plot.title=element_text(size=16, face='bold'))+ geom_point(colour = "black", size = 2) +
  geom_point(aes(colour = factor(pi)), size=1.5) 



#######################################



grid.arrange(p1, p2, p3, p4, p5, p11, ncol=2, nrow=3)
grid.arrange(p7,p8, p13,p12,p6,p10,p9, p14, ncol=2)



###############################################
# DA vs GDPi (Figure 6)

par(mfrow=c(1,1))
P<- ReMa
EM6=matrix(0,6,58)
rownames(EM6)=c("ratio","sd", "z", 'p', "Ku", "Ko")

# calculate Defense Agreement/ Log GDP Importer with Delta Method
for(i in 1:58){
  G=c(1/P[22,i], -P[16,i]/P[22,i]^2) # row 19 GDP export, row 16 DA 
  V= matrix(c(P[57,i]^2,0,0,P[59,i]^2), 2,2)
  EM6[1,i]=P[16,i]/P[22,i]
  s=t(G)%*%V%*%G
  EM6[2,i]=sqrt(abs(s))
  EM6[3,i]=EM6[1,i]/sqrt(abs(s))
  EM6[4,i]=2*(1-pnorm(EM6[3,i]))
  EM6[5,i]= EM6[1,i]-1.96*EM6[2,i]
  EM6[6,i]= EM6[1,i]+1.96*EM6[2,i]
}

#set thresholds for color and shape of p-values
S<- matrix(0,1,58)
S<-EM6[4,]
S[is.na(S)]<-3
S[S>0.1]<-3
S[S>0.05 & S<0.1]<-2
S[S<0.05]<-1


Year<- 1956:2013

# Plotting
mar.default <- c(5,4,4,2) + 0.1
par(mar = mar.default + c(0, 1.5, 0, 0)) 
plot(Year, EM6[1,], type="l", ylab="Theta", main="Defense Agreement/Log GDP Importer",cex.lab=2.8,ylim=c(0, 30),
     cex.main=3.5, cex.axis=2.5, lwd=2)


# add fill
polygon(c(rev(1956:2013), 1956:2013), c(rev(EM6[6,]), EM6[5,]), col = 'grey80', border = NA,ylim=c(0, 30))
par(new=T)
plot(Year, EM6[1,], type="l", ylab=NA ,xlab=NA , ylim=c(0, 30),xaxt='n', yaxt="n", lwd=3)

# intervals
lines(1956:2013, EM6[5,], lty = 'dashed', col = 'red', lwd=3)
lines(1956:2013, EM6[6,], lty = 'dashed', col = 'red', lwd=3)
par(new=T)
plot(Year, EM6[1,], pch=c(21,24,22)[S], ylab=NA ,xlab=NA ,  ylim=c(0, 30),xaxt='n', yaxt="n", cex=2 ,
     bg=c("springgreen3", "orange", "red2")[S])
abline(h=0, lty=2, col='grey', lwd=3)





#######################################################################
#######################################################################
### AUC 
#######################################################################
#######################################################################


# empty matrix to store results
resultmatrix.auc<- matrix(0, 4, 57)
rownames(resultmatrix.auc)<- c( "ROC_full", "ROC_logit", "PR_full", "PR_logit")

# loop, for each time period t-4 to t calculate the AUC for t+1
set.seed(1)
for(i in 1956:2012){
  #year
  print(i)
  
  # prepare networks
  networks<-list() 
  networks[[1]]<- network(amperiod2(i-4,i,0,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[2]]<- network(amperiod2(i-4,i,1,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[3]]<- network(amperiod2(i-4,i,2,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[4]]<- network(amperiod2(i-4,i,3,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[5]]<- network(amperiod2(i-4,i,4,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  networks[[6]]<- network(amperiod2(i-4,i,5,1,0.5), directed=TRUE) # replace 0.5 for a different threshold
  
  ### prepare covariates
  # prepare alliance data
  alliance<- list()
  alliance[[1]]<- network(amperiod2(i-4,i,0,2))
  alliance[[2]]<- network(amperiod2(i-4,i,1,2))
  alliance[[3]]<- network(amperiod2(i-4,i,2,2))
  alliance[[4]]<- network(amperiod2(i-4,i,3,2))
  alliance[[5]]<- network(amperiod2(i-4,i,4,2))
  alliance[[6]]<- network(amperiod2(i-4,i,5,2))
  
  # prepare capital distance data
  capdist<- list()
  capdist[[1]]<- network(amperiod2(i-4,i,0,23))
  capdist[[2]]<- network(amperiod2(i-4,i,1,23))
  capdist[[3]]<- network(amperiod2(i-4,i,2,23))
  capdist[[4]]<- network(amperiod2(i-4,i,3,23))
  capdist[[5]]<- network(amperiod2(i-4,i,4,23))
  capdist[[6]]<- network(amperiod2(i-4,i,5,23))
  
  # prepare polity IV data
  pol<- list()
  pol[[1]]<- network(amperiod2(i-4,i,0,6))
  pol[[2]]<- network(amperiod2(i-4,i,1,6))
  pol[[3]]<- network(amperiod2(i-4,i,2,6))
  pol[[4]]<- network(amperiod2(i-4,i,3,6))
  pol[[5]]<- network(amperiod2(i-4,i,4,6))
  pol[[6]]<- network(amperiod2(i-4,i,5,6))
  
  # prepare path dependency data
  patd<-list()
  patd[[1]]<-network(amperiod2(i-4,i,0,25))
  patd[[2]]<-network(amperiod2(i-4,i,1,25))
  patd[[3]]<-network(amperiod2(i-4,i,2,25))
  patd[[4]]<-network(amperiod2(i-4,i,3,25))
  patd[[5]]<-network(amperiod2(i-4,i,4,25))
  patd[[6]]<-network(amperiod2(i-4,i,5,25))
  
  # prepare CINC data
  mica<-amperiod2(i-4,i,0,8)    
  networks[[1]]<- set.vertex.attribute(networks[[1]],"MiC", mica)
  mica<-amperiod2(i-4,i,1,8)    
  networks[[2]]<- set.vertex.attribute(networks[[2]],"MiC", mica)
  mica<-amperiod2(i-4,i,2,8)    
  networks[[3]]<- set.vertex.attribute(networks[[3]],"MiC", mica)
  mica<-amperiod2(i-4,i,3,8)    
  networks[[4]]<- set.vertex.attribute(networks[[4]],"MiC", mica)
  mica<-amperiod2(i-4,i,4,8)    
  networks[[5]]<- set.vertex.attribute(networks[[5]],"MiC", mica)
  mica<-amperiod2(i-4,i,5,8)    
  networks[[6]]<- set.vertex.attribute(networks[[6]],"MiC", mica)
  
  # prepare conflict data
  conf<-amperiod2(i-4,i,0,10)    
  networks[[1]]<- set.vertex.attribute(networks[[1]],"CO", conf)
  conf<-amperiod2(i-4,i,1,10)    
  networks[[2]]<- set.vertex.attribute(networks[[2]],"CO", conf)
  conf<-amperiod2(i-4,i,2,10)    
  networks[[3]]<- set.vertex.attribute(networks[[3]],"CO", conf)
  conf<-amperiod2(i-4,i,3,10)    
  networks[[4]]<- set.vertex.attribute(networks[[4]],"CO", conf)
  conf<-amperiod2(i-4,i,4,10)    
  networks[[5]]<- set.vertex.attribute(networks[[5]],"CO", conf)
  conf<-amperiod2(i-4,i,5,10)    
  networks[[6]]<- set.vertex.attribute(networks[[6]],"CO", conf)
  
  # prepare GDP data
  bi<-amperiod2(i-4,i,0,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[1]]<- set.vertex.attribute(networks[[1]],"GDP", bi)
  bi<-amperiod2(i-4,i,1,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[2]]<- set.vertex.attribute(networks[[2]],"GDP", bi)
  bi<-amperiod2(i-4,i,2,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[3]]<- set.vertex.attribute(networks[[3]],"GDP", bi)
  bi<-amperiod2(i-4,i,3,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[4]]<- set.vertex.attribute(networks[[4]],"GDP", bi)
  bi<-amperiod2(i-4,i,4,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[5]]<- set.vertex.attribute(networks[[5]],"GDP", bi)
  bi<-amperiod2(i-4,i,5,22)
  bi[bi==0]<-1
  bi<-log(bi)
  networks[[6]]<- set.vertex.attribute(networks[[6]],"GDP", bi)
  
  
  ##### with network statistics
  
  model1<- ergm(networks[[1]]~edges+
                  gwodegree(1, fixed=TRUE)+
                  gwidegree(1, fixed=TRUE)+
                  mutual+ gwesp(1.5, fixed=TRUE)+
                  edgecov(alliance[[1]])+  nodeocov('GDP')+ nodeicov('GDP')+
                  edgecov(capdist[[1]])+edgecov(pol[[1]])+ 
                  edgecov(patd[[1]])+
                  nodeicov('CO')+
                  nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")
  
  
  net.mple <- simulate.ergm(model1 , nsim=500, control=control.simulate.ergm( MCMC.interval=1000))
  
  
  for(k in 2:5){
    
    model1<- ergm(networks[[k]]~edges+
                    gwodegree(1, fixed=TRUE)+
                    gwidegree(1, fixed=TRUE)+
                    mutual+ gwesp(1.5, fixed=TRUE)+
                    edgecov(alliance[[k]])+  nodeocov('GDP')+ nodeicov('GDP')+
                    edgecov(capdist[[k]])+edgecov(pol[[k]])+ 
                    edgecov(patd[[k]])+
                    nodeicov('CO')+
                    nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")
    
    
    net.mple1 <- simulate.ergm(model1 , nsim=500, control=control.simulate.ergm( MCMC.interval=1000)) 
    
    net.mple<- c(net.mple, net.mple1) 
    
  }
  
  ev.recall<- c()
  ev.roc<- c()
  
  AM <- as.matrix.network(networks[[6]])
  
  SimAM <- matrix(0, ncol(AM), ncol(AM))
  
  for(j in 1:2500){
    
    SimAM <- SimAM + as.matrix.network(net.mple[[j]])
    
  }
  
  SimAM <- SimAM/length(net.mple)
  
  # as vectors
  
  AM.vec<- as.vector(AM)
  SimAM.vec <- as.vector(SimAM)
  
  # delete diagonal elements
  
  d<- ncol(AM)
  HM<- matrix(1:(d*d), d, d)
  
  diag.HM <- diag(HM)
  
  for(k in (d*d):1){
    if(is.element(k, diag.HM)){
      AM.vec<- AM.vec[-k]
      SimAM.vec<- SimAM.vec[-k]
    }
    
  }
  
  ### calculate ROC/PR AUC
  fg <- SimAM.vec[AM.vec == 1]
  bg <- SimAM.vec[AM.vec == 0]
  
  # ROC Curve    
  roc1 <- roc.curve(scores.class0 = fg, scores.class1 = bg, curve = T)
  #plot(roc1)
  # PR Curve
  pr1 <- pr.curve(scores.class0 = fg, scores.class1 = bg, curve = T)
  #plot(pr1, col=2, main="PR curve 2012",  auc.main=FALSE)
  
  resultmatrix.auc[1,i-1955]<- roc1$auc
  resultmatrix.auc[3,i-1955]<- pr1$auc.integral
  
  print(roc1$auc)
  print(pr1$auc.integral)
  
  
  ### without network statistics
  
  model2<- ergm(networks[[1]]~ edges+ edgecov(alliance[[1]])+  nodeocov('GDP')+ nodeicov('GDP')+
                  edgecov(capdist[[1]])+edgecov(pol[[1]])+ 
                  edgecov(patd[[1]])+
                  nodeicov('CO')+
                  nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")
  
  
  
  net.mple <- simulate.ergm(model2 , nsim=500, control=control.simulate.ergm( MCMC.interval=1000))
  
  
  for(k in 2:5){
    
    model2<- ergm(networks[[k]]~edges+
                    edgecov(alliance[[k]])+  nodeocov('GDP')+ nodeicov('GDP')+
                    edgecov(capdist[[k]])+edgecov(pol[[k]])+ 
                    edgecov(patd[[k]])+
                    nodeicov('CO')+
                    nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")
    
    
    net.mple2 <- simulate.ergm(model2 , nsim=500, control=control.simulate.ergm( MCMC.interval=1000)) 
    
    net.mple<- c(net.mple, net.mple2) 
    
  }
  
  ev.recall<- c()
  ev.roc<- c()
  
  AM <- as.matrix.network(networks[[6]])
  
  SimAM <- matrix(0, ncol(AM), ncol(AM))
  
  for(j in 1:2500){
    
    SimAM <- SimAM + as.matrix.network(net.mple[[j]])
    
  }
  
  SimAM <- SimAM/length(net.mple)
  
  # as vectors
  
  AM.vec<- as.vector(AM)
  SimAM.vec <- as.vector(SimAM)
  
  # delete diagonal elements
  
  d<- ncol(AM)
  HM<- matrix(1:(d*d), d, d)
  
  diag.HM <- diag(HM)
  
  for(k in (d*d):1){
    if(is.element(k, diag.HM)){
      AM.vec<- AM.vec[-k]
      SimAM.vec<- SimAM.vec[-k]
    }
    
  }
  
  ### calculate ROC/PR AUC
  fg <- SimAM.vec[AM.vec == 1]
  bg <- SimAM.vec[AM.vec == 0]
  
  # ROC Curve    
  roc2 <- roc.curve(scores.class0 = fg, scores.class1 = bg, curve = T)
  #plot(roc2)
  # PR Curve
  pr2 <- pr.curve(scores.class0 = fg, scores.class1 = bg, curve = T)
  #plot(pr2, add=TRUE, col=3, auc.main=FALSE)
  resultmatrix.auc[2,i-1955]<- roc2$auc
  resultmatrix.auc[4,i-1955]<- pr2$auc.integral
  
  
  print(roc2$auc)
  print(pr2$auc.integral)
  
}


###############################################
### plotting (Figure 7)
###############################################

# ROC

TERGM <-resultmatrix.auc[1,]
naive_logit= resultmatrix.auc[2,]
Year=1957:2013


data<-data.frame(Year,TERGM,naive_logit)
melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Type","AUC")
proc<-ggplot(melted, aes(x = Year,y=AUC,color=Type)) +
  geom_line(size=1.2)
proc<-proc+ggtitle("ROC AUC")+
  theme(axis.text=element_text(size=28),axis.title=element_text(size=28), legend.position = "none",
        plot.title=element_text(size=24, face='bold'), legend.text=element_text(size=28))#,
proc


# PR

TERGM <-resultmatrix.auc[3,]
naive_logit=resultmatrix.auc[4,]
Year=1957:2013


data<-data.frame(Year,TERGM,naive_logit)
melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Type","AUC")
ppr<-ggplot(melted, aes(x = Year,y=AUC,color=Type)) +
  geom_line(size=1.2)
ppr<-ppr+ggtitle("Precision Recall AUC")+ scale_y_continuous(breaks=seq(0.34, 0.66, 0.02))+
  theme(axis.text=element_text(size=28),axis.title=element_text(size=28),
        plot.title=element_text(size=24, face='bold'), legend.text=element_text(size=28),
        legend.title=element_text(size=28))+ scale_colour_discrete(name="Model",
                                                                   breaks=c("TERGM", "naive_logit", "no_path"),
                                                                   labels=c("TERGM", "Naive Logit", "No Path D."))
ppr

my_layout<- matrix(c(1,1,2,2,2),1,5)
grid.arrange(proc, ppr, layout_matrix=my_layout)


###################################################################
###################################################################
##### Remaining plots
###################################################################
###################################################################


##################################
### aggregated volumes (Figure 1)
##################################

# sumtiv Zeitreihe

ev<-c()
for(i in 1950:2013){
  a<-sum(amk[[i-1949]])
  ev[i-1949]<-a
}

Year<-1950:2013
quantity<-ev
quantity<-quantity/1000

data<-data.frame(Year, quantity)

melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Variable","TIV")
p1<-ggplot(melted, aes(x = Year,y=TIV), lwd=2) +
  geom_line(col='blue', lwd=1.5)
p1<-p1+theme(axis.text=element_text(size=28),axis.title=element_text(size=28),legend.position='none',
             plot.title=element_text(size=24, face='bold'), legend.text=element_text(size=28), 
             legend.title=element_text(size=28))+ ggtitle("Aggregated Trade Volumes")
p1<- p1+ geom_point(size=3)
p1


#####################################
### reciprocity (Figure 2)
#####################################



Year<-1950:2013

Onesided<-c()

for(i in 1:64){a<-igraph::dyad.census(graph.adjacency(amallr(i+1949,0.5)))$asym
b<-2*igraph::dyad.census(graph.adjacency(amallr(1949+i,0.5)))$mut 
Onesided[i]<-a/(a+b)}


Mutual<-c()

for(i in 1:64){a<-igraph::dyad.census(graph.adjacency(amallr(1949+i,0.5)))$asym
b<-2*igraph::dyad.census(graph.adjacency(amallr(1949+i,0.5)))$mut 
Mutual[i]<-b/(a+b)}


data<-data.frame(Year,Onesided,Mutual)
colnames(data)<- c("Year", "One-Sided", "Mutual")
melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Type","Quantity")
p<-ggplot(melted, aes(x = Year,y=Quantity,color=Type)) +
  geom_line(lwd=2)
p<-p+ggtitle("Proportion Between One-Sided and Mutual Ties")+
  theme(axis.text=element_text(size=28),axis.title=element_text(size=28),
        plot.title=element_text(size=24, face='bold'), legend.text=element_text(size=28), legend.title=element_text(size=28))
p




##########################################
### Degree Disitribution (Figure 3)
##########################################

# in-degree

# function to calculate the indegree distribution
d<-function(from,till,mod){l<-list()
for(i in from:till){A<-amallr(i,0.5) # replace 0.5 for a different threshold
graph<-graph.adjacency(A)
c<-degree.distribution(graph, v=V(graph),mode=mod)
if( length(c)>15)
{ g<-sum(c[16:length(c)])
c<-c(c[1:15],g)}
else{c<- c(c,rep(0,(15-length(c)+1)))}
l[[i-from+1]]<-c}
return(l)}

# calculate indegree distribution
a<-d(1950,2013,"in")
sw<-a[[1]]
for(i in 2:64){sw<-c(sw,a[[i]])}
l<- length(sw)

# plot

id<-1:l
group<-rep(0:15,64)

data<-data.frame(id,group,sw)
colnames(data)<-c("id","group","indegree")


melted <- melt(data, id.vars=c("id", "group"))

means <- ddply(melted, c("group", "variable"), summarise,
               mean=mean(value))



bar1<-ggplot(means, aes(x=group, y=mean, fill=variable)) +
  geom_bar(stat="identity")+guides(fill=FALSE)+xlab("Indegree") + ylab("Percentage") +
  ggtitle("Indegree Distribution 1950-2013 (Proportions)")+ theme(legend.position='none',axis.text=element_text(size=24),axis.title=element_text(size=24),
                                                                  plot.title=element_text(size=14, face='bold'), legend.text=element_text(size=18))

means.sem <- ddply(melted, c("group", "variable"), summarise,
                   mean=mean(value), sem=sd(value)/sqrt(length(value)))
means.sem <- transform(means.sem, lower=mean-sem, upper=mean+sem)

bar1<- bar1 + geom_errorbar(aes(ymax=upper,  ymin=lower),
                            position=position_dodge(0.9),
                            data=means.sem)
bar1

# out-degree

# function to calculate the out-degree distribution
d2<-function(from,till,mod){l<-list()
for(i in from:till){A<-amallr(i,0.5)  # replace 0.5 for a different threshold
graph<-graph.adjacency(A)
c<-degree.distribution(graph, v=V(graph),mode=mod) 
c<-c[1:16]
l[[i-from+1]]<-c}
return(l)}

# calculate out-degree distribution
a<-d2(1950,2013,"out")
sw<-a[[1]]
for(i in 2:64){sw<-c(sw,a[[i]])}
l<- length(sw)

# plot
id<-1: l
group<-rep(0:15,64)

data<-data.frame(id,group,sw)
colnames(data)<-c("id","group","outdegree")


melted <- melt(data, id.vars=c("id", "group"))

means <- ddply(melted, c("group", "variable"), summarise,
               mean=mean(value))


bar2<-ggplot(means, aes(x=group, y=mean, fill=variable)) +
  geom_bar(stat="identity")+guides(fill=FALSE)+xlab("Outdegree") + ylab("Percentage") +
  ggtitle("Outdegree Distribution 1950-2013 (Proportions)")+ theme(legend.position='none',axis.text=element_text(size=24),axis.title=element_text(size=24),
                                                                   plot.title=element_text(size=14, face='bold'), legend.text=element_text(size=18))

means.sem <- ddply(melted, c("group", "variable"), summarise,
                   mean=mean(value), sem=sd(value)/sqrt(length(value)))
means.sem <- transform(means.sem, lower=mean-sem, upper=mean+sem)

bar2<- bar2 + geom_errorbar(aes(ymax=upper,  ymin=lower),
                            position=position_dodge(0.9),
                            data=means.sem)

bar2


grid.arrange(bar1, bar2, nrow=1, ncol=2)#,top=textGrob("Threshold = 1 Mio TIV", gp=gpar(fontsize=24)))


##########################################
# Power Law Caluclation
###########################################

library(poweRlaw)

# indegree
power.law.in<- c()
for(i in 1950:2013){
  print(i)
  A<-amallr(i,0.5)  # replace 0.5 for a different threshold
  graph<-graph.adjacency(A)
  cols<- colSums(A)
  tab<- as.vector(table(cols))
  l<- length(tab)
  data<- 0
  for (j in 1:l){
    r<- rep(j-1, tab[j])
    data<- c(data, r)
  }
  data<- data[-1]
  # values have to be strictly positive
  data<- data+1
  data_pl <- displ$new(data)
  
  est <- estimate_xmin(data_pl)
  data_pl$xmin <- est$xmin
  data_pl$pars <- est$pars
  
  bs <- bootstrap_p(data_pl)
  power.law.in[i-1949]<- bs$p
}


# outdegree

power.law.out<- c()
for(i in 1950:2013){
  print(i)
  A<-amallr(i,0.5)   # replace 0.5 for a different threshold
  graph<-graph.adjacency(A)
  cols<- rowSums(A)
  tab<- as.vector(table(cols))
  l<- length(tab)
  data<- 0
  for (j in 1:l){
    r<- rep(j-1, tab[j])
    data<- c(data, r)
  }
  data<- data[-1]
  # values have to be strictly positive
  data<- data+1
  data_pl <- displ$new(data)
  
  est <- estimate_xmin(data_pl)
  data_pl$xmin <- est$xmin
  data_pl$pars <- est$pars
  
  bs <- bootstrap_p(data_pl)
  power.law.out[i-1949]<- bs$p
}

par(mfrow=c(2,1))
plot(1950:2013, power.law.in, type="l", main="Power Law Test Indegree Distribution", ylab="p-value", xlab="Year")
plot(1950:2013, power.law.out, type="l", main="Power Law Test Outdegree Distribution", ylab="p-value", xlab="Year")


########################################
### Triad configuration (Table 1)
########################################

#A->B<-C, A<->C

dat2=data.frame()
dat2[1,1]="A"
dat2[1,2]="B"
dat2[1,3]="C"

# calculate all possible triads (this takes a while)
for(y in 1:64){
  t=1949+y
  print(t)
  a=amk[[y]][1:224,1:224]
  a[a > 0] <-1 #
  for(i in 1:224){
    for(j in 1:224){
      for(k in 1:224){
        if(a[i,j]*a[i,k]*(1-a[j,i])*(1-a[j,k])*a[k,i]*a[k,j]==1){
          
          d=dim(dat2)[1]
          dat2[d+1,1]=i
          dat2[d+1,2]=j
          dat2[d+1,3]=k
        }
      } 
    }
  }
}

dat2c=count(dat2)
dd2=dat2c[order(-dat2c[,4]), ]
View(dd2[1:20,])


########################################################################
########################################################################
##
##    Figures in the Appendix
##
########################################################################
########################################################################


###################################################################
## Network Plots
###################################################################


# plot networks for threshold = 0.5

network.plot <- function(year, tiv=0.5){
  # get adjacency matrix
  fullam<-amallr(year,tiv) 
  d<- dim(fullam)[1]
  
  # exclude existing countries who did not trade
  for(i in d:1){
    if(sum(fullam[i,])==0 & sum(fullam[,i])==0){
      fullam<- fullam[-i,]
      fullam<- fullam[, -i]
    }
  }
  
  # create network object
  graph<-graph.adjacency(fullam, mode="directed")
  deg <- degree(graph, mode="out")
  
  # plot
  V(graph)$size<-4.5     # size of nodes
  V(graph)$weights<-deg   # assign weights to nodes normalized by biggest export tiv
  V(graph)[weights == 0]$color<- "white"  # color nodes with no export white
  V(graph)[0 < weights & weights <= 5]$color<- "yellow"   #color nodes with export less than 10% and more than 0 of biggest export yellow
  V(graph)[weights > 5]$color<- "orange" # color nodes with export more than 50% of the biggest export tiv red
  V(graph)$label.cex<-.8       # label font size
  V(graph)$label.dist<-.4      # label distance to nodes
  E(graph)$arrow.width<-0.8       
  E(graph)$arrow.size<-.2
  
  if(year==1950){
    set.seed(62345)
    plot(graph,layout=layout_with_fr, main=paste("Arms Trade Network", year), sub='Data Source: SIPRI' )}
  
  if(year==1970){
    set.seed(42345)
    plot(graph,layout=layout_with_fr, main=paste("Arms Trade Network", year), sub='Data Source: SIPRI' )}
  
  if(year==1990){
    set.seed(42345)
    plot(graph,layout=layout_with_fr, main=paste("Arms Trade Network", year), sub='Data Source: SIPRI' )}
  
  if(year==2012){
    set.seed(42345)
    plot(graph,layout=layout_with_fr, main=paste("Arms Trade Network", year), sub='Data Source: SIPRI' )}
  
}

par(mfrow=c(1,1))

network.plot(1950)
network.plot(1970)
network.plot(1990)
network.plot(2012)


###############################################################
## Number of Actors in Network + Denisty of Network (Figure 3)
###############################################################


######################
#### density

# empty matrix
A<- matrix(0, 1, 64)
colnames(A)<- 1950:2013

# get density data
for(i in 1950:2013){
  # 0
  a<- amallr(i,0)
  b<- graph.adjacency(a)
  A[1,i-1949]<- graph.density(b)
  
}

Year<- 1950:2013
data<-data.frame(Year,t(A))
melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Type","Density")
p1<-ggplot(melted, aes(x = Year,y=Density,color=Type)) +
  geom_line(col="blue", lwd=2)
p1<-p1+ggtitle("Density of the Network")+ geom_point(col='black')+
  theme(legend.position='none', axis.text=element_text(size=24),axis.title=element_text(size=26),
        plot.title=element_text(size=28, face='bold'), legend.text=element_text(size=20),
        legend.title=element_text(size=24))
p1


###############################
# number of actors


ev<-c()

for(i in 1950:2013){ # evtl amallr anpassen
  a<-amallr(i,0)
  ev[i-1949]<-dim(a)[1]
}

Year<-1950:2013
Quantity<-ev

data<-data.frame(Year, Quantity)

melted<-melt(data,id.vars="Year")
colnames(melted)<-c("Year","Variable","Quantity")
p2<-ggplot(melted, aes(x = Year,y=Quantity)) +
  geom_line(col='blue', lwd=2)
p2<-p2+ggtitle("Number of Actors in the Network")+ geom_point(col='black')+
  theme(legend.position='none', axis.text=element_text(size=24),axis.title=element_text(size=26),
        plot.title=element_text(size=28, face='bold'))
p2



grid.arrange(p2, p1, nrow=2, ncol=1)



#######################################################
### Degeneracy Plots  (Figures 10 and 11)
#######################################################


##### model is object from tergm_AUC_out_of_sample.R

###
i=2013 #year

networks<- network(amperiod2(i-4,i,0,1,1), directed=TRUE)

### prepare covariates
# prepare alliance data

alliance<- network(amperiod2(i-4,i,0,2))


# prepare capital distance data

capdist<- network(amperiod2(i-4,i,0,23))


# prepare polity IV data

pol<- network(amperiod2(i-4,i,0,6))

# prepare path dependency data

patd<-network(amperiod2(i-4,i,0,25))


# prepare CINC data
mica<-amperiod2(i-4,i,0,8)    
networks<- set.vertex.attribute(networks,"MiC", mica)

mica2<-amperiod2(i-4,i,0,19)    
networks<- set.vertex.attribute(networks,"MiC2", mica2)


# prepare conflict data
conf<-amperiod2(i-4,i,0,10)    
networks<- set.vertex.attribute(networks,"CO", conf)


# prepare GDP data
bi<-amperiod2(i-4,i,0,22)
bi[bi==0]<-1
bi<-log(bi)
networks<- set.vertex.attribute(networks,"GDP", bi)



model<- ergm(networks~edges+ 
               gwodegree(1, fixed=TRUE)+
               gwidegree(1, fixed=TRUE)+
               mutual+
               gwesp(1.5, fixed=TRUE)+
               edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
               edgecov(capdist)+edgecov(pol)+ 
               edgecov(patd)+
               nodeicov('CO')+
               nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")

# observed statistics
gf.obs <- summary(networks~edges+ 
                    gwodegree(1, fixed=TRUE)+
                    gwidegree(1, fixed=TRUE)+
                    mutual+
                    gwesp(1.5, fixed=TRUE)+
                    edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
                    edgecov(capdist)+edgecov(pol)+ 
                    edgecov(patd)+
                    nodeicov('CO')+
                    nodeicov('MiC')+nodeocov('MiC'))

set.seed(1)
net.mple <- simulate(model, nsim=500, control=control.simulate.ergm( MCMC.interval=10000))

gof.results.2013<- matrix(0, 14, 500)
for(i in 1:500){
  print(i)
  
  gf <- summary(net.mple[[i]]~edges+ 
                  gwodegree(1, fixed=TRUE)+
                  gwidegree(1, fixed=TRUE)+
                  mutual+
                  gwesp(1.5, fixed=TRUE)+
                  edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
                  edgecov(capdist)+edgecov(pol)+ 
                  edgecov(patd)+
                  nodeicov('CO')+
                  nodeicov('MiC')+nodeocov('MiC'))
  gof.results.2013[,i]<- gf
}

# plotting

par(mfrow=c(2,3), oma=c(0,0,2,0))
hist(gof.results.2013[1,], main="Edges", xlab="Edges", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[1], col="red", lwd=2)


hist(gof.results.2013[2,], main="GW-Outdegree",  xlab="GW-Oudegree", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[2], col="red", lwd=2)

hist(gof.results.2013[3,], main="GW-Indegree", xlab="GW-Indegree", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[3], col="red", lwd=2)

hist(gof.results.2013[5,], main="GWESP", xlab="GWESP", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[5], col="red", lwd=2)

hist(gof.results.2013[6,], main="Alliance", xlab="Alliance", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[6], col="red", lwd=2)

hist(gof.results.2013[8,], main="GDP Importer", xlab="GDP Importer", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[8], col="red", lwd=2)

title("Degeneracy Check 2013", outer=TRUE, cex.main=3)



####################################################
### test with Triangles=> degenerates



i=1970 #year

networks<- network(amperiod2(i-4,i,0,1,0.5), directed=TRUE)

### prepare covariates
# prepare alliance data

alliance<- network(amperiod2(i-4,i,0,2))


# prepare capital distance data

capdist<- network(amperiod2(i-4,i,0,23))


# prepare polity IV data

pol<- network(amperiod2(i-4,i,0,6))

# prepare path dependency data

patd<-network(amperiod2(i-4,i,0,25))


# prepare CINC data
mica<-amperiod2(i-4,i,0,8)    
networks<- set.vertex.attribute(networks,"MiC", mica)


# prepare conflict data
conf<-amperiod2(i-4,i,0,10)    
networks<- set.vertex.attribute(networks,"CO", conf)


# prepare GDP data
bi<-amperiod2(i-4,i,0,22)
bi[bi==0]<-1
bi<-log(bi)
networks<- set.vertex.attribute(networks,"GDP", bi)



model<- ergm(networks~edges+
               gwodegree(1, fixed=TRUE)+
               gwidegree(1, fixed=TRUE)+
               mutual+
               triangles+
               edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
               edgecov(capdist)+edgecov(pol)+ 
               edgecov(patd)+
               nodeicov('CO')+
               nodeicov('MiC')+nodeocov('MiC'), estimate="MPLE")

# observed statistics
# observed statistics
gf.obs <- summary(networks~edges+ 
                    gwodegree(1, fixed=TRUE)+
                    gwidegree(1, fixed=TRUE)+
                    mutual+
                    triangles+
                    edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
                    edgecov(capdist)+edgecov(pol)+ 
                    edgecov(patd)+
                    nodeicov('CO')+
                    nodeicov('MiC')+nodeocov('MiC'))

set.seed(1)
net.mple <- simulate(model, nsim=500, control=control.simulate.ergm( MCMC.interval=10000))

gof.results.1970<- matrix(0, 14, 500)
for(i in 1:500){
  print(i)
  
  gf <- summary(net.mple[[i]]~edges+ 
                  gwodegree(1, fixed=TRUE)+
                  gwidegree(1, fixed=TRUE)+
                  mutual+
                  triangles+
                  edgecov(alliance)+  nodeocov('GDP')+ nodeicov('GDP')+
                  edgecov(capdist)+edgecov(pol)+ 
                  edgecov(patd)+
                  nodeicov('CO')+
                  nodeicov('MiC')+nodeocov('MiC'))
  gof.results.1970[,i]<- gf
}



par(mfrow=c(2,3), oma=c(0,1,2,0))
hist(gof.results.1970[1,], main="Edges", xlab="Edges", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[1], col="red", lwd=2)


hist(gof.results.1970[2,], main="GW-Outdegree",  xlab="GW-Outdegree", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[2], col="red", lwd=2)

hist(gof.results.1970[3,], main="GW-Indegree", xlab="GW-Indegree", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[3], col="red", lwd=2)

hist(gof.results.1970[5,], main="Triangles", xlab="Triangles", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[5], col="red", lwd=2)

hist(gof.results.1970[6,], main="Alliance", xlab="Alliance", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[6], col="red", lwd=2)

hist(gof.results.1970[8,], main="GDP Importer", xlab="GDP Importer", cex.lab=1.6, cex.axis=2, cex.main=2)
abline(v=gf.obs[8], col="red", lwd=2)

title("Degeneracy Check 1970 with Triangles", outer=TRUE, cex.main=3)

