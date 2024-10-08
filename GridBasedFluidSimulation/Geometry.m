
% Define the geometry for the simulation, specifically the shape of the foil (SG6043) and initialize simulation parameters.

% Declare the shape of the foil, represented by its X-Y coordinates (SG6043 airfoil)
global_foil=[
    1.000000   .000000
     .998105   .000656
     .992735   .002712
     .984387   .006072
     .973434   .010465
     .960071   .015523
     .944288   .020916
     .925966   .026547
     .905161   .032475
     .882072   .038683
     .856884   .045099
     .829794   .051648
     .801008   .058240
     .770741   .064777
     .739215   .071138
     .706663   .077173
     .673195   .082684
     .638892   .087606
     .603962   .091903
     .568537   .095505
     .532761   .098415
     .496847   .100592
     .460955   .102010
     .425276   .102690
     .389995   .102599
     .355272   .101752
     .321306   .100174
     .288269   .097880
     .256330   .094905
     .225671   .091274
     .196447   .087021
     .168817   .082199
     .142926   .076839
     .118895   .070995
     .096866   .064730
     .076936   .058094
     .059198   .051170
     .043757   .043981
     .030622   .036590
     .019828   .029159
     .011416   .021706
     .005277   .014355
     .001496   .007410
     .000024   .000942
     .000588  -.004677
     .003930  -.008595
     .010772  -.011195
     .020868  -.013164
     .034086  -.014302
     .050504  -.014598
     .070145  -.014215
     .092915  -.013293
     .118637  -.011970
     .147117  -.010343
     .178147  -.008477
     .211498  -.006446
     .246927  -.004303
     .284172  -.002104
     .322960   .000114
     .363008   .002319
     .404014   .004498
     .445705   .006689
     .487849   .008933
     .530290   .011167
     .572862   .013270
     .615252   .015037
     .657041   .016351
     .697849   .017212
     .737347   .017604
     .775201   .017514
     .811085   .016945
     .844678   .015916
     .875671   .014467
     .903773   .012654
     .928712   .010558
     .950241   .008276
     .968141   .005908
     .982146   .003613
     .992088   .001700
     .998026   .000453
     .999999   .000000   
];

% Global variable to store simulation parameters
global sim_params
sim_params.n = 1;              % Number of simulations or the current simulation count
sim_params.ar = 4;             % Aspect ratio of the simulation domain
sim_params.AoA = 0;            % Angle of attack (degrees)
sim_params.DispRight = 5;      % Displacement to the right for the foil (or object)
sim_params.DispUp = 20;        % Displacement upwards
sim_params.s = 40;             % Grid size (likely number of grid points)
sim_params.ObstSize = 100;     % Size of the obstacle (foil) in the domain
sim_params.foil = global_foil; % Assign the defined foil shape to the simulation parameters
sim_params.vis = 1e-5;         % Viscosity of the fluid (e.g., air or water)

% Global variable to store simulation results
global sim_results
sim_results.u = 0;  % Initialize velocity field in x-direction
sim_results.v = 0;  % Initialize velocity field in y-direction
sim_results.p = 0;  % Initialize pressure field
