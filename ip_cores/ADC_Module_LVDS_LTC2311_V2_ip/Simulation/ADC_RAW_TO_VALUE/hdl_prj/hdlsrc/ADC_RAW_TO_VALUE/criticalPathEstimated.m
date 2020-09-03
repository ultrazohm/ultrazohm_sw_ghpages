open_system('gm_ADC_RAW_TO_VALUE');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/ProductConv', 'user2');
annotate_port('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/ProductConv', 0, 1, 'cp : 4.302 ns');
cs.HiliteType = 'user1';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'blue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/PipelineRegister', 'user1');
annotate_port('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/PipelineRegister', 1, 1, 'cp : 4.302 ns');
cs.HiliteType = 'user1';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'blue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/HwModeRegister', 'user1');
annotate_port('gm_ADC_RAW_TO_VALUE/ADC_RAW_TO_VALUE/HwModeRegister', 0, 1, 'cp : 0.298 ns');
