#!/usr/bin/env perl
$latex = 'platex -synctex=1 -halt-on-error %O %S';
$latex_silent = 'platex -synctex=1 -halt-on-error -interaction=nonstopmode %O %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'pbibtex -kanji=utf8 -halt-on-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$makeindex = 'upmendex %O -o %D %S';
$pdf_mode = 3;
