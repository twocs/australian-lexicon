# australian-lexicon
Towards a pronunciation lexicon for australian english

Created with reference to a process of creating a pronunciation dictionary on a blog [Ralf Herzog's Blog](https://web.archive.org/web/20170331061851/http://spirit.blau.in/simon/speech-model/). The method was intended for use with a [Speech2Text System](https://web.archive.org/web/20170331114405/http://sourceforge.net/projects/speech2text/).

It is based on Apache OpenOffice spelling suggestions, which generate possible correct spellings using a pronunciation system.  However, I had to rewrite some steps of the original process because it refused to work (at least for my system).  I have used bash shell for most of the xml instead of xslt.

## Notes

The resulting output are located in the /output folder. 
- [australian-english-lexicon.txt](australian-english-lexicon.txt): SAMPA format tab delimited list
- [australian-english-dictionary.xml](australian-english-dictionary.xml): IPA format xml lexicon format
- [australian-english-lexicon-ipa.txt](australian-english-lexicon-ipa.txt): IPA format tab delimited list

To create these files, the following scripts were run.
- [create_australian_dictionary.sh](create_australian_dictionary.sh) 
- [create_australian_lexicon.sh](create_australian_lexicon.sh)
- [create_australian_lexicon_ipa.sh](create_australian_lexicon_ipa.sh)

If running the scripts, the folders do not need to exist.  They will be created and the files downloaded from OpenOffice.  To ensure that future changes to Apache OpenOffice do not break the current method, the files from OpenOffice that are downloaded were retained in the [pronunciation_dictionary](pronunciation_dictionary) folder.

A note: older versions of the OpenOffice files had some corruption as a result of encoding in different formats (UTF8, ISO-8859-1, etc.), but after my bug reports these issues have been fixed.  In particular, the words from French such as café had a problem. The current fix seems to have been to remove all non-English letters such as "é".  It would be possible to reintroduce those spellings by using older versions.

## Licence information

> The English dictionaries come directly from SCOWL 
> and is thus under the same copyright of SCOWL.  The affix file is
> a heavily modified version of the original english.aff file which was
> released as part of Geoff Kuenning's Ispell and as such is covered by
> his BSD license.  Part of SCOWL is also based on Ispell thus the
> Ispell copyright is included with the SCOWL copyright.
>
> The collective work is Copyright 2000-2016 by Kevin Atkinson as well
as any of the copyrights mentioned below:
>
>  Copyright 2000-2016 by Kevin Atkinson
>
>  Permission to use, copy, modify, distribute and sell these word
>  lists, the associated scripts, the output created from the scripts,
>  and its documentation for any purpose is hereby granted without fee,
>  provided that the above copyright notice appears in all copies and
>  that both that copyright notice and this permission notice appear in
>  supporting documentation. Kevin Atkinson makes no representations
>  about the suitability of this array for any purpose. It is provided
>  "as is" without express or implied warranty.

This is the summary version of the dictionary license (the list of words) and the affix file (the pronunciation rules), but please see [README_en_AU.txt](README_en_AU.txt) for a much more detailed expanation of the licences and provenance of the Australian word list.

##Future plans:

The next step is to compare these results with the [australian learner dictionary](https://github.com/stevecassidy/ald) and other sources.  

One person has mentioned that espeak may not correctly render the Australian /t/ phoneme (more as a /d/?).

The folder structure can be improved by storing temporary files from OpenOffice separately.