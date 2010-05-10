#!/usr/bin/perl -w

sub processSpaces
{
    my $seq = shift;
    my @spaces;
    
    my $cleanSeq = "";
    my $len = length($seq);
    
    my $startOfTheRun = 0;
    my $onTheRun = 0;  
    
    for $i (0..$len)
    {   
        my $char = substr($seq, $i, 1);
        if( $char =~ m/[A-Z]/i )
        {
            $cleanSeq .= $char;
            if($onTheRun > 0)
            {
                my @tmp = [$startOfTheRun, $onTheRun];
                push(@spaces, @tmp);
                $startOfTheRun = 0;
                $onTheRun = 0;
            }
        }else
        {
            ++$onTheRun;
            $startOfTheRun = $i if($startOfTheRun == 0);
        }
    }
    
    if($onTheRun > 0)
    {
        my @tmp = [$startOfTheRun, $onTheRun];
        push(@spaces, @tmp);
        $startOfTheRun = 0;
        $onTheRun = 0;
    }
    
    my %ret = ( 'seq' => $cleanSeq,
                'spaces' => [@spaces] );
    
    return %ret;
}

#my $seq = 'AVTRSLLFLFLIASVALAGNHNRHHRNRRDNDLHDWLTAEQKESLKDIAQGTEEFKKKVAVFYNELPAEKRAEWDKFYKTHCFEWTAKAQGADEETEFQKNLADNDVEKVRQRIGELKKDLDEKARKNVEMWEDDCYKLVKPMRKRREIEAEFQDFVKWMTPEQLGDINALKTAGKDSEIQDKVKEYFAKLPADQQKTLTEEFKGKCKVYFTPLMTSDELEKIKTLKGDKEAAGALVKGVVDRQDGEVKVIAEKMLSVCGEVYKESTRKRREIEAAFQDFVKWMTPEQLGDITALKAAGKDSEVQAKVKEFFGQLPADQQKTLTEEFKGKCKVYFTPLMTSEELEKIKTLKGDKEAAGALVKGVVDRQEGEVKAVAEKMLTVCGEVYKDSSRRRREIEAEFQDFVKWMTPEQLGDINALKTAGKDSEIQDKVKEYFALLPSDQQKTLTEEFKGKCKVYFTPLMTSEELDKIKTMKDDKVAAGALVKGVVDRQEGEVKAIAEKMLSVCGEVYKDSKRKRREIEAAFKDFVHWMTPEQLGDITALKAAGKDSEVQAKVKEFFGQLPADQQKTLTEEFKGKCKVYFTPLMTSDELAKIETLKGDKEAAGALVKGVVDRQEGDVKAIAEKMLTVCGEVYKDSSRRRREIEPAFQDFVKWMTPEQLGHITALKTAGKESEVQDKVKEYFGQLPADQQATLKEEFKGKCRVFFTPLMTSEELDKVKTLKANKEAAGALMKTVVDRQSGEVKATAEKMLGVCGEVYKESSRKRREIEAAFKDFVQWMTPEQLGEITSMKAAGKEGPELQAKTKEFFEQLPADQQKTLKEEFKGKCKVYFTPLMTSEELEKIKTLKGDKEAAGALVKGVVDRQMGDVKSISEKMLALCGEVYKDSSRRRREIEAVFQDFVKWMTPEQLGDITALKAAGKDTEVQEKVKEYFGKLPADQQKTLTEEFKGTCKTYFSPLLTSEESEKIKEHVASGDKEASKALVKGAVDRQEGEIKTIAEKMFGICGEVYKESKSRRDVAAKIEKHLSWLQAEEKEEILKMSKEGKSKDDIKKRLFEMVEAKEKDAGEKEKTVKLCYAWMDDVATKEEIEGLHKLHHVDHGACKKKVREFIGRLPEEKQKAVEASLPFCEKLWYGDHASHEGHEGHGDHSGHNHHHIKRRHLAVIEKYIEWLDEIQKGAIRELEASGADFNVIADKIKEFFHLLPEQKQTDVKEKFQNQCMTWAKEVSKPTEWEEIKKLHAAEDFNTLKLKLVELEERLTENQKHTIEHVRGVCYRLWGIKNLARRRRVPNSEASFQEKAAKYLDWMNEEQLNELKRLKSEGKKSEVMKAILKFYDETTGDAKEKAEGKLKEACKEYSVKAFGEEKVAQFKAQYKKLKDENAEQSEIEKLSNQYIDEIEDEQKKDFAKAVVTGCKHVYASTRSRRDLIAQAVAEYLQNA';
my $seq = '---------------------------------------------msvctl---------';
my %res = processSpaces($seq);

my $finalSeq = $res{'seq'};
my @spaces = $res{'spaces'};

print $finalSeq . "\n";

foreach $sp (@spaces)
{
    my @spa = @{$sp}[0];
    print $spa[0] . "->" . $spa[1] . "\n";
}


