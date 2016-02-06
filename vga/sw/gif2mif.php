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

// Create the colour index mif.
for( $i = 0; $i < imagecolorstotal($im); $i++) {
    $colour = imagecolorsforindex($im, $i);  //get color at index 'i' in the color table
    var_dump($colour);
    // @todo wrte to the mif
}

// Create the image mif.
$width = imagesx($im);
$height = imagesy($im);
for ($x = 0; $x < $width; $x++) {
    for ($y = 0; $y < $height; $y++) {
        $rgb = imagecolorat($im, $x, $y);
          var_dump($rgb);
        // @todo write to the mif
    }
}


// Free image
imagedestroy($im);
