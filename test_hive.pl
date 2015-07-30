#!/usr/bin/perl

use strict;
use warnings;
use Test::Simple tests=>5;

my $which_hive = `which hive`;

# tests
ok($which_hive =~ m/hive/i, "Hive is installed in the drive");
ok(defined $ENV{'HIVE_HOME'}, "HIVE_HOME is set");
ok(defined $ENV{'HADOOP_HOME'}, "HADOOP_HOME is set");
ok(defined $ENV{'JAVA_HOME'}, "JAVA_HOME is set");
ok(-d "/home/rakesh/metastore_db", "The db folder is set");

my $command = `jps`;
my @process = split /\n/, $command;
for my $p ('NameNode', 'DataNode', 'SecondaryNameNode') {
	if(not grep(/$p/, @process)) {
		print 'Hadoop process not running properly for hive';
		exit;
	}
}


