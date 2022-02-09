open_system('gm_mux_axi');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Subsystem1', 'user2');
annotate_port('gm_mux_axi/mux_axi/Subsystem1', 1, 1, 'cp : 4.24 ns');
cs.HiliteType = 'user1';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'blue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Multiport Switch', 'user1');
annotate_port('gm_mux_axi/mux_axi/Multiport Switch', 0, 1, 'cp : 1.876 ns');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive', 'user2');
annotate_port('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive', 0, 1, 'cp : 4.21 ns');
cs.HiliteType = 'user1';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'blue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Subsystem1/PipelineDelay', 'user1');
annotate_port('gm_mux_axi/mux_axi/Subsystem1/PipelineDelay', 1, 1, 'cp : 4.24 ns');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive/FixPt Relational Operator', 'user2');
annotate_port('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive/FixPt Relational Operator', 0, 1, 'cp : 4.21 ns');
cs.HiliteType = 'user2';
cs.ForegroundColor = 'black';
cs.BackgroundColor = 'lightblue';
set_param(0, 'HiliteAncestorsData', cs);
hilite_system('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive/Positive', 'user2');
annotate_port('gm_mux_axi/mux_axi/Subsystem1/Detect Rise Positive/Positive', 0, 1, 'cp : 3.043 ns');
