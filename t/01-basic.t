use v6.c;
use Test;
use App::Heater;

sub tests {
    my $heat = App::Heater.new;
    is $heat.processes, $*KERNEL.cpu-cores, "Processes = CPU Cores";

    $heat = App::Heater.new(:300processes);
    is $heat.processes, 300, "Processes = 300";

    $heat = App::Heater.new;
    $heat.processes = 301;
    is $heat.processes, 301, "Processes = 301";

    done-testing;
}

tests();

