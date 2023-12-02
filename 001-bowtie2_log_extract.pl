my $text = "392244868 reads; of these:
  392244868 (100.00%) were paired; of these:
    173491602 (44.23%) aligned concordantly 0 times
    48986691 (12.49%) aligned concordantly exactly 1 time
    169766575 (43.28%) aligned concordantly >1 times
    ----
    173491602 pairs aligned concordantly 0 times; of these:
      15392770 (8.87%) aligned discordantly 1 time
    ----
    158098832 pairs aligned 0 times concordantly or discordantly; of these:
      316197664 mates make up the pairs; of these:
        144945304 (45.84%) aligned 0 times
        11059907 (3.50%) aligned exactly 1 time
        160192453 (50.66%) aligned >1 times
81.52% overall alignment rate";
my @lines = split("\n", $text);
if (scalar @lines > 0) {
    my $first_line = $lines[0];
    if ($first_line =~ /(\d+)/) {
        $number1 = $1;
        $number2 = $1*2;
    }
    my $four_line = $lines[3];
    if ($four_line =~ /(\d+)\s+\((\d+\.\d+%)\)/) {
            $number3 = $1*2;
            $number4 = $2;
    }
    my $seven_line = $lines[7];
    if ($seven_line =~ /(\d+)\s+\((\d+\.\d+%)\)/) {
            $number5 = $1*2;
            $number6 = $number5*100/$number2;
            $number6 = sprintf("%.2f%", $number6);
    }
    my $thirteen_line = $lines[12];
    if ($thirteen_line =~ /(\d+)\s+\((\d+\.\d+%)\)/) {
            $number7 = $1;
            $number8 = $number7*100/$number2;
            $number8 = sprintf("%.2f%", $number8);
    }
    my $five_line = $lines[4];
    if ($five_line =~ /(\d+)\s+\((\d+\.\d+%)\)/) {
            $number9 = $1*2;
            $number10 = $2;
    }
    my $fourteen_line = $lines[13];
    if ($fourteen_line =~ /(\d+)\s+\((\d+\.\d+%)\)/) {
            $number11 = $1;
            $number12 = $number11*100/$number2;
            $number12 = sprintf("%.2f%", $number12);
    }
    $number13 = $number10 + $number12;
    $number13 = sprintf("%.2f%", $number13);
    $number14 = $number4 + $number6 + $number8;
    $number14 = sprintf("%.2f%", $number13 + $number14);
    $number15 = sprintf("%.2f%", 100 - $number14);
    print "$number1\t$number2\t$number3\t$number4\t$number5\t$number6\t$number7\t$number8\t$number9\t$number10\t$number11\t$number12\t$number13\t$number14\t$number15\n";
}
