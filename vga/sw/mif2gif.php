<?php

if (empty($argv[1])) {
    echo "Usage php mif2gif.php path/to/index.mif path/to/data.mif\n";
    exit(1);
}

if (empty($argv[2])) {
    echo "Usage php mif2gif.php path/to/index.mif path/to/data.mif\n";
    exit(1);
}

$index_file = $argv[1];
if (!file_exists($index_file)) {
    echo "$index_file does not exist\n";
    exit(1);
}

$data_file = $argv[2];
if (!file_exists($data_file)) {
    echo "$data_file does not exist\n";
    exit(1);
}

// Read the index data into an array.
$index = array();
$lines = file($index_file, FILE_IGNORE_NEW_LINES);
$begun = false;
foreach( $lines as $i => $line) {
    if ($line == 'END;') {
        $begun = false;
    }

    if ($begun) {
        $parts = explode(':', $line);
        $h_i = trim($parts[0]);
        $hex = trim($parts[1], ' ;\t\n\r');

        // Swap the colours as the demo file is not RGB.
        //$colour = hexdec($hex[2] . $hex[3] . $hex[0] . $hex[1] . $hex[4] . $hex[5]);
        //$colour = hexdec($hex[4] . $hex[5] . $hex[0] . $hex[1] . $hex[2] . $hex[3]);
        //$colour = hexdec($hex[4] . $hex[5] . $hex[2] . $hex[3] . $hex[0] . $hex[1]);

        $colour = hexdec($hex);
        $i = hexdec($h_i);
        $index[$i] = $colour;
        print "$h_i : $hex\n";
    }

    if ($line == 'CONTENT BEGIN') {
        $begun = true;
    }
}

//$width = 640;
$width = 800;
$height = 480;
$x = 0;
$y = 0;
$im = imagecreatetruecolor($width, $height);


// Build the image.
$lines = file($data_file, FILE_IGNORE_NEW_LINES);
$begun = false;

foreach( $lines as $i => $line) {
    if ($line == 'END;') {
        $begun = false;
    }

    if ($begun) {
        $parts = explode(':', $line);
        $i = hexdec(trim($parts[1], ' ;\t\n\r'));
        $colour = $index[$i];
        //print "$x x $y : $colour\n";

        imagesetpixel($im, $x, $y, $colour);

        $x++;
        if ($x == $width) {
            $x = 0;
            $y++;
        }
    }

    if ($line == 'CONTENT BEGIN') {
        $begun = true;
    }
}

$output_file = 'out.gif';
imagegif($im, $output_file);
// Free image
imagedestroy($im);
