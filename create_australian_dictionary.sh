# with reference to http://spirit.blau.in/simon/speech-model/

# sudo apt-get install unzip myspell-tools espeak

# create directory for the dictionary files
mkdir pronunciation_dictionary

# cd /mnt/g/Dropbox/dictionary/ta_ozdict_wsl/pronunciation_dictionary
cd pronunciation_dictionary

# get newest dictionary (and update the name) from http://extensions.libreoffice.org/extension-center/english-dictionaries
wget https://extensions.libreoffice.org/extensions/english-dictionaries/2017-07.01/@@download/file/dict-en-20170701.oxt
unzip dict-en*
unmunch en_AU.dic en_AU.aff > australian-wordlist.txt

# wrap each line in "<audio>" tags and the whole file in a "<speak>" tag
sed -f ../ta_sed_script1 australian-wordlist.txt > australian-wordlist.xml

# the following espeak command takes some time to run (a couple of minutes)
espeak -f australian-wordlist.xml -m -v en -q -x --ipa --phonout="australian-espeak"

# remove blank lines
grep . australian-espeak > australian-espeak-ta

# add tags to the espeak file
sed -f ../ta_sed_script2 australian-espeak-ta > australian-ipa-phonemes.xml

paste australian-wordlist.xml australian-ipa-phonemes.xml > australian-english-dictionary.xml
