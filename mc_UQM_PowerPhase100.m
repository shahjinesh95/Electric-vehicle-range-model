%% File description
% Name : mc_UQM_PowerPhase100.m					
% Author : A.Rousseau - ANL, modied to match data sheet by cjh 12/27/2016	                          				
% Description : Initialize 100kW Peak UQM PowerPhase PM motor
% Continuous Power = 60kW, Peak Power = 100kW
% Data from PowerPhase 100 Data sheet. Unique Mobility website: www.uqm.com

%% File content

mc.motor_name       ='UQM PowerPhase 100kW PM Motor';
mc.inertia    		= 0.02; 
mc.coeff_regen 	    = 1;
mc.volt_min			= 180; % (V), minimum voltage allowed by the controller and motor
mc.time_response    = 0.05; 
mc.t_max_trq     	= 180; % Time (s) the motor can remain at max torque

mc.mass_motor       = 86.0; % kg
mc.mass_controller  = 15.9; % kg

mc.curr_max    		= 400; % (A), maximum current allowed by the controller and motor
mc.rpm_base			= 3200; % rpm (modified cjh)

% Continuous operation limits
mc.rpm_cont_index      = [0,200,400,600,800,1000,1200,1400,1600,1800,...
    2000,2200,2400,2600,2800,3000,3200,3200,3400,3600,3800,4000,4200,...
    4400,4600,4800,5000,5200,5400,5600,5800,6000,6200,6400,6600,6800,...
    7000,7200,7400,7600,7800,8000]; % rpm
mc.trq_cont_map 	    = 1.5 * [180.0	180.0	180.0	180.0	180.0...
    180.0	180.0	180.0	180.0	180.0	180.0	180.0	180.0...
    180.0	180.0	180.0	180.0	180.0	169.4	160.0	151.6...
    144.0	137.1	130.9	125.2	120.0	115.2	110.8	106.7...
    102.9	99.3	96.0	92.9	90.0	87.3	84.7	82.3...
    80.0	77.8	75.8	73.8	72.0] ; % (N*m)

% Max (peak) operation limits
mc.rpm_max_index 	    = mc.rpm_cont_index;
mc.trq_max_map      	= 1.5 * [300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	300.0	282.4	266.7	252.6	240.0	228.6	218.2	208.7	200.0	192.0	184.6	177.8	171.4	165.5	160.0	154.8	150.0	145.5	141.2	137.1	133.3	129.7	126.3	123.1	120.0];

% Efficiency data, rows indexed by rpm and columns indexed by trq
mc.rpm_eff_index 		= linspace(0,8000,25);
mc.trq_eff_index 	    = 1.5 * linspace(0,300,12);
mc.eff_trq_map		    = [...
0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360	0.360
0.555	0.752	0.787	0.800	0.793	0.789	0.786	0.783	0.777	0.772	0.767	0.762	0.756	0.751	0.744	0.738	0.730	0.720	0.714	0.705	0.696	0.693	0.681	0.670	0.673
0.664	0.829	0.856	0.864	0.867	0.867	0.866	0.865	0.862	0.860	0.856	0.853	0.849	0.850	0.845	0.840	0.835	0.831	0.826	0.819	0.803	0.800	0.793	0.785	0.776
0.757	0.862	0.894	0.906	0.910	0.912	0.913	0.913	0.913	0.913	0.912	0.910	0.908	0.906	0.905	0.902	0.900	0.897	0.864	0.861	0.857	0.858	0.851	0.848	0.843
0.754	0.852	0.898	0.917	0.922	0.928	0.929	0.931	0.930	0.931	0.930	0.930	0.929	0.928	0.929	0.927	0.915	0.903	0.894	0.883	0.880	0.876	0.872	0.869	0.856
0.816	0.864	0.907	0.923	0.933	0.938	0.939	0.939	0.933	0.933	0.933	0.925	0.923	0.922	0.921	0.910	0.902	0.910	0.909	0.897	0.860	0.850	0.850	0.830	0.830
0.702	0.838	0.891	0.907	0.922	0.929	0.928	0.930	0.939	0.939	0.931	0.938	0.929	0.919	0.908	0.908	0.897	0.870	0.860	0.850	0.850	0.840	0.830	0.800	0.800
0.599	0.824	0.872	0.886	0.904	0.905	0.906	0.916	0.917	0.917	0.902	0.907	0.895	0.885	0.860	0.850	0.850	0.850	0.850	0.840	0.840	0.840	0.800	0.800	0.800
0.405	0.749	0.850	0.852	0.887	0.909	0.914	0.913	0.917	0.900	0.902	0.895	0.870	0.860	0.850	0.840	0.840	0.840	0.840	0.830	0.800	0.800	0.800	0.800	0.800
0.417	0.728	0.828	0.839	0.869	0.871	0.879	0.885	0.881	0.864	0.856	0.830	0.820	0.820	0.820	0.820	0.810	0.810	0.810	0.800	0.800	0.800	0.800	0.800	0.800
0.432	0.702	0.830	0.847	0.855	0.876	0.872	0.865	0.847	0.849	0.830	0.820	0.820	0.810	0.810	0.810	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800
0.426	0.680	0.801	0.830	0.855	0.843	0.849	0.841	0.833	0.830	0.820	0.810	0.810	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800	0.800
]';    
%% Generator values
% assume generator values are same as motor values

% mirror continuous data
mc.rpm_cont_index_gen = mc.rpm_cont_index; 
mc.trq_cont_map_gen   = -mc.trq_cont_map;

% mirror peak data
mc.rpm_max_index_gen = mc.rpm_max_index; 
mc.trq_max_map_gen   = -mc.trq_max_map;

% mirror efficiency data (note trq=0 data does not need to be repeated)
mc.rpm_eff_index_gen = mc.rpm_eff_index;
mc.trq_eff_index_gen = -fliplr(mc.trq_eff_index);
mc.eff_trq_map_gen       = fliplr(mc.eff_trq_map); 

%% Optional - Two Quadrant Efficiency Matrix
% same efficiency data as previous, just packed into a single 2Q matrix

mc.rpm_eff_index_2Q = mc.rpm_eff_index;
mc.trq_eff_index_2Q = [-fliplr(mc.trq_eff_index(2:end)) mc.trq_eff_index];
mc.eff_trq_map_2Q       = [fliplr(mc.eff_trq_map(:,2:end)) mc.eff_trq_map];


