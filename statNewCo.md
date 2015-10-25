State-wise statistics for new companies on India map
========================================================
author: Urvesh Devani 
date: 10/25/2015
width: 1440
height: 1050

Goal
========================================================
- Explore Indian States for newly registered companies 2013-2014, on the map
- The base data for such maps, the "polygons" that define the country, the states, the districts and even the talukas ( or sub-divisions) is available from an organisation called Global Administrative Areas or gadm.org
- Here, India level 1 polygon data is downloaded 
- Statistics data is downloaded from 

https://data.gov.in/catalog/registration-new-companies-region-state-wise-distribution 

- Various parameters include Public, private companies and respective authorized capital amount 

Let us explore the data
========================================================


```r
NRCdata <- read.csv("data/NRC.csv")
totalRows <- grep("total", NRCdata$State, ignore.case = TRUE)
NRCdata <- NRCdata[-totalRows,]
NRCdata <- NRCdata[order(NRCdata$State), ]
head(NRCdata)
```

```
            Region             State No..of.Companies...Public
31 SOUTHERN REGION     A & N Islands                         2
32 SOUTHERN REGION    Andhra Pradesh                        82
11  EASTERN REGION Arunachal Pradesh                         1
12  EASTERN REGION             Assam                        24
13  EASTERN REGION             Bihar                       128
8  NORTHERN REGION        Chandigarh                        13
   Authorized.Capital...Public No..of.Companies...Private
31                        2.05                         31
32                      151.39                       7093
11                        0.05                         27
12                        9.85                        319
13                       74.31                       2238
8                         3.10                        632
   Authorized.Capital...Private No..of.Companies...Total
31                         6.52                       33
32                      3065.36                     7175
11                        29.76                       28
12                       106.73                      343
13                       271.31                     2366
8                         59.70                      645
   Authorized.Capital...Total
31                       8.57
32                    3216.75
11                      29.81
12                     116.58
13                     345.62
8                       62.80
```

List of states for which info is available
========================================================


```
 [1] A & N Islands     Andhra Pradesh    Arunachal Pradesh
 [4] Assam             Bihar             Chandigarh       
 [7] Chhatisgarh       Dadar & N. Haveli Daman & Diu      
[10] Delhi             Goa               Gujarat          
[13] Haryana           Himachal Pradesh  Jammu & Kashmir  
[16] Jharkhand         Karnataka         Kerala           
[19] Lakshadweep       Madhya Pradesh    Maharashtra      
[22] Manipur           Meghalaya         Mizoram          
[25] Nagaland          Odisha            Puducherry       
[28] Punjab            Rajasthan         Tamil Nadu       
[31] Tripura           Uttar Pradesh     Uttrakhand       
[34] West Bengal      
36 Levels: A & N Islands Andhra Pradesh Arunachal Pradesh Assam ... West Bengal
```

Thank you & links
========================================================

Documentation : Documenation for usage is available on app

App: https://urveshdevani.shinyapps.io/statsNewCompany

Github Repo: https://github.com/urveshdev/StatNewCos 
