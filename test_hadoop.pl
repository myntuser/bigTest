#!/usr/bin/perl

use strict;
use warnings;
use Test::Simple tests=>10;

my $command = `which hadoop`;

ok($command =~ m/hadoop/i, "Hadoop is installed");
ok(-d "/home/rakesh/hadoop/tmp", "Temporary directory for hadoop is set");
ok(-d "/home/rakesh/hadoop/namenode", "Namenode directory for hadoop is set");
ok(-d "/home/rakesh/hadoop/datanode", "Datanode directory for hadoop is set");

# Start hadoop hdfs file system.
#exec("bash start-dfs.sh");
$command = `jps | grep NameNode`;
#print $command;
ok(`jps | grep -F NameNode` =~ m/.*/, "Namenode is running successfully");
ok(`jps | grep -F SecondaryNamenode` =~ m/.*/, "SecondaryNamenode is running successfully");
ok(`jps | grep -F DataNode` =~ m/.*/, "DataNode is running successfully");
ok(defined $ENV{'HADOOP_HOME'}, "HADOOP_HOME env is defined");
ok(defined $ENV{'HADOOP_USER_CLASSPATH_FIRST'}, "Hadoop class path is set");
ok($ENV{'PATH'} =~ m/.*hadoop.*\/bin/, "HADOOP_HOME is set to the path");

# Checking for settings in the hadoop configuration file




