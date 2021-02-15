[![Build Status](https://travis-ci.org/jmaslak/Raku-App-Heater.svg?branch=master)](https://travis-ci.org/jmaslak/Raku-App-Heater)

POD
===

NAME
====

`heater.raku` - Raku-based Foot Warmer

SYNOPSIS
========

    heater.raku

DESCRIPTION
===========

This program was written during a period of brutally cold weather, when the author was trying to figure out how to keep her feet warm. Since her computer is on the floor by her feet, and because she knows that the busier the CPU, the more heat generated, she wrote this module to load up the CPU.

CAVEATS
=======

Obviously your electrical usage footprint (no pun intended) will increase if you run this program. That said, I believe this program is only slightly less efficient to turn your computer into a space heater than an actual space heater of the same wattage would be (I.E. energy used for "useful work" on the computer like sending signals to your monitor or lighting the power LED would not be turned into heat, while an electric space heater has even less of these "housekeeping" functions). In practice, I believe the energy difference to be negligable.

Only use this if your feet are cold!

USAGE
=====

ARGUMENTS
---------

### `processes`

    heater.raku --processes=3

Sets the number of "heater" threads to start. This defaults to the number of CPU cores in the machine, determined by `$*KERNEL.cpu-cores`.

AUTHOR
======

Joelle Maslak `jmaslak@antelope.net`

LEGAL
=====

Licensed under the same terms as Raku.

Copyright © 2021 by Joelle Maslak

