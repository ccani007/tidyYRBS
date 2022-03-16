* Encoding: UTF-8.
* This SPSS syntax file reads ASCII format (text format) 2019 SADC data and creates a formatted 
and labeled SPSS data file that you can analyze in SPSS.
 
* Change the file location specifications from 'c:\sadc2019' to the location where you 
downloaded, unzipped, and stored the 2019 SADC ASCII data file before you run this syntax; 
Change the location specification in three places - in the 'data list' statement at the top 
of the syntax and in the 'save' and 'get' statements at the end of this syntax file.

* Change 'xxxxxxx' in the 'data list' statement and the 'save' and 'get' statements at the 
end of this syntax file to 'national', 'district', 'state_a_m', or 'state_n_z' depending on which 
file you are analyzing.   

DATA LIST FILE="/Users/catalina/GitHub/tidyYRBS/inst/extData/sadc_hs_2019_district.sav"/
sitecode 1-5 (A) sitename 6-55 (A) sitetype 56-105 (A) sitetypenum 106-113
year 114-121 survyear 122-124 weight 125-134 stratum 135-142
PSU 143-150 record 151-158 age 159-161 sex 162-164 grade 165-167
race4 168-170 race7 171-173 stheight 174-181 stweight 182-189
bmi 190-197 bmipct 198-205 qnobese 206-208 qnowt 209-211 
q66 212-212 (A) q65 213-213 (A) sexid 214-221 sexid2 222-229 sexpart 230-237 sexpart2 238-245
q8 246-246 (A) q9 247-247 (A) q10 248-248 (A)
q11 249-249 (A) q12 250-250 (A) q13 251-251 (A)
q14 252-252 (A) q15 253-253 (A) q16 254-254 (A)
q17 255-255 (A) q18 256-256 (A) q19 257-257 (A)
q20 258-258 (A) q21 259-259 (A) q22 260-260 (A)
q23 261-261 (A) q24 262-262 (A) q25 263-263 (A)
q26 264-264 (A) q27 265-265 (A) q28 266-266 (A)
q29 267-267 (A) q30 268-268 (A) q31 269-269 (A)
q32 270-270 (A) q33 271-271 (A) q34 272-272 (A)
q35 273-273 (A) q36 274-274 (A) q37 275-275 (A)
q38 276-276 (A) q39 277-277 (A) q40 278-278 (A)
q41 279-279 (A) q42 280-280 (A) q43 281-281 (A)
q44 282-282 (A) q45 283-283 (A) q46 284-284 (A)
q47 285-285 (A) q48 286-286 (A) q49 287-287 (A)
q50 288-288 (A) q51 289-289 (A) q52 290-290 (A)
q53 291-291 (A) q54 292-292 (A) q55 293-293 (A)
q56 294-294 (A) q57 295-295 (A) q58 296-296 (A)
q59 297-297 (A) q60 298-298 (A) q61 299-299 (A)
q62 300-300 (A) q63 301-301 (A) q64 302-302 (A)
q67 303-303 (A) q68 304-304 (A) q69 305-305 (A)
q70 306-306 (A) q71 307-307 (A) q72 308-308 (A)
q73 309-309 (A) q74 310-310 (A) q75 311-311 (A)
q76 312-312 (A) q77 313-313 (A) q78 314-314 (A)
q79 315-315 (A) q80 316-316 (A) q81 317-317 (A)
q82 318-318 (A) q83 319-319 (A) q84 320-320 (A)
q85 321-321 (A) q86 322-322 (A) q87 323-323 (A)
q88 324-324 (A) q89 325-325 (A)
qn8 326-328 qn9 329-331 qn10 332-334
qn11 335-337 qn12 338-340 qn13 341-343 
qn14 344-346 qn15 347-349 qn16 350-352
qn17 353-355 qn18 356-358 qn19 359-361 
qn20 362-364 qn21 365-367 qn22 368-370 
qn23 371-373 qn24 374-376 qn25 377-379 
qn26 380-382 qn27 383-385 qn28 386-388 
qn29 389-391 qn30 392-394 qn31 395-397 
qn32 398-400 qn33 401-403 qn34 404-406 
qn35 407-409 qn36 410-412 qn37 413-415 
qn38 416-418 qn39 419-421 qn40 422-424
qn41 425-427 qn42 428-430 qn43 431-433 
qn44 434-436 qn45 437-439 qn46 440-442 
qn47 443-445 qn48 446-448 qn49 449-451 
qn50 452-454 qn51 455-457 qn52 458-460 
qn53 461-463 qn54 464-466 qn55 467-469 
qn56 470-472 qn57 473-475 qn58 476-478 
qn59 479-481 qn60 482-484 qn61 485-487 
qn62 488-490 qn63 491-493 qn64 494-496 
qn67 497-499 qn68 500-502 qn69 503-505 
qn70 506-508 qn71 509-511 qn72 512-514 
qn73 515-517 qn74 518-520 qn75 521-523 
qn76 524-526 qn77 527-529 qn78 530-532 
qn79 533-535 qn80 536-538 qn81 539-541 
qn82 542-544 qn83 545-547 qn84 548-550 
qn85 551-553 qn86 554-556 qn87 557-559 
qn88 560-562 qn89 563-565 
qnfrcig 566-568 qndaycig 569-571 qnfrevp 572-574
qndayevp 575-577 qnfrcgr 578-585 qndaycgr 586-593
qntb2 594-596 qntb3 597-599 qntb4 600-602
qntb5 603-605 qniudimp 606-608 qnothhpl 609-611
qndualbc 612-614 qnbcnone 615-617 qnfr0 618-620
qnfr1 621-623 qnfr2 624-626 qnveg0 627-629
qnveg1 630-632 qnveg2 633-635 qnveg3 636-638
qnsoda1 639-641 qnsoda2 642-644 qnmilk1 645-647
qnmilk3 648-650 qnbk7day 651-653 qnpa0day 654-656
qnpa7day 657-659 qndlype 660-662 qnnodnt 663-665
qbikehelmet 666-666 (A) qdrivemarijuana 667-667 (A) qcelldriving 668-668 (A)
qpropertydamage 669-669 (A) qbullyweight 670-670 (A) qbullygender 671-671 (A)
qbullygay 672-672 (A) qchokeself 673-673 (A) qcigschool 674-674 (A)
qchewtobschool 675-675 (A) qalcoholschool 676-676 (A) qtypealcohol2 677-677 (A)
qhowmarijuana 678-678 (A) qmarijuanaschool 679-679 (A) qcurrentopioid 680-680 (A)
qcurrentcocaine 681-681 (A) qcurrentheroin 682-682 (A) qcurrentmeth 683-683 (A)
qhallucdrug 684-684 (A) qprescription30d 685-685 (A) qgenderexp 686-686 (A)
qtaughtHIV 687-687 (A) qtaughtsexed 688-688 (A) qtaughtstd 689-689 (A)
qtaughtcondom 690-690 (A) qtaughtbc 691-691 (A) qdietpop 692-692 (A) 
qcoffeetea 693-693 (A) qsportsdrink 694-694 (A) qenergydrink 695-695 (A) 
qsugardrink 696-696 (A) qwater 697-697 (A) qfastfood 698-698 (A) 
qfoodallergy 699-699 (A) qwenthungry 700-700 (A) qmusclestrength 701-701 (A) 
qsunscreenuse 702-702 (A) qindoortanning 703-703 (A) qsunburn 704-704 (A) 
qconcentrating 705-705 (A) qcurrentasthma 706-706 (A) qwheresleep 707-707 (A) 
qspeakenglish 708-708 (A) qtransgender 709-709 (A) 
qnbikehelmet 710-712 qndrivemarijuana 713-715 qncelldriving 716-718
qnpropertydamage 719-721 qnbullyweight 722-724
qnbullygender 725-727 qnbullygay 728-730 qnchokeself 731-733
qncigschool 734-736 qnchewtobschool 737-739 qnalcoholschool 740-742
qntypealcohol2 743-745 qnhowmarijuana 746-748 qnmarijuanaschool 749-751
qncurrentopioid 752-754 qncurrentcocaine 755-757 qncurrentheroin 758-760
qncurrentmeth 761-763 qnhallucdrug 764-766 qnprescription30d 767-769
qnillict 770-772 qngenderexp 773-775 qntaughtHIV 776-778
qntaughtsexed 779-781 qntaughtstd 782-784 qntaughtcondom 785-787
qntaughtbc 788-790 qndietpop 791-793 qncoffeetea 794-796
qnsportsdrink 797-799 qnspdrk1 800-802 qnspdrk2 803-805
qnenergydrink 806-808 qnsugardrink 809-811 qnwater 812-814
qnwater1 815-817 qnwater2 818-820 qnwater3 821-823 qnfastfood 824-826
qnfoodallergy 827-829 qnwenthungry 830-832 qnmusclestrength 833-835
qnsunscreenuse 836-838 qnindoortanning 839-841 qnsunburn 842-844
qnconcentrating 845-847 qncurrentasthma 848-850 qnwheresleep 851-853
qnspeakenglish 854-856 qntransgender 857-859.
EXECUTE.
 
VARIABLE LABELS
sitecode "Site code"
sitename "Site name"
sitetype "Site type"
sitetypenum "1=District, 2=State, 3=National"
year "4-digit Year of survey"
survyear "1=1991...15=2019"
weight "Analysis weight"
stratum "Analysis stratum"
PSU "Analysis primary sampling unit"
record "Record ID"
age "1= <=12...7=18+ years old"
sex "1=Female, 2=Male"
grade "1=9th...4=12th grade"
race4 "4-level race variable"
race7 "7-level race variable"
stheight "Height in meters"
stweight "Weight in kilograms"
bmi "Body Mass Index"
bmipct "BMI percentile"
qnobese "Had obesity"
qnowt "Were Overweight"
q66 "Sexual identity"
q65 "Sex of sexual contacts"
sexid "Sexual identity"
sexid2 "Collapsed sexual identity"
sexpart "Sex of sex contact(s)"
sexpart2 "Collapsed sex of sex contact(s)"
q8 "Seat belt use"
q9 "Riding with a drinking driver"
q10 "Drinking and driving"
q11 "Texting and driving"
q12 "Weapon carrying"
q13 "Weapon carrying at school"
q14 "Gun carrying past 12 mos"
q15 "Safety concerns at school"
q16 "Threatened at school"
q17 "Physical fighting"
q18 "Physical fighting at school"
q19 "Forced sexual intercourse"
q20 "Sexual violence"
q21 "Sexual dating violence"
q22 "Physical dating violence"
q23 "Bullying at school"
q24 "Electronic bullying"
q25 "Sad or hopeless"
q26 "Considered suicide"
q27 "Made a suicide plan"
q28 "Attempted suicide"
q29 "Injurious suicide attempt"
q30 "Ever cigarette use"
q31 "Initiation of cigarette smoking"
q32 "Current cigarette use"
q33 "Smoked >10 cigarettes"
q34 "Electronic vapor product use"
q35 "Current electronic vapor product use"
q36 "EVP from store"
q37 "Current smokeless tobacco use"
q38 "Current cigar use"
q39 "All tobacco product cessation"
q40 "Initiation of alcohol use"
q41 "Current alcohol use"
q42 "Current binge drinking"
q43 "Largest number of drinks"
q44 "Source of alcohol"
q45 "Ever marijuana use"
q46 "Initiation of marijuana use"
q47 "Current marijuana use"
q48 "Ever synthetic marijuana use"
q49 "Ever prescription pain medicine use"
q50 "Ever cocaine use"
q51 "Ever inhalant use"
q52 "Ever heroin use"
q53 "Ever methamphetamine use"
q54 "Ever ecstasy use"
q55 "Ever steroid use"
q56 "Illegal injected drug use"
q57 "Illegal drugs at school"
q58 "Ever sexual intercourse"
q59 "Sex before 13 years"
q60 "Multiple sex partners"
q61 "Current sexual activity"
q62 "Alcohol/drugs and sex"
q63 "Condom use"
q64 "Birth control pill use"
q67 "Perception of weight"
q68 "Weight loss"
q69 "Fruit juice drinking"
q70 "Fruit eating"
q71 "Green salad eating"
q72 "Potato eating"
q73 "Carrot eating"
q74 "Other vegetable eating"
q75 "No soda drinking"
q76 "No milk drinking"
q77 "Breakfast eating"
q78 "Physical activity >= 5 days"
q79 "Television watching"
q80 "Computer use"
q81 "PE attendance"
q82 "Sports team participation"
q83 "Concussion"
q84 "HIV testing"
q85 "STD testing"
q86 "Oral health care"
q87 "Asthma"
q88 "Sleep"
q89 "Grades in school"
qn8 "Rarely or never wore a seat belt"
qn9 "Rode with a driver who had been drinking alcohol"
qn10 "Drove when drinking alcohol"
qn11 "Texted or e-mailed while driving a car or other vehicle"
qn12 "Carried a weapon"
qn13 "Carried a weapon on school property"
qn14 "Carried a gun"
qn15 "Did not go to school because they felt unsafe at school or on their way to or from school"
qn16 "Were threatened or injured with a weapon on school property"
qn17 "Were in a physical fight"
qn18 "Were in a physical fight on school property"
qn19 "Were ever physically forced to have sexual intercourse"
qn20 "Experienced sexual violence"
qn21 "Experienced sexual dating violence"
qn22 "Experienced physical dating violence"
qn23 "Were bullied on school property"
qn24 "Were electronically bullied"
qn25 "Felt sad or hopeless"
qn26 "Seriously considered attempting suicide"
qn27 "Made a plan about how they would attempt suicide"
qn28 "Attempted suicide"
qn29 "Had a suicide attempt that resulted in an injury, poisoning, or overdose that had to be treated by a doctor or nurse"
qn30 "Ever tried cigarette smoking"
qn31 "First tried cigarette smoking before age 13 years"
qn32 "Currently smoked cigarettes"
qn33 "Smoked more than 10 cigarettes per day"
qn34 "Ever used an electronic vapor product"
qn35 "Currently used an electronic vapor product"
qn36 "Usually got their own electronic vapor products by buying them in a store"
qn37 "Currently used smokeless tobacco"
qn38 "Currently smoked cigars"
qn39 "Tried to quit using all tobacco products"
qn40 "Had their first drink of alcohol before age 13 years"
qn41 "Currently drank alcohol"
qn42 "Currently were binge drinking"
qn43 "Reported that the largest number of drinks they had in a row was 10 or more"
qn44 "Usually got the alcohol they drank by someone giving it to them"
qn45 "Ever used marijuana"
qn46 "Tried marijuana for the first time before age 13 years"
qn47 "Currently used marijuana"
qn48 "Ever used synthetic marijuana"
qn49 "Ever took prescription pain medicine without a doctor's prescription or differently than how a doctor told them to use it"
qn50 "Ever used cocaine"
qn51 "Ever used inhalants"
qn52 "Ever used heroin"
qn53 "Ever used methamphetamines"
qn54 "Ever used ecstasy"
qn55 "Ever took steroids without a doctor's prescription"
qn56 "Ever injected any illegal drug"
qn57 "Were offered, sold, or given an illegal drug on school property"
qn58 "Ever had sexual intercourse"
qn59 "Had sexual intercourse for the first time before age 13 years"
qn60 "Had sexual intercourse with four or more persons during their life"
qn61 "Were currently sexually active"
qn62 "Drank alcohol or used drugs before last sexual intercourse"
qn63 "Used a condom during last sexual intercourse"
qn64 "Used birth control pills before last sexual intercourse"
qn67 "Described themselves as slightly or very overweight"
qn68 "Were trying to lose weight"
qn69 "Did not drink fruit juice"
qn70 "Did not eat fruit"
qn71 "Did not eat green salad"
qn72 "Did not eat potatoes"
qn73 "Did not eat carrots"
qn74 "Did not eat other vegetables"
qn75 "Did not drink a can, bottle, or glass of soda or pop"
qn76 "Did not drink milk"
qn77 "Did not eat breakfast"
qn78 "Were physically active at least 60 minutes per day on 5 or more days"
qn79 "Watched television 3 or more hours per day"
qn80 "Played video or computer games or used a computer 3 or more hours per day"
qn81 "Attended physical education (PE) classes on 1 or more days"
qn82 "Played on at least one sports team"
qn83 "Had a concussion from playing a sport or being physically active"
qn84 "Were ever tested for human immunodeficiency virus (HIV)"
qn85 "Were ever testing for an STD"
qn86 "Saw a dentist"
qn87 "Had ever been told by a doctor or nurse that they had asthma"
qn88 "Got 8 or more hours of sleep"
qn89 "Described their grades in school as mostly A's or B's"
qnfrcig "Currently smoked cigarettes frequently"
qndaycig "Currently smoked cigarettes daily"
qnfrevp "Currently used an electronic vapor product frequently"
qndayevp "Currently used an elecctronic vapor product daily"
qnfrcgr "Currently smoked cigars frequently"
qndaycgr "Currently smoked cigars daily"
qntb2 "Currently smoked cigarettes or cigars"
qntb3 "Currently smoked cigarettes or cigars or used smokeless tobacco"
qntb4 "Currently smoked cigarettes or cigars or used smokeless tobacco or electronic vapor products"
qntb5 "Currently smoked cigarettes or used electronic vapor products"
qniudimp "Used an IUD (e.g., Mirena or ParaGard) or implant (e.g., Implanon or Nexplanon) before last sexual intercourse"
qnothhpl "Used birth control pills; an IUD (such as Mirena or ParaGard) or implant (such as Implanon or Nexplanon); or a shot (such as Depo-Provera), patch (such as OrthoEvra), or birth control ring (such as NuvaRing) before last sexual intercourse"
qndualbc "Used both a condom during last sexual intercourse and birth control pills; an IUD  or implant (such as Implanon or Nexplanon); or a shot (such as Depo-Provera), patch (such as OrthoEvra), or birth control ring (such as NuvaRing)"
qnbcnone "Did not use any method to prevent pregnancy during last sexual intercourse"
qnfr0 "Did not eat fruit or drink 100% fruit juices"
qnfr1 "Ate fruit or drank 100% fruit juices one or more times per day"
qnfr2 "Ate fruit or drank 100% fruit juices two or more times per day"
qnveg0 "Did not eat vegetables"
qnveg1 "Ate vegetables one or more times per day"
qnveg2 "Ate vegetables two or more times per day"
qnveg3 "Ate vegetables three or more times per day"
qnsoda1 "Drank a can, bottle, or glass of soda or pop one or more times per day"
qnsoda2 "Drank a can, bottle, or glass of soda or pop two or more times per day"
qnmilk1 "Drank one or more glasses per day of milk"
qnmilk3 "Drank three or more glasses per day of milk"
qnbk7day "Ate breakfast on all 7 days"
qnpa0day "Did not participate in at least 60 minutes of physical activity on at least 1 day"
qnpa7day "Were physically active at least 60 minutes per day on all 7 days"
qndlype "Attended physical education (PE) classes on all 5 days"
qnnodnt "Never saw a dentist"
qbikehelmet "Bicycle helmet use"
qdrivemarijuana "Drive when using marijuana"
qcelldriving "Cell phone use while driving"
qpropertydamage "Property stolen at school >= 1 time"
qbullyweight "Victim of teasing b/c of physical appearance"
qbullygender "Victim of gender teasing"
qbullygay "Ever been teased b/c labeled GLB"
qchokeself "Ever been choked/choked self on purpose"
qcigschool "Currently smoke at school >=1 days"
qchewtobschool "Current snuff @ school"
qalcoholschool "Current drink at school"
qtypealcohol2 "Type of alcohol drink most often"
qhowmarijuana "Usual use of marijuana"
qmarijuanaschool "Marijuana use at school"
qcurrentopioid "Times take pain medicine w/o prescription 30d"
qcurrentcocaine "Current cocaine use"
qcurrentheroin "Current heroin use"
qcurrentmeth "Current meth use"
qhallucdrug "Ever used hallucinogenic drugs"
qprescription30d "Times take drug w/o prescription 30d"
qgenderexp "Others description of your masc/fem"
qtaughtHIV "Ever taught about AIDS/HIV at school"
qtaughtsexed "Ever had sex education in school"
qtaughtstd "Ever been taught in school about STDs"
qtaughtcondom "Ever been taught in school about how to use condom"
qtaughtbc "Ever been taught about BC methods in sch"
qdietpop "Diet soda drinking >=1 time/day"
qcoffeetea "Coffee/tea drinking >=1 time/day"
qsportsdrink "Sports drinks"
qenergydrink "Energy drink >=1 time/day"
qsugardrink "Sugar-sweetened beverage >=1 time/day"
qwater "Plain water"
qfastfood "Meal/snack fast food >= 3 days"
qfoodallergy "Food allergies"
qwenthungry "How often went hungry"
qmusclestrength "Muscle strengthening"
qsunscreenuse "Sunscreen use outside"
qindoortanning "Indoor tanning"
qsunburn "Sunburn"
qconcentrating "Difficulty concentrating"
qcurrentasthma "Current asthma"
qwheresleep "Homelessness"
qspeakenglish "How well speak English"
qtransgender "Transgender"
qnbikehelmet "Rarely or never wore a bicycle helmet"
qndrivemarijuana "Drove a car or other vehicle when they had been using marijuana"
qncelldriving "Talked on a cell phone use while driving"
qnpropertydamage "Reported that their property had been stolen or deliberately damaged on school property one or more times"
qnbullyweight "Have been the victim of teasing or name calling because of their weight, size, or physical appearance"
qnbullygender "Have been the victim of teasing or name calling because of their gender"
qnbullygay "Have been the victim of teasing or name calling because someone thought they were gay, lesbian, or bisexual"
qnchokeself "Have ever been choked by someone or tried to choke themselves on purpose"
qncigschool "Smoked cigarettes on school property"
qnchewtobschool "Used chewing tobacco, snuff, or dip on school property"
qnalcoholschool "Currently had at least one drink of alcohol on school property"
qntypealcohol2 "Reported liquor as the type of alcohol they drank most often"
qnhowmarijuana "Usually used marijuana by smoking it in a joint, bong, pipe, or blunt"
qnmarijuanaschool "Used marijuana on school property"
qncurrentopioid "Currently took prescription pain medicine without a doctor's prescription"
qncurrentcocaine "Currently used any form of cocaine"
qncurrentheroin "Currently used heroin"
qncurrentmeth "Currently used methamphetamines"
qnhallucdrug "Ever used hallucinogenic drugs"
qnprescription30d "Currently took a prescription drug without a doctor's prescription"
qnillict "Ever used select illicit drugs"
qngenderexp "Think other people at school would describe them as equally feminine and masculine"
qntaughtHIV "Have been taught about AIDS or HIV infection in school"
qntaughtsexed "Have had sex education in school"
qntaughtstd "Have been taught in school about sexually transmitted diseases (STDs)"
qntaughtcondom "Have ever been taught in school about how to use a condom to prevent pregnancy or sexually transmitted diseases (STDs)"
qntaughtbc "Have been taught in school about birth control methods"
qndietpop "Drank a can, bottle, or glass of diet soda or pop"
qncoffeetea "Drank a cup, can, or bottle of coffee, coffee drinks, or any kind of tea"
qnsportsdrink "Did not drink a can, bottle, or glass of a sports drink"
qnspdrk1 "Drank a can, bottle, or glass of a sports drink one or more times per day"
qnspdrk2 "Drank a can, bottle, or glass of a sports drink two or more times per day"
qnenergydrink "Drank a can, bottle, or glass of an energy drink"
qnsugardrink "Drank a can, bottle, or glass of a sugar-sweetened beverage"
qnwater "Did not drink a bottle or glass of plain water"
qnwater1 "Drank one or more glasses per day of plain water"
qnwater2 "Drank two or more glasses per day of plain water"
qnwater3 "Drank three or more glasses per day of plain water"
qnfastfood "Ate at least one meal or snack from a fast food restaurant"
qnfoodallergy "Have to avoid some foods because eating the food could cause an allergic reaction"
qnwenthungry "Most of the time or always went hungry because there was not enough food in their home"
qnmusclestrength "Did exercises to strengthen or tone their muscles on three or more days"
qnsunscreenuse "Most of the time or always wear sunscreen"
qnindoortanning "Used an indoor tanning device"
qnsunburn "Had a sunburn"
qnconcentrating "Have serious difficulty concentrating, remembering, or making decisions"
qncurrentasthma "Had been told by a doctor or nurse that they had asthma and who still have asthma"
qnwheresleep "Usually slept in the home of a friend, family member, or other person because they had to leave their home or their parent or guardian could not afford housing"
qnspeakenglish "Speak English well or very well"
qntransgender "Are transgender".
 
VALUE LABELS
sitecode
"AB" "Albuquerque, NM" 
"AK" "Alaska"
"AL" "Alabama"
"AR" "Arkansas"
"AZB" "Arizona"
"CA" "California"
"CC" "Clark County, NV"
"CE" "Cleveland, OH"
"CH" "Chicago, IL"
"CM" "Charlotte-Mecklenburg County, NC"
"CO" "Colorado"
"CT" "Connecticut"
"DA" "Dallas, TX"
"DE" "Delaware"
"DU" "Duval County, FL"
"EA" "Eaton Consortium, MI"
"FL" "Florida"
"FT" "Broward County, FL"
"FW" "Fort Worth, TX"
"GA" "Georgia"
"GE" "Genesee Consortium, MI"
"GS" "Gaston County, NC"
"HI" "Hawaii"
"HL" "Hillsborough County, FL"
"IA" "Iowa"
"ID" "Idaho"
"IL" "Illinois"
"KS" "Kansas"
"KY" "Kentucky"
"LA" "Louisiana"
"LO" "Los Angeles, CA"
"MD" "Maryland"
"ME" "Maine"
"MI" "Michigan"
"ML" "Milwaukee, WI"
"MM" "Miami-Dade County, FL"
"MO" "Missouri"
"MS" "Mississippi"
"MT" "Montana"
"NC" "North Carolina"
"ND" "North Dakota"
"NE" "Nebraska"
"NH" "New Hampshire"
"NJ" "New Jersey"
"NM" "New Mexico"
"NO" "New Orleans, LA"
"NV" "Nevada"
"NW" "Newark, NJ"
"NY" "New York"
"NYC" "New York City, NY"
"NYG" "Borough of Bronx, NY"
"NYH" "Borough of Brooklyn, NY"
"NYI" "Borough of Manhattan, NY"
"NYJ" "Borough of Queens, NY"
"NYK" "Borough of Staten Island, NY"
"OA" "Oakland, CA"
"OK" "Oklahoma"
"OL" "Orange County, FL"
"PA" "Pennsylvania"
"PB" "Palm Beach County, FL"
"PH" "Philadelphia, PA"
"PO" "Portland, OR"
"PS" "Pasco County, FL"
"RI" "Rhode Island"
"SA" "San Diego, CA"
"SB" "San Bernardino, CA"
"SC" "South Carolina"
"SD" "South Dakota"
"SE" "Seattle, WA"
"SF" "San Francisco, CA"
"SP" "Spartanburg County, SC"
"ST" "Shelby County, TN"
"TN" "Tennessee"
"TX" "Texas"
"UT" "Utah"
"VA" "Virginia"
"VT" "Vermont"
"WI" "Wisconsin"
"WV" "West Virginia"
"WY" "Wyoming"
"XX" "United States"
/
age 
1 "12 years old or younger"
2 "13 years old"
3 "14 years old"
4 "15 years old"
5 "16 years old"
6 "17 years old"
7 "18 years old or older"
/
sex 
1 "Female"
2 "Male"
/
grade
1 "9th"
2 "10th"
3 "11th"
4 "12th"
/
race4
1 "White"
2 "Black or African American"
3 "Hispanic/Latino"
4 "All other races"
/
race7
1 "Am Indian / Alaska Native"
2 "Asian"
3 "Black or African American"
4 "Hispanic/Latino"
5 "Native Hawaiian/other PI"
6 "White"
7 "Multiple - Non-Hispanic"
/
sexid 		
1 "Heterosexual"
2 "Gay or Lesbian"
3 "Bisexual"
4 "Not Sure"
/
sexid2		
1 "Heterosexual"
2 "Sexual Minority"
3 "Unsure"
/
sexpart     
1 "Never had sex"
2 "Opposite sex only"
3 "Same sex only"
4 "Both Sexes"
/
sexpart2    
1 "Never had sex"
2 "Opposite sex only"
3 "Same sex only or both sexes"
Q8
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
Q9
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q10
1 "Did not drive"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q11
1 "Did not drive"
2 "0 days"
3 "1 or 2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 to 29 days"
8 "All 30 days"
/
Q12
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q13
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q14
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q15
1 "0 days"
2 "1 day"
3 "2 or 3 days"
4 "4 or 5 days"
5 "6 or more days"
/
Q16
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q17
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q18
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
Q19
1 "Yes"
2 "No"
/
Q20
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q21
1 "Did not date"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q22
1 "Did not date"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
Q23
1 "Yes"
2 "No"
/
Q24
1 "Yes"
2 "No"
/
Q25
1 "Yes"
2 "No"
/
Q26
1 "Yes"
2 "No"
/
Q27
1 "Yes"
2 "No"
/
Q28
1 "0 times"
2 "1 time"
3 "2 or 3 times"
4 "4 or 5 times"
5 "6 or more times"
/
Q29
1 "Did not attempt suicide"
2 "Yes"
3 "No"
/
Q30
1 "Yes"
2 "No"
/
Q31
1 "Never tried cigarette smoking"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q32
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q33
1 "Did not smoke cigarettes"
2 "Less than 1 cigarette"
3 "1 cigarette"
4 "2 to 5 cigarettes"
5 "6 to 10 cigarettes"
6 "11 to 20 cigarettes"
7 "More than 20 cigarettes"
/
Q34
1 "Yes"
2 "No"
/
Q35
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q36
1 "Did not use any vapor products"
2 "Bought them in a store"
3 "I got them on the Internet"
4 "Someone else bought them"
5 "Borrowed them"
6 "A person 18 or older gave me"
7 "Took them from a store"
8 "Some other way"
/
Q37
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q38
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q39
1 "I did not use tobacco products"
2 "Yes"
3 "No"
/
Q40
1 "Never drank alcohol"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q41
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
Q42
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 or more days"
/
Q43
1 "Did not drink in past 30 days"
2 "1 or 2 drinks"
3 "3 drinks"
4 "4 drinks"
5 "5 drinks"
6 "6 or 7 drinks"
7 "8 or 9 drinks"
8 "10 or more drinks"
/
Q44
1 "Did not drink in past 30 days"
2 "Bought in store"
3 "Bought in restaurant"
4 "Bought at public event"
5 "I gave someone money to buy"
6 "Someone gave it to me"
7 "Took from store/family"
8 "Some other way"
/Q45
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 to 99 times"
7 "100 or more times"
/
Q46
1 "Never tried marijuana"
2 "8 years old or younger"
3 "9 or 10 years old"
4 "11 or 12 years old"
5 "13 or 14 years old"
6 "15 or 16 years old"
7 "17 years old or older"
/
Q47
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q48
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q49
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q50
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q51
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q52
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q53
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q54
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q55
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
Q56
1 "0 times"
2 "1 time"
3 "2 or more times"
/
Q57
1 "Yes"
2 "No"
/
Q58
1 "Yes"
2 "No"
/
Q59
1 "Never had sex"
2 "11 years old or younger"
3 "12 years old"
4 "13 years old"
5 "14 years old"
6 "15 years old"
7 "16 years old"
8 "17 years old or older"
/
Q60
1 "Never had sex"
2 "1 person"
3 "2 people"
4 "3 people"
5 "4 people"
6 "5 people"
7 "6 or more people"
/
Q61
1 "Never had sex"
2 "None during past 3 months"
3 "1 person"
4 "2 people"
5 "3 people"
6 "4 people"
7 "5 people"
8 "6 or more people"
/
Q62
1 "Never had sex"
2 "Yes"
3 "No"
/
Q63
1 "Never had sex"
2 "Yes"
3 "No"
/
Q64
1 "Never had sex"
2 "No method was used"
3 "Birth control pills"
4 "Condoms"
5 "IUD or implant"
6 "Shot/patch/birth control ring"
7 "Withdrawal/other method"
8 "Not sure"
/
Q65
1 "Never had sexual contact"
2 "Females"
3 "Males"
4 "Females and males"
/
Q66
1 "Heterosexual (straight)"
2 "Gay or lesbian"
3 "Bisexual"
4 "Not sure"
/
Q67
1 "Very underweight"
2 "Slightly underweight"
3 "About the right weight"
4 "Slightly overweight"
5 "Very overweight"
/
Q68
1 "Lose weight"
2 "Gain weight"
3 "Stay the same weight"
4 "Not trying to do anything"
/
Q69
1 "Did not drink fruit juice"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q70
1 "Did not eat fruit"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q71
1 "Did not eat green salad"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q72
1 "Did not eat potatoes"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q73
1 "Did not eat carrots"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q74
1 "Did not eat other vegetables"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q75
1 "Did not drink soda or pop"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
Q76
1 "Did not drink milk"
2 "1 to 3 glasses"
3 "4 to 6 glasses"
4 "1 glass per day"
5 "2 glasses per day"
6 "3 glasses per day"
7 "4 or more glasses per day"
/
Q77
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
Q78
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
Q79
1 "No TV on average school day"
2 "Less than 1 hour per day"
3 "1 hour per day"
4 "2 hours per day"
5 "3 hours per day"
6 "4 hours per day"
7 "5 or more hours per day"
/
Q80
1 "No playing video/computer game"
2 "Less than 1 hour per day"
3 "1 hour per day"
4 "2 hours per day"
5 "3 hours per day"
6 "4 hours per day"
7 "5 or more hours per day"
/
Q81
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
/
Q82
1 "0 teams"
2 "1 team"
3 "2 teams"
4 "3 or more teams"
/
Q83
1 "0 times"
2 "1 time"
3 "2 times"
4 "3 times"
5 "4 or more times"
/
Q84
1 "Yes"
2 "No"
3 "Not sure"
/
Q85
1 "Yes"
2 "No"
3 "Not sure"
/Q86
1 "During the past 12 months"
2 "Between 12 and 24 months ago"
3 "More than 24 months ago"
4 "Never"
5 "Not sure"
/
Q87
1 "Yes"
2 "No"
3 "Not sure"
/
Q88
1 "4 or less hours"
2 "5 hours"
3 "6 hours"
4 "7 hours"
5 "8 hours"
6 "9 hours"
7 "10 or more hours"
/
Q89
1 "Mostly A's"
2 "Mostly B's"
3 "Mostly C's"
4 "Mostly D's"
5 "Mostly F's"
6 "None of these grades"
7 "Not sure"
/
qbikehelmet
1 "Did not ride a bicycle"
2 "Never wore a helmet"
3 "Rarely wore a helmet"
4 "Sometimes wore a helmet"
5 "Most of the time wore a helmet"
6 "Always wore a helmet"
/
qdrivemarijuana
1 "Did not drive"
2 "0 times"
3 "1 time"
4 "2 or 3 times"
5 "4 or 5 times"
6 "6 or more times"
/
qcelldriving
1 "Did not drive"
2 "0 days"
3 "1 or 2 days"
4 "3 to 5 days"
5 "6 to 9 days"
6 "10 to 19 days"
7 "20 to 29 days"
8 "All 30 days"
/
qpropertydamage
1 "0 times"
2 "1 time"
3 "2 or 3 time"
4 "4 or 5 times"
5 "6 or 7 times"
6 "8 or 9 times"
7 "10 or 11 times"
8 "12 or more times"
/
qbullyweight
1 "Yes"
2 "No"
/
qbullygender
1 "Yes"
2 "No"
/
qbullygay
1 "Yes"
2 "No"
/
qchokeself
1 "Yes"
2 "No"
/
qcigschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qchewtobschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qalcoholschool
1 "0 days"
2 "1 or 2 days"
3 "3 to 5 days"
4 "6 to 9 days"
5 "10 to 19 days"
6 "20 to 29 days"
7 "All 30 days"
/
qtypealcohol2
1 "I did not drink alcohol during the past 30 days"
2 "Beer"
3 "Wine"
4 "Vodka"
5 "Some other liquor"
6 "Flavored alcoholic beverages"
7 "Some other type"
/
qhowmarijuana
1 "Did not use marijuana"
2 "Smoked it"
3 "Ate in food"
4 "Drank in tea or other drink"
5 "Vaporized"
6 "Some other way"
/
qmarijuanaschool
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentopioid
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentcocaine
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentheroin
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qcurrentmeth
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qhallucdrug
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qprescription30d
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qgenderexp
1 "Very feminine"
2 "Mostly feminine"
3 "Somewhat feminine"
4 "Equally feminine and masculine"
5 "Somewhat masculine"
6 "Mostly masculine"
7 "Very masculine"
/
qtaughtHIV
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtsexed
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtstd
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtcondom
1 "Yes"
2 "No"
3 "Not sure"
/
qtaughtbc
1 "Yes"
2 "No"
3 "Not sure"
/
qdietpop
1 "Did not drink diet soda or pop"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qcoffeetea
1 "Did not drink coffee or tes"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qsportsdrink
1 "Did not drink sports drink"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qenergydrink
1 "Did not drink energy drink"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qsugardrink
1 "Did not drink sugar drinks"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qwater
1 "Did not drink water"
2 "1 to 3 times"
3 "4 to 6 times"
4 "1 time per day"
5 "2 times per day"
6 "3 times per day"
7 "4 or more times per day"
/
qfastfood
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
qfoodallergy
1 "Yes"
2 "No"
3 "Not sure"
/
qwenthungry
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
qmusclestrength
1 "0 days"
2 "1 day"
3 "2 days"
4 "3 days"
5 "4 days"
6 "5 days"
7 "6 days"
8 "7 days"
/
qsunscreenuse
1 "Never"
2 "Rarely"
3 "Sometimes"
4 "Most of the time"
5 "Always"
/
qindoortanning
1 "0 times"
2 "1 or 2 times"
3 "3 to 9 times"
4 "10 to 19 times"
5 "20 to 39 times"
6 "40 or more times"
/
qsunburn
1 "0 times"
2 "1 time"
3 "2 times"
4 "3 times"
5 "4 times"
6 "5 or more times"
/
qconcentrating
1 "Yes"
2 "No"
/
qcurrentasthma
1 "I have never had asthma"
2 "Yes"
3 "No"
4 "Not Sure"
/
qwheresleep
1 "Parent's or guardian's home"
2 "Home of friend/family/other"
3 "Shelter or emergency housing"
4 "Motel or hotel"
5 "Car, park, campground"
6 "No usual place to sleep"
7 "Somewhere else"
/
qspeakenglish
1 "Very well"
2 "Well"
3 "Not well"
4 "Not at all"
/
qtransgender
1 "No"
2 "Yes, I am transgender"
3 "Not sure if I am transgender"
4 "DK what question is asking"
/.

MISSING VALUES
sitecode ("     ") sitetypename ("                                                  ")
sitetype ("                                                  ") sitetypenum ("        ")
year ("        ") survyear ("   ") weight ("          ") stratum ("        ")
PSU ("        ") record ("        ") age ("   ") sex ("   ") grade ("   ")
race4 ("   ") race7 ("   ") stheight ("        ") stweight ("        ")
bmi ("        ") bmipct ("        ") qnobese ("   ") qnowt ("   ")
q66 (" ") q65 (" ") sexid ("        ") sexid2 ("        ")
sexpart ("        ") sexpart2 ("        ")
q8 (" ") q9 (" ") q10 (" ") q11 (" ") q12 (" ")
q13 (" ") q14 (" ") q15 (" ") q16 (" ") q17 (" ")
q18 (" ") q19 (" ") q20 (" ") q21 (" ") q22 (" ")
q23 (" ") q24 (" ") q25 (" ") q26 (" ") q27 (" ")
q28 (" ") q29 (" ") q30 (" ") q31 (" ") q32 (" ")
q33 (" ") q34 (" ") q35 (" ") q36 (" ") q37 (" ")
q38 (" ") q39 (" ") q40 (" ") q41 (" ") q42 (" ")
q43 (" ") q44 (" ") q45 (" ") q46 (" ") q47 (" ")
q48 (" ") q49 (" ") q50 (" ") q51 (" ") q52 (" ")
q53 (" ") q54 (" ") q55 (" ") q56 (" ") q57 (" ")
q58 (" ") q59 (" ") q60 (" ") q61 (" ") q62 (" ")
q63 (" ") q64 (" ")                     q67 (" ")
q68 (" ") q69 (" ") q70 (" ") q71 (" ") q72 (" ")
q73 (" ") q74 (" ") q75 (" ") q76 (" ") q77 (" ")
q78 (" ") q79 (" ") q80 (" ") q81 (" ") q82 (" ")
q83 (" ") q84 (" ") q85 (" ") q86 (" ") q87 (" ")
q88 (" ") q89 (" ") 
qn8 ("   ")  qn9 ("   ") qn10 ("   ") qn11 ("   ") qn12 ("   ") 
qn13 ("   ") qn14 ("   ") qn15 ("   ") qn16 ("   ") qn17 ("   ") 
qn18 ("   ") qn19 ("   ") qn20 ("   ") qn21 ("   ") qn22 ("   ") 
qn23 ("   ") qn24 ("   ") qn25 ("   ") qn26 ("   ") qn27 ("   ") 
qn28 ("   ") qn29 ("   ") qn30 ("   ") qn31 ("   ") qn32 ("   ")
qn33 ("   ") qn34 ("   ") qn35 ("   ") qn36 ("   ") qn37 ("   ") 
qn38 ("   ") qn39 ("   ") qn40 ("   ") qn41 ("   ") qn42 ("   ") 
qn43 ("   ") qn44 ("   ") qn45 ("   ") qn46 ("   ") qn47 ("   ") 
qn48 ("   ") qn49 ("   ") qn50 ("   ") qn51 ("   ") qn52 ("   ") 
qn53 ("   ") qn54 ("   ") qn55 ("   ") qn56 ("   ") qn57 ("   ") 
qn58 ("   ") qn59 ("   ") qn60 ("   ") qn61 ("   ") qn62 ("   ")
qn63 ("   ") qn64 ("   ")                           qn67 ("   ")
qn68 ("   ") qn69 ("   ") qn70 ("   ") qn71 ("   ") qn72 ("   ")
qn73 ("   ") qn74 ("   ") qn75 ("   ") qn76 ("   ") qn77 ("   ") 
qn78 ("   ") qn79 ("   ") qn80 ("   ") qn81 ("   ") qn82 ("   ") 
qn83 ("   ") qn84 ("   ") qn85 ("   ") qn86 ("   ") qn87 ("   ") 
qn88 ("   ") qn89 ("   ")
qnfrcig ("   ") qndaycig ("   ") qnfrevp ("   ") qndayevp ("   ") qnfrcgr ("   ")
qndaycgr ("   ") qntb2 ("   ") qntb3 ("   ") qntb4 ("   ") qntb5 ("   ")
qniudimp ("   ") qnothhpl ("   ") qndualbc ("   ") qnbcnone ("   ") qnfr0 ("   ")
qnfr1 ("   ") qnfr2 ("   ") qnveg0 ("   ") qnveg1 ("   ") qnveg2 ("   ")
qnveg3 ("   ") qnsoda1 ("   ") qnsoda2 ("   ") qnmilk1 ("   ") qnmilk3 ("   ")
qnbk7day ("   ") qnpa0day ("   ") qnpa7day ("   ") qndlype ("   ") qnnodnt ("   ")
qbikehelmet (" ") qdrivemarijuana (" ") qcelldriving (" ") qpropertydamage (" ") qbullyweight (" ")
qbullygender (" ") qbullygay (" ") qchokeself (" ") qcigschool (" ") qchewtobschool (" ")
qalcoholschool (" ") qtypealcohol2 (" ") qhowmarijuana (" ") qmarijuanaschool (" ") qcurrentopioid (" ")
qcurrentcocaine (" ") qcurrentheroin (" ") qcurrentmeth (" ") qhallucdrug (" ") qprescription30d (" ") qgenderexp (" ")
qtaughtHIV (" ") qtaughtsexed (" ") qtaughtstd (" ") qtaughtcondom (" ") qtaughtbc (" ")
qdietpop (" ") qcoffeetea (" ") qsportsdrink (" ") qenergydrink (" ") qsugardrink (" ")
qwater (" ") qfastfood (" ") qfoodallergy (" ") qwenthungry (" ") qmusclestrength (" ")
qsunscreenuse (" ") qindoortanning (" ") qsunburn (" ") qconcentrating (" ") qcurrentasthma (" ")
qwheresleep (" ") qspeakenglish (" ") qtransgender (" ") qnbikehelmet ("   ") qndrivemarijuana ("   ")
qncelldriving ("   ") qnpropertydamage ("   ") qnbullyweight ("   ") qnbullygender ("   ") qnbullygay ("   ")
qnchokeself ("   ") qncigschool ("   ") qnchewtobschool ("   ") qnalcoholschool ("   ") qntypealcohol2 ("   ")
qnhowmarijuana ("   ") qnmarijuanaschool ("   ") qncurrentopioid ("   ") qncurrentcocaine ("   ") qncurrentheroin ("   ")
qncurrentmeth ("   ") qnhallucdrug ("   ") qnprescription30d ("   ") qnillict ("   ") qngenderexp ("   ") qntaughtHIV ("   ")
qntaughtsexed ("   ") qntaughtstd ("   ") qntaughtcondom ("   ") qntaughtbc ("   ") qndietpop ("   ")
qncoffeetea ("   ") qnsportsdrink ("   ") qnspdrk1 ("   ") qnspdrk2 ("   ") qnenergydrink ("   ")
qnsugardrink ("   ") qnwater ("   ") qnwater1 ("   ") qnwater2 ("   ") qnwater3 ("   ")
qnfastfood ("   ") qnfoodallergy ("   ") qnwenthungry ("   ") qnmusclestrength ("   ") qnsunscreenuse ("   ")
qnindoortanning ("   ") qnsunburn ("   ") qnconcentrating ("   ") qncurrentasthma ("   ") qnwheresleep ("   ")
qnspeakenglish ("   ") qntransgender ("   ").

Formats stheight stweight (F5.2).
EXECUTE.
SAVE OUTFILE "/Users/catalina/GitHub/tidyYRBS/inst/extData/sadc_hs_2019_district.sav"/
/COMPRESSED.
EXECUTE.

GET FILE="/Users/catalina/GitHub/tidyYRBS/inst/extData/sadc_hs_2019_district.sav"/.
