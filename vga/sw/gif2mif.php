<?php

if (empty($argv[1])) {
    echo "Usage php gif2mif.php path/to/file.gif\n";
    exit(1);
}

$file = $argv[1];
if (!file_exists($file)) {
    echo "$file does not exist\n";
    exit(1);
}

$im = imagecreatefromgif($file);

//echo 'Total colors in image: ' . imagecolorstotal($im) . "\n";


$info = pathinfo($file);
$filename = $info['filename'];
$dir = $info['dirname'];

// Create the colour index mif.
$output_file = $dir . '/' . $filename . '_index.mif';
if (!$fp = fopen($output_file, "w")) {
    exit("unable to open output file: $output_file.\n");
}

$init = '
WIDTH = 24;
DEPTH = 256;

ADDRESS_RADIX = UNS;
DATA_RADIX = UNS;

CONTENT BEGIN
';
write($fp, $init);

for( $i = 0; $i < imagecolorstotal($im); $i++) {
    $colour = imagecolorsforindex($im, $i);  //get color at index 'i' in the color table
    $r = dechex($colour['red']);
    $g = dechex($colour['green']);
    $b = dechex($colour['blue']);
    write($fp, "$i : $r$g$b;\n");
}

write($fp, "END;\n");
fclose($fp);

// Create the image data mif.
$output_file = $dir . '/' . $filename . '_data.mif';
if (!$fp = fopen($output_file, "w")) {
    exit("unable to open output file: $output_file.\n");
}

// 800x480 screen
$init = '
WIDTH = 8;
DEPTH = 384000;

ADDRESS_RADIX = UNS;
DATA_RADIX = HEX;

CONTENT BEGIN
';
write($fp, $init);

$width = imagesx($im);
$height = imagesy($im);
$i = 0;
for ($x = 0; $x < $width; $x++) {
    for ($y = 0; $y < $height; $y++) {
        $val = imagecolorat($im, $x, $y);
        write($fp, "$i : $val;\n");
        $i++;
    }
}

if ($i < 384000) {
    write($fp, '[' . $i . '..383999] : 000000;' . "\n");
}
write($fp, "END;\n");

// Free image
imagedestroy($im);

function write($fp, $data) {
    //echo $data;
    if (fwrite($fp, $data) === FALSE) {
        exit("Unable to write to output file.\n");
    }
}
