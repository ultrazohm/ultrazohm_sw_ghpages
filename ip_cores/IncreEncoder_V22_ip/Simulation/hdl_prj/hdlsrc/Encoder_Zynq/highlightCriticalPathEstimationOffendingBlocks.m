open_system('Encoder_Zynq');
open_system('gm_Encoder_Zynq');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_Encoder_Zynq/IncreEncoder_V22/HDL Reciprocal', 'user2');
annotate_port('gm_Encoder_Zynq/IncreEncoder_V22/HDL Reciprocal', 1, 1, 'Block not characterized');
hilite_system('Encoder_Zynq/IncreEncoder_V22/HDL Reciprocal', 'user2');
annotate_port('Encoder_Zynq/IncreEncoder_V22/HDL Reciprocal', 1, 1, 'Block not characterized');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'gray';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_Encoder_Zynq/IncreEncoder_V22/Average/Add', 'user2');
annotate_port('gm_Encoder_Zynq/IncreEncoder_V22/Average/Add', 1, 1, 'Block not characterized');
hilite_system('Encoder_Zynq/IncreEncoder_V22/Average/Add', 'user2');
annotate_port('Encoder_Zynq/IncreEncoder_V22/Average/Add', 1, 1, 'Block not characterized');
