#
# Copyright © 2021 Joelle Maslak
# All Rights Reserved
#
use v6.c;

class App::Heater:ver<0.0.1>:auth<cpan:JMASLAK> {
    use P5getpriority;

    has UInt:D $.processes is rw = $*KERNEL.cpu-cores;

    method heat(Bool:D $TESTING = False -->Nil) {
        try {
            setpriority 0, $*PID, 19;  # Make the process "nice"
        }
        self.start-heat-threads();
        sleep() unless $TESTING;
    }

    method start-heat-threads() {
        for (^self.processes) {
            start {
                sleep 1;  # Without this, sometimes all threads don't start
                loop {}
            }
        }
    }
}

=begin POD

=head1 NAME

C<App::Heater> - Raku-based Foot Warmer

=head1 SYNOPSIS

  my $heater = App::Heater.new;
  $heater.heat;

=head1 DESCRIPTION

This program was written during a period of brutally cold weather, when the
author was trying to figure out how to keep her feet warm. Since her computer
is on the floor by her feet, and because she knows that the busier the CPU,
the more heat generated, she wrote this module to load up the CPU.

=head1 CAVEATS

Obviously your electrical usage footprint (no pun intended) will increase if
you run this program.  That said, I believe this program is only slightly less
efficient to turn your computer into a space heater than an actual space
heater of the same wattage would be (I.E. energy used for "useful work" on
the computer like sending signals to your monitor or lighting the power LED
would not be turned into heat, while an electric space heater has even less of
these "housekeeping" functions).  In practice, I believe the energy difference
to be negligable.

Only use this if your feet are cold!

=head1 USAGE

=head2 ATTRIBUTES

=head3 C<processes>

  $heater.processes = 3;
  say "Heating using " ~ $heater.processes;

Determines the number of "heater" threads to start.  This defaults to the
number of CPU cores in the machine, determined by C<$*KERNEL.cpu-cores>.

=head2 METHODS

=head3 C<heat>

  $heater.heat;

This starts the heater.  It will continue running until the process is killed,
usually with a control-C character.  When possible, the program will attempt
to run "nicely," I.E. at a CPU priority below interactive programs, to not
interfere with the overall performance of the machine.
    
=head3 C<start-heat-threads>

  $heater.start-heat-threads;

This starts the background heat threads.  Note that it will not adjust the
process CPU priority, and will immedaitely (or close to it) return, leaving
the threads running in the background.  Multiple calls will execute the
heater threads multiple times.

=head1 AUTHOR

Joelle Maslak C<<jmaslak@antelope.net>>

=head1 LEGAL

Licensed under the same terms as Raku.

Copyright © 2021 by Joelle Maslak

=end POD
