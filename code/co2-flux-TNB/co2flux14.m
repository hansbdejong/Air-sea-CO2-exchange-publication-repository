% CO2FLUX Flux of CO2 across the air-sea interface
%Wanninkof 2014
%
% Time-stamp: <2012-03-28 11:53:24 mlankhorst>
%
% Compute flux of carbon dioxide between air and sea from partial
% pressures of CO2 in air and sea, sea water temperature and
% salinity, and wind speed via Bulk formula.
%
% USAGE:    f=co2flux(pco2w,pco2a,u10,t,s);
%
%   f:      CO2 flux, positive from sea to air [mol m-2 s-1]
%   pco2w:  Partial pressure of CO2 in sea water [microatm]
%   pco2a:  Partial pressure of CO2 in air [microatm]
%   u10:    Instantaneous wind speed at 10m above sea level
%           [m s-1]
%   t:      Sea surface temperature [deg C] (note: difference
%           between temperature scales of 1968 and 1990 is
%           negligible for this algorithm)
%   s:      Sea surface salinity [g/kg] (note: difference between
%           absolute/practical salinity is negligible for this
%           algorithm)
%
% References:
%
%   R.F. Weiss (1974): "Carbon Dioxide in Water and Seawater: The
%   Solubility of a Non-Ideal Gas". Marine Chemistry, vol. 2,
%   pp. 203-215.
%
%   R. Wanninkhof (1992): "Relationship Between Wind Speed and Gas
%   Exchange Over the Ocean". Journal of Geophysical Research,
%   vol. 97, no. C5, pp. 7373-7382.
%
%   C. Sweeney, E. Gloor, A. R. Jacobson, R. M. Key, G. McKinley,
%   J. L. Sarmiento, R. Wanninkhof (2007): "Constraining global
%   air-sea gas exchange for CO2 with recent bomb 14C
%   measurements". Global Biogeochemical Cycles, vol. 21,
%   no. GB2015.
%
function f=co2flux14(pco2w,pco2a,u10,t,s)

% convert micro-atm to atm:
pco2a=pco2a./1e6;
pco2w=pco2w./1e6;

% Compute Schmidt number (after Wanninkhof, 2014, Table A1):
Sc=2116.8-(136.25.*t)+(4.7353.*(t.^2))-(0.092307.*(t.^3))+(0.0007555.*(t.^4));

% Compute gas transfer velocity
% below from Wanninkhof 2014
% k=(0.245.*(u10.^2)+1.3).*sqrt(660./Sc)  Ross Sea cruise
k=0.251.*(u10.^2).*sqrt(660./Sc);

% Compute absolute temperature:
T=t+273.15;

% The Weiss solubility constant for CO2 in seawater

K0=exp(-58.0931+(90.5069.*(100./T))+(22.2940.*log(T./100))+ ...
    s.*(0.027766-(0.025888.*(T./100))+ ...
    (0.0050578.*((T./100).^2)))); 

% A=[-58.0931, 90.5069, 22.2940];  
% B=[0.027766, -0.025888, 0.0050578]; 
% Ln_Ko=A(1)+(A(2).*(100./T))+(A(3).*log(T./100))+s.*(B(1)+(B(2).*(T./100))+(B(3).*(T./100).^2));
% K0=exp(Ln_Ko);


% Compute flux (after Wanninkhof, 2014, eqn. A2):
f=k.*K0.*(pco2w-pco2a)*24*10000;