// Hillshading //

/*#hillshade {
  ::0[zoom<=13],
  ::1[zoom=14],
  ::2[zoom>=15][zoom<=16],
  ::3[zoom>=17][zoom<=18],
  ::4[zoom>=19] {
    comp-op: hard-light;
    polygon-clip: false;
    image-filters-inflate: true;
    [class='full_shadow'] {
      polygon-fill: #103;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_shadow'] {
      polygon-fill: #206;
      polygon-opacity: 0.08;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.075; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.05; }
      [zoom>=18] { polygon-opacity: 0.025; }
    }
    [class='medium_highlight'] {
      polygon-fill: #ffb;
      polygon-opacity: 0.2;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
    [class='full_highlight'] {
      polygon-fill: #ffd;
      polygon-opacity: 0.25;
      [zoom>=15][zoom<=16] { polygon-opacity: 0.3; }
      [zoom>=17][zoom<=18] { polygon-opacity: 0.2; }
      [zoom>=18] { polygon-opacity: 0.1; }
    }
  }
  ::1 { image-filters: agg-stack-blur(2,2); }
  ::2 { image-filters: agg-stack-blur(8,8); }
  ::3 { image-filters: agg-stack-blur(16,16); }
  ::4 { image-filters: agg-stack-blur(32,32); }
}*/

#hillshade{
  [class='shadow'] {
    //polygon-fill: fadeout(@contour,80%);
    [zoom<=8]{ polygon-fill: #d2cbc9; }
    [zoom>8] { polygon-fill: #e0e0e0; }
    polygon-comp-op: multiply;
    [level=89] { polygon-opacity: 0.15; }
    [level=78] { polygon-opacity: 0.3; }
    [level=67] { polygon-opacity: 0.4; }
    [level=56] { polygon-opacity: 0.6; }
  }
}

#contour.line {
  [zoom<=11],
  [zoom=12][index=2],
  [zoom=12][index=10],
  [zoom>=13][index=5],
  [zoom>=13][index=10]{
    line-color: @contour;
    line-opacity: 1;
    line-width: 0.2;
    [zoom=10]{ line-width: 0.3;}
    [zoom=11]{ line-width: 0.4;}
    [zoom=12]{ line-width: 0.6;}
    [zoom=13]{ line-width: 0.8;}
    [zoom>=14]{ line-width: 1.0;}
  }
  // blue hypsometric
  ::hypso{
    //polygon-fill: #aaf;
    //polygon-opacity: 0.1;
    //polygon-comp-op: multiply;
    polygon-fill: #fff;
    [ele>=100]{ polygon-fill: @1; }
    [ele>=200]{ polygon-fill: @2; }
    [ele>=400]{ polygon-fill: @3; }
    [ele>=600]{ polygon-fill: @4; }
    [ele>=800]{ polygon-fill: @5; }
    [ele>=1000]{ polygon-fill: @6; }
    [ele>=1200]{ polygon-fill: @7; }
    [ele>=1400]{ polygon-fill: @8; }
    [ele>=1600]{ polygon-fill: @9; }
    [ele>=1800]{ polygon-fill: @10; }
    [ele>=2000]{ polygon-fill: @11; }
    [ele>=2200]{ polygon-fill: @12; }
    [ele>=2400]{ polygon-fill: @13; }
    [ele>=2600]{ polygon-fill: @14; }
    [ele>=2800]{ polygon-fill: @15; }
    [ele>=3000]{ polygon-fill: @16; }
    [ele>=3200]{ polygon-fill: @17; }
    [ele>=3400]{ polygon-fill: @18; }
    [ele>=3600]{ polygon-fill: @19; }
    [ele>=3800]{ polygon-fill: @20; }
    [ele>=4000]{ polygon-fill: @21; }
    [ele>=4200]{ polygon-fill: @22; }
    [ele>=4400]{ polygon-fill: @23; }
    [ele>=4600]{ polygon-fill: @24; }
    [ele>=4800]{ polygon-fill: @25; }
    [ele>=5000]{ polygon-fill: @26; }
    [ele>=5200]{ polygon-fill: @27; }
    [ele>=5400]{ polygon-fill: @28; }
    [ele>=5600]{ polygon-fill: @29; }
    [ele>=5800]{ polygon-fill: @30; }
    [ele>=6000]{ polygon-fill: @31; }
    [ele>=6200]{ polygon-fill: @32; }
    [ele>=6400]{ polygon-fill: @33; }
    [ele>=6600]{ polygon-fill: @34; }
    [ele>=6800]{ polygon-fill: @35; }
    [ele>=7000]{ polygon-fill: #fff; }
  }
}

// Elevation contours & labels //

// Multiple copies of the same layer have been made, each with
// unique classes and positions in the stack. This is done by
// editing the layers list in <project.yml>.

#contour.line::line {
  line-color: #000;
  line-opacity: 0.1;
  line-width: 1.2;
  [index>=5] {
    line-opacity: 0.2;
    line-width: 1.2;
  }
}

#contour.label::label[ele!=0] {
  [zoom<=12][index>=5],
  [zoom>=13][zoom<=15][index=10],
  [zoom>=16][index>=5] {
    text-name: "[ele]+' m'";
    text-face-name: 'Open Sans Regular';
    text-placement: line;
    text-size: 8;
    text-fill: #444;
    text-avoid-edges: true;
    //text-halo-fill: white;
    //text-halo-comp-op: multiply;
    //text-halo-radius: 1.0;
    //text-halo-rasterizer: fast;
  }
}
