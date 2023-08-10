function out = model
%
% MSS_withPrestress.m
%
% Model exported on Aug 10 2023, 11:27 by COMSOL 6.1.0.282.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('F:\1_COMSOL Base\1.Cantilever TOP\TO');

model.label('MSS_withPrestress.mph');

model.title('MSS');

model.description(['This model is built to verify the relationship between sensor stiffness and TiN thin film prestress.\nHere we assume R1 and R2 have the same length and width, and it is used to compare the performance of MSS and topology optimization with Wheatstone bridge configurations.\nThe area and aspect ratio parameters replace the length and width of piezoresistor beams for convenient parameter sweep.']);

model.param.set('legl', 'sqrt(area^2*AR)', 'Length of R1');
model.param.set('legw', 'sqrt(area^2/AR)+meshsz*2', 'Width of R1');
model.param.set('legh', '3[um]', 'Beam thickness');
model.param.set('L', '300[um]', 'Length of design domain');
model.param.set('tf', '50[nm]', 'Coating thickness');
model.param.set('sigma_s', '-1[N/m]', 'Surface stress');
model.param.set('sigma_f', 'sigma_s/tf', 'Residual stress associated with the surface stress');
model.param.set('mr', 'sqrt((legw/2)^2+(L/2-legl)^2)', 'Membrane radius');
model.param.set('meshsz', 'L/20', 'Mesh size');
model.param.set('leg2l', 'legl', 'Length of R2');
model.param.set('leg2w', 'legw', 'Width of R2');
model.param.set('pr110_1', '71.8*10^-11[1/Pa]', 'Longitudinal coefficient for 110');
model.param.set('pr110_2', '-66.3*10^-11[1/Pa]', 'Transverse coefficient for 110');
model.param.set('area', '17[um]', 'Area of piezoresistor');
model.param.set('AR', '2', 'Aspect ratio of piezoresistor');
model.param.set('prestrain', '0', 'Prestress in silicon');
model.param.set('disp', '1', 'Dummy variable for displacement control');

model.component.create('comp1', false);

model.component('comp1').geom.create('geom1', 3);

model.component('comp1').curvedInterior(false);

model.result.table.create('tbl1', 'Table');

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);
model.component('comp1').geom('geom1').geomRep('comsol');
model.component('comp1').geom('geom1').repairTolType('relative');
model.component('comp1').geom('geom1').create('wp2', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp2').label('Device');
model.component('comp1').geom('geom1').feature('wp2').set('unite', true);
model.component('comp1').geom('geom1').feature('wp2').geom.create('c2', 'Circle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('c2').set('r', 'mr');
model.component('comp1').geom('geom1').feature('wp2').geom.create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r1').set('pos', {'-L/2+legl/2' '0'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r1').set('base', 'center');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r1').set('size', {'legl' 'legw'});
model.component('comp1').geom('geom1').feature('wp2').geom.create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r2').set('pos', {'0' '-L/2+leg2l/2'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r2').set('base', 'center');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r2').set('size', {'leg2w' 'leg2l'});
model.component('comp1').geom('geom1').feature('wp2').geom.create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('dif1').set('intbnd', false);
model.component('comp1').geom('geom1').feature('wp2').geom.feature('dif1').selection('input').set({'c2'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('dif1').selection('input2').set({'r1' 'r2'});
model.component('comp1').geom('geom1').feature('wp2').geom.create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r3').set('pos', {'-L/2+legl/2' '0'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r3').set('base', 'center');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r3').set('size', {'legl' 'legw'});
model.component('comp1').geom('geom1').feature('wp2').geom.create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r4').set('pos', {'0' '-L/2+legl/2'});
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r4').set('base', 'center');
model.component('comp1').geom('geom1').feature('wp2').geom.feature('r4').set('size', {'leg2w' 'leg2l'});
model.component('comp1').geom('geom1').create('ext1', 'Extrude');
model.component('comp1').geom('geom1').feature('ext1').label('Extrude 2');
model.component('comp1').geom('geom1').feature('ext1').setIndex('distance', 'legh', 0);
model.component('comp1').geom('geom1').feature('ext1').set('reverse', true);
model.component('comp1').geom('geom1').feature('ext1').selection('input').set({'wp2'});
model.component('comp1').geom('geom1').create('wp4', 'WorkPlane');
model.component('comp1').geom('geom1').feature('wp4').label('Symmetry');
model.component('comp1').geom('geom1').feature('wp4').set('quickz', 25);
model.component('comp1').geom('geom1').feature('wp4').set('unite', true);
model.component('comp1').geom('geom1').feature('wp4').geom.create('r7', 'Rectangle');
model.component('comp1').geom('geom1').feature('wp4').geom.feature('r7').set('pos', {'0' 'mr*3/2'});
model.component('comp1').geom('geom1').feature('wp4').geom.feature('r7').set('base', 'center');
model.component('comp1').geom('geom1').feature('wp4').geom.feature('r7').set('size', {'mr*10' 'mr*3'});
model.component('comp1').geom('geom1').feature('wp4').geom.create('rot1', 'Rotate');
model.component('comp1').geom('geom1').feature('wp4').geom.feature('rot1').set('keep', true);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('rot1').setIndex('rot', '-90', 0);
model.component('comp1').geom('geom1').feature('wp4').geom.feature('rot1').selection('input').set({'r7'});
model.component('comp1').geom('geom1').create('ext3', 'Extrude');
model.component('comp1').geom('geom1').feature('ext3').label('Extrude 1');
model.component('comp1').geom('geom1').feature('ext3').setIndex('distance', '50', 0);
model.component('comp1').geom('geom1').feature('ext3').set('reverse', true);
model.component('comp1').geom('geom1').feature('ext3').selection('input').set({'wp4'});
model.component('comp1').geom('geom1').create('dif1', 'Difference');
model.component('comp1').geom('geom1').feature('dif1').set('selresult', true);
model.component('comp1').geom('geom1').feature('dif1').selection('input').set({'ext1(1)'});
model.component('comp1').geom('geom1').feature('dif1').selection('input2').set({'ext3(1)'});
model.component('comp1').geom('geom1').create('boxsel1', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel1').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel1').label('Immobilization');
model.component('comp1').geom('geom1').feature('boxsel1').set('zmin', '-eps');
model.component('comp1').geom('geom1').feature('boxsel1').set('zmax', 'eps');
model.component('comp1').geom('geom1').feature('boxsel1').set('condition', 'inside');
model.component('comp1').geom('geom1').create('boxsel2', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel2').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel2').label('PR 1');
model.component('comp1').geom('geom1').feature('boxsel2').set('xmin', '-L/2');
model.component('comp1').geom('geom1').feature('boxsel2').set('xmax', '-L/2+legl+eps');
model.component('comp1').geom('geom1').feature('boxsel2').set('ymin', '-legw/2-eps');
model.component('comp1').geom('geom1').feature('boxsel2').set('ymax', 0);
model.component('comp1').geom('geom1').feature('boxsel2').set('zmin', '-eps');
model.component('comp1').geom('geom1').feature('boxsel2').set('zmax', 'eps');
model.component('comp1').geom('geom1').feature('boxsel2').set('condition', 'allvertices');
model.component('comp1').geom('geom1').create('boxsel8', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel8').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel8').label('PR 2');
model.component('comp1').geom('geom1').feature('boxsel8').set('xmin', '-leg2w/2');
model.component('comp1').geom('geom1').feature('boxsel8').set('xmax', 0);
model.component('comp1').geom('geom1').feature('boxsel8').set('ymin', '-L/2');
model.component('comp1').geom('geom1').feature('boxsel8').set('ymax', '-L/2+leg2l');
model.component('comp1').geom('geom1').feature('boxsel8').set('zmin', '-eps');
model.component('comp1').geom('geom1').feature('boxsel8').set('zmax', 'eps');
model.component('comp1').geom('geom1').feature('boxsel8').set('condition', 'allvertices');
model.component('comp1').geom('geom1').create('boxsel3', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel3').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel3').label('Fixed1');
model.component('comp1').geom('geom1').feature('boxsel3').set('xmin', '-L/2');
model.component('comp1').geom('geom1').feature('boxsel3').set('xmax', '-L/2+eps');
model.component('comp1').geom('geom1').feature('boxsel3').set('condition', 'inside');
model.component('comp1').geom('geom1').create('boxsel4', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel4').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel4').label('Fixed2');
model.component('comp1').geom('geom1').feature('boxsel4').set('xmin', '-inf');
model.component('comp1').geom('geom1').feature('boxsel4').set('xmax', 'inf');
model.component('comp1').geom('geom1').feature('boxsel4').set('ymin', '-L/2');
model.component('comp1').geom('geom1').feature('boxsel4').set('ymax', '-L/2+eps');
model.component('comp1').geom('geom1').feature('boxsel4').set('condition', 'inside');
model.component('comp1').geom('geom1').create('unisel1', 'UnionSelection');
model.component('comp1').geom('geom1').feature('unisel1').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('unisel1').label('Fix ends');
model.component('comp1').geom('geom1').feature('unisel1').set('input', {'boxsel3' 'boxsel4'});
model.component('comp1').geom('geom1').create('boxsel5', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel5').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel5').label('Symmetry1');
model.component('comp1').geom('geom1').feature('boxsel5').set('ymin', '-eps');
model.component('comp1').geom('geom1').feature('boxsel5').set('ymax', 'eps');
model.component('comp1').geom('geom1').feature('boxsel5').set('condition', 'inside');
model.component('comp1').geom('geom1').create('boxsel6', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel6').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel6').label('Symmetry2');
model.component('comp1').geom('geom1').feature('boxsel6').set('xmin', '-eps');
model.component('comp1').geom('geom1').feature('boxsel6').set('xmax', 'eps');
model.component('comp1').geom('geom1').feature('boxsel6').set('ymin', '-inf');
model.component('comp1').geom('geom1').feature('boxsel6').set('condition', 'inside');
model.component('comp1').geom('geom1').create('boxsel7', 'BoxSelection');
model.component('comp1').geom('geom1').feature('boxsel7').set('entitydim', 2);
model.component('comp1').geom('geom1').feature('boxsel7').label('Bottom');
model.component('comp1').geom('geom1').feature('boxsel7').set('zmin', '-legh-eps');
model.component('comp1').geom('geom1').feature('boxsel7').set('zmax', '-legh+eps');
model.component('comp1').geom('geom1').feature('boxsel7').set('condition', 'inside');
model.component('comp1').geom('geom1').feature('fin').set('repairtoltype', 'relative');
model.component('comp1').geom('geom1').run;

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('PR1', 'aveop1(pr110_1*solid.sGpx+pr110_2*solid.sGpy)', 'Output at R1');
model.component('comp1').variable('var1').set('PR2', 'aveop2(pr110_1*solid.sGpx+pr110_2*solid.sGpy)', 'Output at R2');
model.component('comp1').variable('var1').set('Output', '(PR1-PR2)/2', 'Sensor output');

model.component('comp1').view('view2').tag('view17');
model.component('comp1').view('view3').tag('view19');
model.view.create('view20', 3);

model.material.create('mat1', 'Common', '');
model.component('comp1').material.create('matlnk1', 'Link');
model.component('comp1').material.create('matlnk2', 'Link');
model.material.create('mat2', 'Common', '');
model.material('mat1').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('matlnk2').selection.named('geom1_boxsel1');
model.material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');

model.component('comp1').cpl.create('aveop1', 'Average');
model.component('comp1').cpl.create('aveop2', 'Average');
model.component('comp1').cpl.create('aveop3', 'Average');
model.component('comp1').cpl('aveop1').selection.named('geom1_boxsel2');
model.component('comp1').cpl('aveop2').selection.named('geom1_boxsel8');
model.component('comp1').cpl('aveop3').selection.geom('geom1', 0);
model.component('comp1').cpl('aveop3').selection.set([18]);

model.component('comp1').physics.create('shell', 'Shell', 'geom1');
model.component('comp1').physics('shell').field('displacement').field('u2');
model.component('comp1').physics('shell').field('displacement').component({'u2' 'v2' 'w2'});
model.component('comp1').physics('shell').selection.named('geom1_boxsel1');
model.component('comp1').physics('shell').feature('emm1').create('iss1', 'InitialStressandStrain', 2);
model.component('comp1').physics.create('solid', 'SolidMechanics', 'geom1');
model.component('comp1').physics('solid').feature('lemm1').create('iss1', 'InitialStressandStrain', 3);
model.component('comp1').physics('solid').create('fix1', 'Fixed', 2);
model.component('comp1').physics('solid').feature('fix1').selection.named('geom1_unisel1');
model.component('comp1').physics('solid').create('sym1', 'SymmetrySolid', 2);
model.component('comp1').physics('solid').feature('sym1').selection.named('geom1_boxsel5');
model.component('comp1').physics('solid').create('sym2', 'SymmetrySolid', 2);
model.component('comp1').physics('solid').feature('sym2').selection.named('geom1_boxsel6');
model.component('comp1').physics('solid').create('ge1', 'GlobalEquations', -1);
model.component('comp1').physics('solid').feature('ge1').set('DependentVariableQuantity', 'none');
model.component('comp1').physics('solid').feature('ge1').set('CustomDependentVariableUnit', 'N/m');

model.component('comp1').multiphysics.create('sshc1', 'SolidShellConnection', -1);

model.component('comp1').mesh('mesh1').create('swe1', 'Sweep');
model.component('comp1').mesh('mesh1').feature('swe1').selection.geom('geom1', 3);
model.component('comp1').mesh('mesh1').feature('swe1').selection.set([1 2 3]);
model.component('comp1').mesh('mesh1').feature('swe1').create('dis1', 'Distribution');

model.component('comp1').probe.create('var4', 'GlobalVariable');
model.component('comp1').probe.create('var2', 'GlobalVariable');
model.component('comp1').probe.create('var3', 'GlobalVariable');
model.component('comp1').probe.create('bnd2', 'Boundary');
model.component('comp1').probe.create('bnd3', 'Boundary');
model.component('comp1').probe('bnd2').selection.named('geom1_boxsel2');
model.component('comp1').probe('bnd3').selection.named('geom1_boxsel2');

model.result.table('tbl1').label('Probe Table 1');

model.thermodynamics.label('Thermodynamics Package');

model.component('comp1').view('view1').set('showgrid', false);
model.component('comp1').view('view17').label('View 17');
model.component('comp1').view('view17').axis.set('xmin', -420.7771301269531);
model.component('comp1').view('view17').axis.set('xmax', 304.8692932128906);
model.component('comp1').view('view17').axis.set('ymin', -403.08258056640625);
model.component('comp1').view('view17').axis.set('ymax', 293.5252990722656);
model.component('comp1').view('view19').label('View 19');
model.component('comp1').view('view19').axis.set('xmin', -614.9638061523438);
model.component('comp1').view('view19').axis.set('xmax', 701.1661376953125);
model.component('comp1').view('view19').axis.set('ymin', -603.9918212890625);
model.component('comp1').view('view19').axis.set('ymax', 659.4700927734375);
model.view('view20').set('showgrid', false);
model.view('view20').set('showaxisorientation', false);

model.material('mat1').label('Silicon');
model.material('mat1').set('family', 'custom');
model.material('mat1').set('customspecular', [0.7843137254901961 1 1]);
model.material('mat1').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.material('mat1').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.material('mat1').set('noise', true);
model.material('mat1').set('fresnel', 0.7);
model.material('mat1').set('metallic', 0);
model.material('mat1').set('pearl', 0);
model.material('mat1').set('diffusewrap', 0);
model.material('mat1').set('clearcoat', 0);
model.material('mat1').set('reflectance', 0);
model.material('mat1').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat1').propertyGroup('def').set('electricconductivity', {'1e-12[S/m]' '0' '0' '0' '1e-12[S/m]' '0' '0' '0' '1e-12[S/m]'});
model.material('mat1').propertyGroup('def').set('thermalexpansioncoefficient', {'2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]'});
model.material('mat1').propertyGroup('def').set('heatcapacity', '700[J/(kg*K)]');
model.material('mat1').propertyGroup('def').set('relpermittivity', {'11.7' '0' '0' '0' '11.7' '0' '0' '0' '11.7'});
model.material('mat1').propertyGroup('def').set('density', '2329[kg/m^3]');
model.material('mat1').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.material('mat1').propertyGroup('Enu').info('category').label('Null');
model.material('mat1').propertyGroup('Enu').set('E', '170e9[Pa]');
model.material('mat1').propertyGroup('Enu').set('nu', '0.28');
model.material('mat1').propertyGroup('RefractiveIndex').info('category').label('Null');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});
model.component('comp1').material('matlnk1').label('Silicon');
model.component('comp1').material('matlnk2').label('Au');
model.component('comp1').material('matlnk2').set('link', 'mat2');
model.material('mat2').label('Au - Gold');
model.material('mat2').set('family', 'gold');
model.material('mat2').propertyGroup('def').set('electricconductivity', {'45.6e6[S/m]' '0' '0' '0' '45.6e6[S/m]' '0' '0' '0' '45.6e6[S/m]'});
model.material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'14.2e-6[1/K]' '0' '0' '0' '14.2e-6[1/K]' '0' '0' '0' '14.2e-6[1/K]'});
model.material('mat2').propertyGroup('def').set('heatcapacity', '129[J/(kg*K)]');
model.material('mat2').propertyGroup('def').set('density', '19300[kg/m^3]');
model.material('mat2').propertyGroup('def').set('thermalconductivity', {'317[W/(m*K)]' '0' '0' '0' '317[W/(m*K)]' '0' '0' '0' '317[W/(m*K)]'});
model.material('mat2').propertyGroup('Enu').set('E', '70e9[Pa]');
model.material('mat2').propertyGroup('Enu').set('nu', '0.44');

model.component('comp1').physics('shell').prop('ShellAdvancedSettings').set('GroupPhysOdesRc', false);
model.component('comp1').physics('shell').prop('ShellAdvancedSettings').set('GroupPhysOdesAtt', false);
model.component('comp1').physics('shell').feature('emm1').feature('iss1').set('Ni', {'sigma_s'; '0'; '0'; 'sigma_s'});
model.component('comp1').physics('shell').feature('to1').set('d', 'tf');
model.component('comp1').physics('shell').feature('to1').set('OffsetDefinition', 'bottom');
model.component('comp1').physics('solid').prop('AdvancedSettings').set('GroupPhysOdesRc', false);
model.component('comp1').physics('solid').prop('AdvancedSettings').set('GroupPhysOdesAtt', false);
model.component('comp1').physics('solid').feature('lemm1').set('SolidModel', 'Anisotropic');
model.component('comp1').physics('solid').feature('lemm1').set('AnisotropicOption', 'AnisotropicVo');
model.component('comp1').physics('solid').feature('lemm1').set('DVo_mat', 'userdef');
model.component('comp1').physics('solid').feature('lemm1').set('DVo', {'194.4e9';  ...
'35.6e9';  ...
'64.1e9';  ...
'0';  ...
'0';  ...
'0';  ...
'35.6e9';  ...
'194.4e9';  ...
'64.1e9';  ...
'0';  ...
'0';  ...
'0';  ...
'64.1e9';  ...
'64.1e9';  ...
'165.9e9';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'79.4e9';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'79.4e9';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'0';  ...
'50.9e9'});
model.component('comp1').physics('solid').feature('lemm1').feature('iss1').set('eil', {'prestrain'; '0'; '0'; '0'; 'prestrain'; '0'; '0'; '0'; '0'});
model.component('comp1').physics('solid').feature('dcnt1').set('pairDisconnect', true);
model.component('comp1').physics('solid').feature('dcnt1').label('Contact');
model.component('comp1').physics('solid').feature('dcont1').set('pairDisconnect', true);
model.component('comp1').physics('solid').feature('dcont1').label('Continuity');
model.component('comp1').physics('solid').feature('ge1').set('name', 'sigma_s');
model.component('comp1').physics('solid').feature('ge1').set('equation', 'disp - aveop3(w)');
model.component('comp1').physics('solid').feature('ge1').set('SourceTermQuantity', 'none');
model.component('comp1').physics('solid').feature('ge1').set('CustomSourceTermUnit', 'um');

model.component('comp1').multiphysics('sshc1').set('connectionSettings', 'sharedBnd');

model.component('comp1').mesh('mesh1').feature('size').set('custom', 'on');
model.component('comp1').mesh('mesh1').feature('size').set('hmax', 'meshsz/2');
model.component('comp1').mesh('mesh1').feature('size').set('hmin', 0.014);
model.component('comp1').mesh('mesh1').feature('size').set('hcurve', 0.2);
model.component('comp1').mesh('mesh1').feature('size').set('hnarrow', 1);
model.component('comp1').mesh('mesh1').feature('size').set('hgrad', 1.3);
model.component('comp1').mesh('mesh1').feature('swe1').selection('sourceface').named('geom1_boxsel1');
model.component('comp1').mesh('mesh1').feature('swe1').selection('targetface').named('geom1_boxsel7');
model.component('comp1').mesh('mesh1').feature('swe1').feature('dis1').set('numelem', 3);
model.component('comp1').mesh('mesh1').run;

model.component('comp1').probe('var4').label('Output');
model.component('comp1').probe('var4').set('expr', '(PR1-PR2)/2');
model.component('comp1').probe('var4').set('descr', '(PR1-PR2)/2');
model.component('comp1').probe('var4').set('table', 'tbl1');
model.component('comp1').probe('var4').set('window', 'window2');
model.component('comp1').probe('var2').label('Output 1');
model.component('comp1').probe('var2').set('expr', 'PR1');
model.component('comp1').probe('var2').set('descr', '');
model.component('comp1').probe('var2').set('table', 'tbl1');
model.component('comp1').probe('var2').set('window', 'window2');
model.component('comp1').probe('var3').label('Output 2');
model.component('comp1').probe('var3').set('expr', 'PR2');
model.component('comp1').probe('var3').set('descr', '');
model.component('comp1').probe('var3').set('table', 'tbl1');
model.component('comp1').probe('var3').set('window', 'window2');
model.component('comp1').probe('bnd2').label('sx');
model.component('comp1').probe('bnd2').set('expr', 'solid.sGpx');
model.component('comp1').probe('bnd2').set('unit', 'N/m^2');
model.component('comp1').probe('bnd2').set('descractive', true);
model.component('comp1').probe('bnd2').set('descr', 'sx');
model.component('comp1').probe('bnd2').set('table', 'tbl1');
model.component('comp1').probe('bnd2').set('window', 'window2');
model.component('comp1').probe('bnd3').label('sy');
model.component('comp1').probe('bnd3').set('expr', 'solid.sGpy');
model.component('comp1').probe('bnd3').set('unit', 'N/m^2');
model.component('comp1').probe('bnd3').set('descractive', true);
model.component('comp1').probe('bnd3').set('descr', 'sy');
model.component('comp1').probe('bnd3').set('table', 'tbl1');
model.component('comp1').probe('bnd3').set('window', 'window2');

model.study.create('std3');
model.study('std3').create('stat1', 'Stationary');
model.study('std3').feature('stat1').set('geometricNonlinearity', true);

model.sol.create('sol6');
model.sol('sol6').study('std3');
model.sol('sol6').attach('std3');
model.sol('sol6').create('st1', 'StudyStep');
model.sol('sol6').create('v1', 'Variables');
model.sol('sol6').create('s1', 'Stationary');
model.sol('sol6').feature('s1').create('p1', 'Parametric');
model.sol('sol6').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol6').feature('s1').feature.remove('fcDef');
model.sol.create('sol7');
model.sol('sol7').study('std3');
model.sol('sol7').label('Parametric Solutions 1');

model.result.dataset.create('surf2', 'Surface');
model.result.dataset.create('dset7', 'Solution');
model.result.dataset.create('mir7', 'Mirror3D');
model.result.dataset.create('mir8', 'Mirror3D');
model.result.dataset.create('dset8', 'Solution');
model.result.dataset.create('avh2', 'Average');
model.result.dataset.create('avh3', 'Average');
model.result.dataset('dset2').set('solution', 'sol6');
model.result.dataset('surf2').set('data', 'dset2');
model.result.dataset('dset7').set('solution', 'sol7');
model.result.dataset('mir7').set('data', 'dset2');
model.result.dataset('mir8').set('data', 'mir7');
model.result.dataset('dset8').set('probetag', 'bnd3');
model.result.dataset('avh2').set('probetag', 'bnd2');
model.result.dataset('avh2').set('data', 'dset8');
model.result.dataset('avh2').selection.geom('geom1', 2);
model.result.dataset('avh2').selection.set([4]);
model.result.dataset('avh3').set('probetag', 'bnd3');
model.result.dataset('avh3').set('data', 'dset8');
model.result.dataset('avh3').selection.geom('geom1', 2);
model.result.dataset('avh3').selection.set([4]);
model.result.dataset.remove('dset1');
model.result.numerical.create('pev2', 'EvalPoint');
model.result.numerical.create('pev3', 'EvalPoint');
model.result.numerical.create('gev2', 'EvalGlobal');
model.result.numerical.create('gev3', 'EvalGlobal');
model.result.numerical.create('gev4', 'EvalGlobal');
model.result.numerical('pev2').set('probetag', 'bnd2');
model.result.numerical('pev3').set('probetag', 'bnd3');
model.result.numerical('gev2').set('data', 'dset8');
model.result.numerical('gev2').set('probetag', 'var2');
model.result.numerical('gev3').set('data', 'dset8');
model.result.numerical('gev3').set('probetag', 'var3');
model.result.numerical('gev4').set('data', 'dset8');
model.result.numerical('gev4').set('probetag', 'var4');
model.result.create('pg15', 'PlotGroup3D');
model.result.create('pg23', 'PlotGroup3D');
model.result.create('pg24', 'PlotGroup3D');
model.result.create('pg26', 'PlotGroup3D');
model.result.create('pg27', 'PlotGroup1D');
model.result.create('pg29', 'PlotGroup1D');
model.result.create('pg28', 'PlotGroup1D');
model.result('pg15').create('vol1', 'Volume');
model.result('pg15').feature('vol1').set('expr', 'pr110_1*solid.sGpx+pr110_2*solid.sGpy');
model.result('pg15').feature('vol1').create('def1', 'Deform');
model.result('pg23').create('vol1', 'Volume');
model.result('pg23').feature('vol1').set('expr', 'solid.sGpx');
model.result('pg24').create('vol1', 'Volume');
model.result('pg24').feature('vol1').set('expr', 'solid.sGpy');
model.result('pg26').create('vol1', 'Volume');
model.result('pg26').feature('vol1').set('expr', 'w');
model.result('pg26').feature('vol1').create('def1', 'Deform');
model.result('pg27').create('glob1', 'Global');
model.result('pg29').create('glob1', 'Global');
model.result('pg28').set('probetag', 'window2');
model.result('pg28').create('tblp1', 'Table');
model.result('pg28').feature('tblp1').set('probetag', 'var4,var2,var3,bnd2,bnd3');

model.component('comp1').probe('var4').genResult([]);
model.component('comp1').probe('var2').genResult([]);
model.component('comp1').probe('var3').genResult([]);
model.component('comp1').probe('bnd2').genResult([]);
model.component('comp1').probe('bnd3').genResult([]);

model.study('std3').label('Study 1');
model.study('std3').feature('stat1').set('plot', true);
model.study('std3').feature('stat1').set('plotgroup', 'pg27');
model.study('std3').feature('stat1').set('useparam', true);
model.study('std3').feature('stat1').set('sweeptype', 'filled');
model.study('std3').feature('stat1').set('pname', {'prestrain' 'disp'});
model.study('std3').feature('stat1').set('plistarr', {'range(0,0.5e-4,6e-4)' 'range(-2e-6,0.2e-6,3e-6)'});
model.study('std3').feature('stat1').set('punit', {'' ''});
model.study('std3').feature('stat1').set('preusesol', 'yes');

model.sol('sol6').attach('std3');
model.sol('sol6').feature('st1').label('Compile Equations: Stationary 1');
model.sol('sol6').feature('v1').label('Dependent Variables 1.1');
model.sol('sol6').feature('v1').set('clistctrl', {'p1' 'p1'});
model.sol('sol6').feature('v1').set('cname', {'prestrain' 'disp'});
model.sol('sol6').feature('v1').set('clist', {'range(0,0.5e-4,6e-4)' 'range(-2e-6,0.2e-6,3e-6)'});
model.sol('sol6').feature('v1').feature('comp1_ar').set('scalemethod', 'manual');
model.sol('sol6').feature('v1').feature('comp1_ar').set('scaleval', 0.01);
model.sol('sol6').feature('s1').label('Stationary Solver 1.1');
model.sol('sol6').feature('s1').set('probesel', 'none');
model.sol('sol6').feature('s1').feature('dDef').label('Direct 1');
model.sol('sol6').feature('s1').feature('aDef').label('Advanced 1');
model.sol('sol6').feature('s1').feature('aDef').set('cachepattern', true);
model.sol('sol6').feature('s1').feature('p1').label('Parametric 1.1');
model.sol('sol6').feature('s1').feature('p1').set('sweeptype', 'filled');
model.sol('sol6').feature('s1').feature('p1').set('pname', {'prestrain' 'disp'});
model.sol('sol6').feature('s1').feature('p1').set('plistarr', {'range(0,0.5e-4,6e-4)' 'range(-2e-6,0.2e-6,3e-6)'});
model.sol('sol6').feature('s1').feature('p1').set('punit', {'' ''});
model.sol('sol6').feature('s1').feature('p1').set('preusesol', 'yes');
model.sol('sol6').feature('s1').feature('p1').set('plot', true);
model.sol('sol6').feature('s1').feature('p1').set('plotgroup', 'pg27');
model.sol('sol6').feature('s1').feature('fc1').label('Fully Coupled 1.1');
model.sol('sol6').runAll;

model.result.dataset('mir7').set('quickplane', 'zx');
model.result.dataset('dset8').label('Probe Solution 8');
model.result.numerical('pev2').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('pev3').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('gev2').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('gev3').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result.numerical('gev4').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z-coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z-coordinate'});
model.result('pg15').label('Verification');
model.result('pg15').set('data', 'mir8');
model.result('pg15').set('looplevel', [26 1]);
model.result('pg15').set('titletype', 'manual');
model.result('pg15').set('title', 'Piezoresistive signal (prestrain = eval(prestrain), disp = eval(disp))');
model.result('pg15').set('view', 'view20');
model.result('pg15').set('edgecolor', 'black');
model.result('pg15').set('showlegends', false);
model.result('pg15').feature('vol1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg15').feature('vol1').set('rangecoloractive', true);
model.result('pg15').feature('vol1').set('rangecolormin', -0.5651002684203452);
model.result('pg15').feature('vol1').set('rangecolormax', 0.5556424834936882);
model.result('pg15').feature('vol1').set('colortable', 'RainbowClassic');
model.result('pg15').feature('vol1').set('resolution', 'coarse');
model.result('pg15').feature('vol1').feature('def1').set('scale', 10);
model.result('pg15').feature('vol1').feature('def1').set('scaleactive', true);
model.result('pg23').label('sigma_x');
model.result('pg23').set('data', 'mir8');
model.result('pg23').set('looplevel', [1 1]);
model.result('pg23').set('titletype', 'none');
model.result('pg23').set('view', 'view20');
model.result('pg23').set('edges', false);
model.result('pg23').feature('vol1').set('descr', 'Stress tensor, Gauss point evaluation, x component');
model.result('pg23').feature('vol1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg23').feature('vol1').set('colortable', 'RainbowClassic');
model.result('pg23').feature('vol1').set('resolution', 'coarse');
model.result('pg24').label('sigma_y');
model.result('pg24').set('data', 'mir8');
model.result('pg24').set('looplevel', [1 1]);
model.result('pg24').set('titletype', 'none');
model.result('pg24').set('view', 'view20');
model.result('pg24').set('edges', false);
model.result('pg24').feature('vol1').set('descr', 'Stress tensor, Gauss point evaluation, y component');
model.result('pg24').feature('vol1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg24').feature('vol1').set('colortable', 'RainbowClassic');
model.result('pg24').feature('vol1').set('resolution', 'coarse');
model.result('pg26').label('Displacement');
model.result('pg26').set('data', 'mir8');
model.result('pg26').set('looplevel', [26 1]);
model.result('pg26').set('titletype', 'manual');
model.result('pg26').set('title', 'Displacement (prestrain = eval(prestrain), disp = eval(disp))');
model.result('pg26').set('view', 'view20');
model.result('pg26').set('edgecolor', 'black');
model.result('pg26').set('showlegends', false);
model.result('pg26').feature('vol1').set('descr', 'Displacement field, Z component');
model.result('pg26').feature('vol1').set('const', {'solid.refpntx' '0' 'Reference point for moment computation, x coordinate'; 'solid.refpnty' '0' 'Reference point for moment computation, y coordinate'; 'solid.refpntz' '0' 'Reference point for moment computation, z coordinate'});
model.result('pg26').feature('vol1').set('colortable', 'RainbowClassic');
model.result('pg26').feature('vol1').set('resolution', 'normal');
model.result('pg26').feature('vol1').feature('def1').set('scale', 6.697827339299535);
model.result('pg26').feature('vol1').feature('def1').set('scaleactive', false);
model.result('pg27').label('Output vs surface stress');
model.result('pg27').set('looplevelinput', {'all' 'manual'});
model.result('pg27').set('looplevel', {'1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26' '1, 4, 7, 10, 11, 12, 13'});
model.result('pg27').set('titletype', 'label');
model.result('pg27').set('xlabel', 'Surface stress (N/m)');
model.result('pg27').set('xlabelactive', true);
model.result('pg27').set('ylabel', 'Piezoresistive signal');
model.result('pg27').set('ylabelactive', true);
model.result('pg27').set('legendpos', 'lowerright');
model.result('pg27').feature('glob1').set('expr', {'(PR1-PR2)/2'});
model.result('pg27').feature('glob1').set('unit', {'1'});
model.result('pg27').feature('glob1').set('descr', {'Piezoresistive signal'});
model.result('pg27').feature('glob1').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z-coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z-coordinate'});
model.result('pg27').feature('glob1').set('xdata', 'expr');
model.result('pg27').feature('glob1').set('xdataexpr', 'sigma_s');
model.result('pg27').feature('glob1').set('xdataunit', 'N/m');
model.result('pg27').feature('glob1').set('xdatadescractive', true);
model.result('pg27').feature('glob1').set('xdatadescr', 'Surface stress');
model.result('pg27').feature('glob1').set('linewidth', 3);
model.result('pg27').feature('glob1').set('linewidthslider', 3);
model.result('pg27').feature('glob1').set('autodescr', false);
model.result('pg29').label('Displacement vs surface stress');
model.result('pg29').set('looplevelinput', {'all' 'manual'});
model.result('pg29').set('looplevel', {'1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26' '1, 4, 7, 10, 11, 12, 13'});
model.result('pg29').set('titletype', 'label');
model.result('pg29').set('xlabel', 'Surface stress (N/m)');
model.result('pg29').set('ylabel', ['Membrane displacement (' native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm)']);
model.result('pg29').set('xlabelactive', false);
model.result('pg29').set('ylabelactive', false);
model.result('pg29').feature('glob1').set('expr', {'aveop3(w)'});
model.result('pg29').feature('glob1').set('unit', {[native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']});
model.result('pg29').feature('glob1').set('descr', {'Membrane displacement'});
model.result('pg29').feature('glob1').set('const', {'shell.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'shell.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'shell.refpntz' '0' 'Reference point for moment computation, z-coordinate';  ...
'shell.z' '1' 'Local z-coordinate [-1,1] for thickness-dependent results';  ...
'solid.refpntx' '0' 'Reference point for moment computation, x-coordinate';  ...
'solid.refpnty' '0' 'Reference point for moment computation, y-coordinate';  ...
'solid.refpntz' '0' 'Reference point for moment computation, z-coordinate'});
model.result('pg29').feature('glob1').set('xdata', 'expr');
model.result('pg29').feature('glob1').set('xdataexpr', 'sigma_s');
model.result('pg29').feature('glob1').set('xdataunit', 'N/m');
model.result('pg29').feature('glob1').set('xdatadescractive', true);
model.result('pg29').feature('glob1').set('xdatadescr', 'Surface stress');
model.result('pg29').feature('glob1').set('linewidth', 3);
model.result('pg29').feature('glob1').set('linewidthslider', 3);
model.result('pg29').feature('glob1').set('autodescr', false);
model.result('pg28').label('Probe Plot Group 28');
model.result('pg28').set('xlabel', 'disp ');
model.result('pg28').set('windowtitle', 'Probe Plot 2');
model.result('pg28').set('xlabelactive', false);
model.result('pg28').feature('tblp1').label('Probe Table Graph 1');
model.result('pg28').feature('tblp1').set('legend', true);

out = model;
