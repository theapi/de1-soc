<?php

if (empty($argv[1])) {
    echo "Usage php img_send.php path/to/file.jpg\n";
    exit(1);
}

$file = $argv[1];
if (!file_exists($file)) {
    echo "$file does not exist\n";
    exit(1);
}


$im = imagecreatefromjpeg($file);
for ($x=0; $x<800; ++$x) {
    for ($y=0; $y<640; ++$y) {
        $rgb = imagecolorat($im, $x, $y);
        $colors = imagecolorsforindex($im, $rgb);
        foreach ($colors as $k => $v) {
          var_dump($colors);
            if ($k != 'a') {
                //echo $v;
            }
        }
    }
}

