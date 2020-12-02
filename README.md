# Air-sea-CO2-exchange-publication-repository
Code from the publication: DeJong, Hans B., and Robert B. Dunbar. "Air‐sea CO2 exchange in the Ross Sea, Antarctica." Journal of Geophysical Research: Oceans 122.10 (2017): 8167-8181. (https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2017JC012853)

## Calculating CO2 Flux rates

We obtained in situ pCO2, SST, and salinity underway measurements from the Lamont Doherty Earth Observatory (LDEO) pCO2 database (Takahashi et al., 2009) and continuous shipboard wind speed data (binned by minute) from the Marine Geoscience Data System
(MGDS, http://www.marine-geo.org). All measurements were made on the R/V Nathaniel B. Palmer (NBP). We included data from 20 cruises in the Ross Sea region (160°E – 155°W, 71°S – 79°S) with concurrent pCO2, SST, salinity, and wind speed measurements (n = 135,772).The shipboard wind speed data, measured at around 25 m height, were corrected for ship motion and adjusted to 10 m height by a factor of 0.91 following Thomas et al. (2005). The following equation was used to calculate instantaneous air-sea CO2 flux without the presence of sea
ice:

<img src="https://render.githubusercontent.com/render/math?math=CO_2 flux = k K_0 (pCO_2 - pCO_{2atm})">

where k is the CO2 gas transfer velocity (cm h<sup>-1</sup>), K0 is the solubility of CO2 in seawater (mol L<sup>-1</sup> atm<sup>-1</sup>), and pCO2 and pCO2atm are the partial pressures of CO2 in the surface water and overlying air, respectively. The solubility term (K0) is a function of temperature and salinity (Weiss, 1974). We estimated pCO2atm from the CO2 concentrations at the South Pole, which are identical to atmospheric CO2 concentrations at Palmer Station on the Antarctic Peninsula (GLOBALVIEW-CO2, 2013). We did not use shipboard atmospheric pCO2 measurements since they were often contaminated (http://www.ldeo.columbia.edu/res/pi/CO2/). By convention, a negative flux denotes a downward CO2 flux into the ocean. Here we use the term "greater" to refer to a more negative flux.

CO2 fluxes are sensitive to the gas transfer velocity (k) parameterization, especially at higher wind speeds. Using eddy covariance, a recent study by Butterworth and Miller (2016) quadrupled the number of direct CO2 flux measurements from the Southern Ocean. Their study includes many direct CO2 flux measurements from the Ross Sea. After testing various gas transfer velocity parameterizations, they found that the quadratic parameterizations of Wanninkhof (2014) most accurately modeled their direct CO2 flux measurements, especially at higher wind speeds. Therefore, we calculated k following Wanninkhof (2014):

<img src="https://render.githubusercontent.com/render/math?math=k = 0.251 \ U_{10}^2 \ (Sc/660)^{-0.5} ">

where U10 is the wind speed at 10 m height and Sc is the temperature dependent Schmidt number Wanninkhof (2014). Butterworth and Miller (2016) also made the first direct CO2 flux measurements in the Antarctic marginal ice zone over a range of sea ice conditions. They confirmed that CO2 flux decreased in proportion to the fraction of sea ice cover. Hence, we calculated instantaneous CO2 flux in the presence of ice as

CO2 flux = CO2 flux (no ice) X (1 - A)

where A is the sea ice concentration. We used daily satellite derived 6.25 km resolution AMSR-E and AMSR-2 sea ice concentration data from the University of Bremen (Spreen et al., 2008). To evaluate the spatial distribution of CO2 fluxes, we binned the instantaneous CO2 flux data into 0.5° latitude by 2° longitude grid cells. We averaged the CO2 flux for each grid cell by month (November–March). To reduce biases by an overrepresented day and/or year, we first averaged all values within each space/month grid cell by day, then year, and then averaged all years together. To estimate monthly CO2 fluxes for the Ross Sea continental shelf (November–March), we averaged all grid cells poleward of the 1,000 m isopleth. The number of grid cells with CO2 flux estimates range from 49 (November) to 119 (February; supporting information Figure S5). Cumulative CO2 fluxes from November through March approximate the annual flux since ~95% of the Ross Sea continental shelf is covered in sea ice during the winter (Arrigo & van Dijken, 2003b).

