# SVGDiagrams.pl

sub _init_SVGDiagrams {

 #Possibly add initialization code here
 #sub routine is not required, but prevents the macro from being re-loaded

}


sub BinaryTree {
    my $label1 = shift;
    my $root = 20;
    my $branch1 = 20;
    my $branch1end = $root + $branch1;
    my $pos1 = shift;
    my $neg1 = shift;
    my $label1width = shift;
    my $label1mid = $branch1end + $label1width/2;
    my $label1end = $branch1end + $label1width;
    my $branch2 = 20;
    my $branch2end = $label1end + $branch2;
    my $label2 = shift;
    my $pos2 = shift;
    my $neg2 = shift;
    my $label2width = shift;
    my $label2mid = $branch2end + $label2width/2;
    my $label2end = $branch2end + $label2width;

    my $diagram = "
<svg xmlns = 'http://www.w3.org/2000/svg' width='520' height='220' overflow='auto'>
    <path d='M $root 130 l $branch1 -50' stroke='black'/>
    <path d='M $branch1end 80 h $label1width' stroke-dasharray='4' stroke='black'/>
    <path d='M $label1end 80 l $branch2 -25' stroke='black'/>
    <path d='M $label1end 80 l $branch2 25' stroke='black'/>
    <path d='M $branch2end 55 h $label2width' stroke-dasharray='4' stroke='black'/>
    <path d='M $branch2end 105 h $label2width' stroke-dasharray='4' stroke='black'/>
    <path d='M $root 130 l $branch1 50' stroke='black'/>
    <path d='M $branch1end 180 h $label1width' stroke-dasharray='4' stroke='black'/>
    <path d='M $label1end 180 l $branch2 -25' stroke='black'/>
    <path d='M $label1end 180 l $branch2 25' stroke='black'/>
    <path d='M $branch2end 155 h $label2width' stroke-dasharray='4' stroke='black'/>
    <path d='M $branch2end 205 h $label2width' stroke-dasharray='4' stroke='black'/>
    <text x='$label1mid' y='10' font-size='14' text-anchor='middle' stroke='blue'>$label1</text>
    <text x='$label2mid' y='10' font-size='14' text-anchor='middle' stroke='blue'>$label2</text>
    <foreignObject x='$branch1end' y='50' width='$label1width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
            $pos1 " . NAMED_ANS_RULE("first_yes",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$branch2end' y='25' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        $pos2 " . NAMED_ANS_RULE("positive_given_yes",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$branch2end' y='75' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        $neg2 " . NAMED_ANS_RULE("negative_given_yes",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$branch1end' y='150' width='$label1width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
            $neg1 " . NAMED_ANS_RULE("first_no",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$branch2end' y='125' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        $pos2 " . NAMED_ANS_RULE("positive_given_no",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$branch2end' y='175' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        $neg2 " . NAMED_ANS_RULE("negative_given_no",5) . "
        </body>
    </foreignObject>
    <foreignObject x='$label2end' y='40' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        &nbsp;" . NAMED_ANS_RULE("positive_and_yes",8) . "
        </body>
    </foreignObject>
    <foreignObject x='$label2end' y='90' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        &nbsp;" . NAMED_ANS_RULE("negative_and_yes",8) . "
        </body>
    </foreignObject>
    <foreignObject x='$label2end' y='140' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        &nbsp;" . NAMED_ANS_RULE("positive_and_no",8) . "
        </body>
    </foreignObject>
    <foreignObject x='$label2end' y='190' width='$label2width' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
        &nbsp;" . NAMED_ANS_RULE("negative_and_no",8) . "
        </body>
    </foreignObject>
</svg>";

    return $diagram;
}

sub VennDiagram {
    my $leftlabel = shift;
    my $rightlabel = shift;

    return "
<svg xmlns = 'http://www.w3.org/2000/svg' width='520' height='200' overflow='auto'>
    <ellipse cx='170' cy='95' rx='150' ry='75' fill='transparent' stroke='#000000'/>
    <ellipse cx='350' cy='95' rx='150' ry='75' fill='transparent' stroke='#000000'/>
    <text x='70' y='30' font-size='12' text-anchor='end'>$leftlabel</text>
    <text x='450' y='30' font-size='12' text-anchor='start'>$rightlabel</text>
    <foreignObject x='75' y='80' width='75' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
" . NAMED_ANS_RULE('left_area',5) . "
        </body>
    </foreignObject>
    <foreignObject x='220' y='80' width='75' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
" . NAMED_ANS_RULE('intersection',5) . "
        </body>
    </foreignObject>
    <foreignObject x='350' y='80' width='75' height='30'>
        <body xmlns='http://www.w3.org/1999/xhtml'>
" . NAMED_ANS_RULE('right_area',5) . "
        </body>
    </foreignObject>
</svg>";
}

1;
