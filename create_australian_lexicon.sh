# with reference to http://spirit.blau.in/simon/speech-model/

# sudo apt-get install unzip myspell-tools espeak
# cd /mnt/g/Dropbox/dictionary/ta_ozdict_wsl

# create directory for the dictionary files
mkdir pronunciation_lexicon

cd pronunciation_lexicon

# get newest dictionary (and update the name) from http://extensions.libreoffice.org/extension-center/english-dictionaries
wget https://extensions.libreoffice.org/extensions/english-dictionaries/2017-07.01/@@download/file/dict-en-20170701.oxt
unzip dict-en*
unmunch en_AU.dic en_AU.aff > australian-wordlist.txt

# wrap each line in "<audio>" tags and the whole file in a "<speak>" tag
sed -f ../ta_sed_script1 australian-wordlist.txt > australian-wordlist.xml

# the following espeak command takes some time to run (a couple of minutes), flag ipa
#espeak -f australian-wordlist.xml -m -v en -q -x --ipa --phonout="australian-espeak-ipa"
espeak -f australian-wordlist.xml -m -v en -q -x --phonout="australian-espeak"

# remove blank lines
grep . australian-espeak > australian-espeak.txt

# merge files
paste australian-wordlist.txt australian-espeak.txt > australian-english-lexicon.txt

# make output directory if it doesn't exist
mkdir --p ../output

# copy to output directory
cp australian-english-lexicon.txt ../output



espeak -f australian-wordlist.xml -m -v en -q -x --ipa --phonout="australian-espeak-ipa"

# remove blank lines
grep . australian-espeak-ipa > australian-espeak-ipa.txt

paste australian-wordlist.txt australian-espeak-ipa.txt > australian-english-lexicon-ipa.txt

mkdir --p ../output
cp australian-english-lexicon-ipa.txt ../output
