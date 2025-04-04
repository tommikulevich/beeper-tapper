# ==============
# = GDB Config =
# ==============

tui enable
tui new-layout pro {-horizontal src 1 asm 1} 2 status 0 cmd 1
layout pro
load
break main
continue