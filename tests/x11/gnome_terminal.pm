# SUSE's openQA tests
#
# Copyright © 2009-2013 Bernhard M. Wiedemann
# Copyright © 2012-2016 SUSE LLC
#
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.  This file is offered as-is,
# without any warranty.

use base "x11test";
use strict;
use testapi;

# test gnome-terminal

# this part contains the steps to run this test
sub run() {
    my $self = shift;
    mouse_hide(1);
    x11_start_program("gnome-terminal");
    sleep 10;
    send_key "ctrl-shift-t";
    for (1 .. 13) { send_key "ret" }
    type_string "echo If you can see this text gnome-terminal is working.\n";
    sleep 2;
    assert_screen 'test-gnome_terminal-1', 3;
    sleep 2;
    send_key "alt-f4";
    sleep 2;
}

1;
# vim: set sw=4 et:
