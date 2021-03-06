#!/usr/bin/perl
# Do not normalise this test file. It has deliberately unnormalised characters in it.
use v5.10;
use strict;
use warnings;
use utf8;
use if $^V ge v5.12.0, feature => 'unicode_strings';

use Test::More tests => 57;
use Test::Exception;

use ok 'Locale::CLDR';

my $locale = Locale::CLDR->new('bg');
my $months = $locale->month_format_wide();
is_deeply ($months, [qw( януари февруари март април май юни юли август септември октомври ноември декември )], 'Month format wide');
$months = $locale->month_format_abbreviated();
is_deeply ($months, [qw( ян. февр. март апр. май юни юли авг. септ. окт. ноем. дек. )], 'Month format abbreviated');
$months = $locale->month_format_narrow();
is_deeply ($months, [qw( я ф м а м ю ю а с о н д )], 'Month format narrow');
$months = $locale->month_stand_alone_wide();
is_deeply ($months, [qw( януари февруари март април май юни юли август септември октомври ноември декември )], 'Month stand alone wide');
$months = $locale->month_stand_alone_abbreviated();
is_deeply ($months, [qw( ян. февр. март апр. май юни юли авг. септ. окт. ноем. дек. )], 'Month stand alone abbreviated');
$months = $locale->month_stand_alone_narrow();
is_deeply ($months, [qw( я ф м а м ю ю а с о н д )], 'Month stand alone narrow');

my $days = $locale->day_format_wide();
is_deeply ($days, [qw( понеделник вторник сряда четвъртък петък събота неделя )], 'Day format wide');
$days = $locale->day_format_abbreviated();
is_deeply ($days, [qw( пн вт ср чт пт сб нд )], 'Day format abbreviated');
$days = $locale->day_format_narrow();
is_deeply ($days, [qw( п в с ч п с н )], 'Day format narrow');
$days = $locale->day_stand_alone_wide();
is_deeply ($days, [qw( понеделник вторник сряда четвъртък петък събота неделя )], 'Day stand alone wide');
$days = $locale->day_stand_alone_abbreviated();
is_deeply ($days, [qw( пн вт ср чт пт сб нд )], 'Day stand alone abbreviated');
$days = $locale->day_stand_alone_narrow();
is_deeply ($days, [qw( п в с ч п с н )], 'Day stand alone narrow');

my $quarters = $locale->quarter_format_wide();
is_deeply ($quarters, [ '1. тримесечие', '2. тримесечие', '3. тримесечие', '4. тримесечие' ], 'Quarter format wide');
$quarters = $locale->quarter_format_abbreviated();
is_deeply ($quarters, [ '1. трим.', '2. трим.', '3. трим.', '4. трим.' ], 'Quarter format abbreviated');
$quarters = $locale->quarter_format_narrow();
is_deeply ($quarters, [qw( 1 2 3 4 )], 'Quarter format narrow');
$quarters = $locale->quarter_stand_alone_wide();
is_deeply ($quarters, [ '1. тримесечие', '2. тримесечие', '3. тримесечие', '4. тримесечие' ], 'Quarter stand alone wide');
$quarters = $locale->quarter_stand_alone_abbreviated();
is_deeply ($quarters, [ '1. трим.', '2. трим.', '3. трим.', '4. трим.' ], 'Quarter stand alone abbreviated');
$quarters = $locale->quarter_stand_alone_narrow();
is_deeply ($quarters, [qw( 1 2 3 4 )], 'Quarter stand alone narrow');

my $am_pm = $locale->am_pm_wide();
is_deeply ($am_pm, [qw( пр.об. сл.об. )], 'AM PM wide');
$am_pm = $locale->am_pm_abbreviated();
is_deeply ($am_pm, [qw( пр.об. сл.об. )], 'AM PM abbreviated');
$am_pm = $locale->am_pm_narrow();
is_deeply ($am_pm, [qw( пр.об. сл.об. )], 'AM PM narrow');
$am_pm = $locale->am_pm_format_wide();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пладне', pm => 'сл.об.' }, 'AM PM format wide');
$am_pm = $locale->am_pm_format_abbreviated();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пладне', pm => 'сл.об.' }, 'AM PM format abbreviated');
$am_pm = $locale->am_pm_format_narrow();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пл.', pm => 'сл.об.' }, 'AM PM format narrow');
$am_pm = $locale->am_pm_stand_alone_wide();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пладне', pm => 'сл.об.' }, 'AM PM stand alone wide');
$am_pm = $locale->am_pm_stand_alone_abbreviated();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пладне', pm => 'сл.об.' }, 'AM PM stand alone abbreviated');
$am_pm = $locale->am_pm_stand_alone_narrow();
is_deeply ($am_pm, { am => 'пр.об.', noon => 'пл.', pm => 'сл.об.' }, 'AM PM stand alone narrow');

my $era = $locale->era_wide();
is_deeply ($era, [ 'преди Христа', 'след Христа'], 'Era wide');
$era = $locale->era_abbreviated();
is_deeply ($era, [qw( пр.Хр. сл.Хр. )], 'Era abbreviated');
$era = $locale->era_narrow();
is_deeply ($era, [undef, qw( сл.н.е. )], 'Era narrow');
$era = $locale->era_format_wide();
is_deeply ($era, [ 'преди Христа', 'след Христа' ], 'Era format wide');
$era = $locale->era_format_abbreviated();
is_deeply ($era, [qw( пр.Хр. сл.Хр. )], 'Era format abbreviated');
$era = $locale->era_format_narrow();
is_deeply ($era, [undef, qw( сл.н.е. )], 'Era format narrow');
$era = $locale->era_stand_alone_wide();
is_deeply ($era, [ 'преди Христа', 'след Христа' ], 'Era stand alone wide');
$era = $locale->era_stand_alone_abbreviated();
is_deeply ($era, [qw( пр.Хр. сл.Хр. )], 'Era stand alone abbreviated');
$era = $locale->era_stand_alone_narrow();
is_deeply ($era, [undef, qw( сл.н.е. )], 'Era stand alone narrow');

# Warning this does not work with the current data set
my $day_period_data = $locale->get_day_period('0000');
is($day_period_data, undef(), 'Day period data AM');
$day_period_data = $locale->get_day_period('1200');
is($day_period_data, 'пладне', 'Day period data Noon');
$day_period_data = $locale->get_day_period('1210');
is($day_period_data, undef(), 'Day period data PM');

my $date_format = $locale->date_format_full;
is($date_format, 'EEEE, d MMMM y \'г\'.', 'Date Format Full');
$date_format = $locale->date_format_long;
is($date_format, 'd MMMM y \'г\'.', 'Date Format Long');
$date_format = $locale->date_format_medium;
is($date_format, 'd.MM.y \'г\'.', 'Date Format Medium');
$date_format = $locale->date_format_short;
is($date_format, 'd.MM.yy \'г\'.', 'Date Format Short');

my $time_format = $locale->time_format_full;
is($time_format, 'H:mm:ss zzzz', 'Time Format Full');
$time_format = $locale->time_format_long;
is($time_format, 'H:mm:ss z', 'Time Format Long');
$time_format = $locale->time_format_medium;
is($time_format, 'H:mm:ss', 'Time Format Medium');
$time_format = $locale->time_format_short;
is($time_format, 'H:mm', 'Time Format Short');

my $date_time_format = $locale->datetime_format_full;
is($date_time_format, "EEEE, d MMMM y \'г\'., H:mm:ss zzzz", 'Date Time Format Full');
$date_time_format = $locale->datetime_format_long;
is($date_time_format, "d MMMM y \'г\'., H:mm:ss z", 'Date Time Format Long');
$date_time_format = $locale->datetime_format_medium;
is($date_time_format, 'd.MM.y \'г\'., H:mm:ss', 'Date Time Format Medium');
$date_time_format = $locale->datetime_format_short;
is($date_time_format, 'd.MM.yy \'г\'., H:mm', 'Date Time Format Short');

is ($locale->prefers_24_hour_time(), 1, 'Prefers 24 hour time');
is ($locale->first_day_of_week(), 1, 'First day of week recoded for DateTime');

is($locale->era_boundry( gregorian => -12 ), 0, 'Gregorian era');
is($locale->era_boundry( japanese => 9610217 ), 38, 'Japanese era');

is($locale->week_data_min_days(), 4, 'Number of days a week must have in GB before it counts as the first week of a year');