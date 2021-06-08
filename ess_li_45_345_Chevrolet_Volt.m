%% File description
% Name : ess_li_45_345_Chevrolet_Volt				
% Author : V. Vermeulen - ANL, Modiefied by C. Hoff (12/28/2016)		                          				
% Description : Initialize the parameters used in the 2013 Chevrolet Volt battery
% Comment : The battery pack performance data was provided by ECOtality under contract from the U.S Department of Energy. 
% Capacity = 45Ah, Cell number = 288
% Technology : liion																		
% Vehicle Type : Light, Heavy



%% File content
ess.battery_name = 'Li-ion 45Ah 345V Chevrolet Volt';

% constant parameters
ess.soc_init                = 0.7;	% intitial state of charge
ess.num_cell_per_module     = 96;	% number of cells in module (series) 
ess.num_cell_series         = 96;           % number of cells in module (series)
ess.num_module_parallel     = 3;            % number of modules in pack (parallel)
ess.soc_min                 = 0;
ess.soc_max                 = 1;
ess.cap                     = 15.0;	% Nominal capacity (Ah), per cell (3-hour)
ess.cp                      = 15.62;% Peukert capacity (amp-sec)
ess.k                       = 1.025;% Peukert coefficient
ess.volt_nom                = 3.60; % V, per cell
ess.volt_min                = 3.00; % V, per cell
ess.volt_max                = 4.15; % V, per cell
ess.packaging_factor        = 1.25; % estimated
ess.mass_module             = 198/ess.packaging_factor/(ess.num_cell_series*ess.num_module_parallel);  							
ess.mass_cell               = ess.mass_module/ess.num_cell_per_module;

% SOC dependent parameters
ess.soc_index = (0:0.1:1);  % SOC range over which data is defined
ess.voc_map       = [3.500 3.518 3.592 3.661 3.718 3.792 3.867 3.949 4.013 4.065 4.15]; % (V)
ess.rint_dis_map  = [0.0035 0.00320 0.00303 0.00294 0.00290 0.00284 0.00298 0.00310 0.00305 0.00290 0.0025]; % (ohm)
ess.rint_chg_map  = [0.0035 0.00317 0.00305 0.00295 0.00296 0.00290 0.00302 0.00312 0.00303 0.00289 0.0270];% (ohm)
ess.rint_nom      = mean(ess.rint_dis_map);
ess.rint_nom_map  = ess.rint_nom*ones(size(ess.soc_index));% (ohm) - convert nominal to map

% Max current and power when charging/discharging
ess.curr_chg_max	= -max((ess.volt_max-ess.voc_map)./ess.rint_chg_map);
ess.curr_dis_max	= max((ess.voc_map-ess.volt_min)./ess.rint_dis_map);
ess.pwr_chg_max     = -max(max((ess.volt_max-ess.voc_map).*ess.volt_max./ess.rint_chg_map));%per cell
ess.pwr_dis_max 	= max(max((ess.voc_map-ess.volt_min).*ess.volt_min./ess.rint_dis_map));%per cell

% Battery density
ess.pwr_dis_nom     = max((ess.volt_nom-ess.volt_min).*ess.volt_min./ess.rint_dis_map);%per cell
ess.pwr_density     = ess.pwr_dis_nom/ess.mass_cell;
ess.energy_density	= (ess.volt_nom*ess.cap)/ess.mass_cell; % Wh/kg

% Pack values
ess.num_cell_pack   = ess.num_module_parallel.*ess.num_cell_series;
ess.mass_pack       = ess.mass_cell*ess.num_cell_pack;  % kg
ess.cap_pack        = ess.cap*ess.num_module_parallel;  % Ah
ess.cp_pack         = ess.cp*ess.num_module_parallel;   % Ah
ess.k_pack          = ess.k;
ess.rint_nom_pack   = 1/(1/(ess.rint_nom*ess.num_cell_series)*ess.num_module_parallel);
ess.rint_nom_map_pack = 1./(1./(ess.rint_nom_map*ess.num_cell_series)*ess.num_module_parallel);
ess.rint_dis_map_pack = 1./(1./(ess.rint_dis_map*ess.num_cell_series)*ess.num_module_parallel);
ess.rint_chg_map_pack = 1./(1./(ess.rint_chg_map*ess.num_cell_series)*ess.num_module_parallel);
ess.voc_map_pack    = ess.voc_map*ess.num_cell_series;
ess.volt_nom_pack   = ess.volt_nom*ess.num_cell_series;



