#' Lexicoder Sentiment Dictionary (2015)
#'
#' The 2015 Lexicoder Sentiment Dictionary in \pkg{quanteda} [dictionary]
#' format.
#'
#' @details
#' The dictionary consists of 2,858 "negative" sentiment words and 1,709
#' "positive" sentiment words. A further set of 2,860 and 1,721 negations of
#' negative and positive words, respectively, is also included. While many users
#' will find the non-negation sentiment forms of the LSD adequate for sentiment
#' analysis, Young and Soroka (2012) did find a small, but non-negligible
#' increase in performance when accounting for negations. Users wishing to test
#' this or include the negations are encouraged to subtract negated positive
#' words from the count of positive words, and subtract the negated negative
#' words from the negative count.
#'
#' Young and Soroka (2012) also suggest the use of a pre-processing script to
#' remove specific cases of some words (i.e., "good bye", or "nobody better",
#' which should not be counted as positive). Pre-processing scripts are
#' available at <https://www.snsoroka.com/data-lexicoder/>.
#' @section License and Conditions:
#'   The LSD is available for non-commercial academic purposes only. By using
#'   `data_dictionary_LSD2015`, you accept these terms.
#'
#'   Please cite the references below when using the dictionary.
#' @format
#' A [dictionary] of four keys containing glob-style [pattern
#' matches][valuetype].
#' \describe{
#' \item{`negative`}{2,858 word patterns indicating negative sentiment}
#' \item{`positive`}{1,709 word patterns indicating positive sentiment}
#' \item{`neg_positive`}{1,721 word patterns indicating a positive word preceded
#' by a negation (used to convey negative sentiment)}
#' \item{`neg_negative`}{2,860 word patterns indicating a negative word preceded
#' by a negation (used to convey positive sentiment)}
#' }
#' @references
#'   The objectives, development and reliability of the dictionary are discussed
#'   in detail in Young and Soroka (2012). Please cite this article when using
#'   the Lexicoder Sentiment Dictionary and related resources.
#
#'   Young, L. & Soroka, S. (2012). *Lexicoder Sentiment
#'   Dictionary*. Available at <https://www.snsoroka.com/data-lexicoder/>.
#'
#'   Young, L. & Soroka, S. (2012). Affective News: The Automated Coding of
#'   Sentiment in Political Texts. *Political Communication*, 29(2), 205--231.
#'   \doi{10.1080/10584609.2012.671234}
#' @keywords data
#' @examples
#' # checking polarity
#' polarity(data_dictionary_LSD2015)
#'
#' # simple example
#' library("quanteda")
#' txt <- "This aggressive policy will not win friends."
#'
#' tokens_lookup(tokens(txt), dictionary = data_dictionary_LSD2015,
#'               exclusive = FALSE)
#' ## tokens from 1 document.
#' ## text1 :
#' ## [1] "This"   "NEGATIVE"   "policy"   "will"   "NEG_POSITIVE"   "POSITIVE"   "POSITIVE" "."
#'
#' # notice that double-counting of negated and non-negated terms is avoided
#' # when using nested_scope = "dictionary"
#' tokens_lookup(tokens(txt), dictionary = data_dictionary_LSD2015,
#'               exclusive = FALSE, nested_scope = "dictionary")
#' ## tokens from 1 document.
#' ## text1 :
#' ## [1] "This"   "NEGATIVE"   "policy"   "will"   "NEG_POSITIVE" "POSITIVE."
#'
#' # on larger examples - notice that few negations are used
#' tail(data_corpus_inaugural) |>
#'   tokens() |>
#'   tokens_lookup(dictionary = data_dictionary_LSD2015) |>
#'   dfm()
"data_dictionary_LSD2015"

#' NRC Word-Emotion Association Lexicon
#'
#' @description
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing Mohammad and
#' Charron's (2010, 2013) English version of the NRC Word-Emotion Association
#' Lexicon (aka NRC Emotion Lexicon aka EmoLex): association of words with eight
#' emotions (anger, fear, anticipation, trust, surprise, sadness, joy, and disgust)
#' and two sentiments (negative and positive) manually annotated on Amazon's 
#' Mechanical Turk.
#' 
#' @description
#' The Sentiment and Emotion Lexicons is a collection of lexicons that was
#' entirely created by the experts of the National Research Council of Canada.
#' Developed with a wide range of applications, this lexicon collection can be
#' used in a multitude of contexts such as sentiment analysis, product
#' marketing, consumer behaviour and even political campaign analysis.
#' 
#' @description
#' The technology uses a list of words that help identify emotions, sentiment,
#' as well as analyzing hashtags, emoticons and word-colour associations. The
#' lexicons contain entries for English words, and can be used to analyze
#' English texts.
#' @references
#'   Mohammad, S. & Turney, P. (2013). [Crowdsourcing a Word-Emotion Association
#'   Lexicon](https://arxiv.org/abs/1308.6297). *Computational Intelligence*,
#'   29(3), 436--465.
#'
#'   Mohammad, S. & Turney, P. (2010). [Emotions Evoked by Common Words and
#'   Phrases: Using Mechanical Turk to Create an Emotion
#'   Lexicon](https://dl.acm.org/doi/10.5555/1860631.1860635). In *Proceedings of
#'   the NAACL-HLT 2010 Workshop on Computational Approaches to Analysis and
#'   Generation of Emotion in Text*, June 2010, LA, California.
#' @source <https://nrc.canada.ca/en/research-development/products-services/technical-advisory-services/sentiment-emotion-lexicons>
#'
#' See also <http://saifmohammad.com/WebPages/AccessResource.htm>
#' @section License and Terms of Use:
#' Free for research purposes.
#' 
#' For questions about the commercial license, email Pierre Charron (Client
#' Relationship Leader at NRC): `Pierre.Charron@nrc-cnrc.gc.ca`.
#' 
#' Terms of Use:
#' *  Cite the papers associated with the lexicons in your research papers and
#'    articles that make use of them. (The papers associated with each lexicon
#'    are listed below, and also in the READMEs for individual lexicons.)
#' *  In news articles and online posts on work using these lexicons, cite the 
#'    appropriate lexicons. For example: "This application/product/tool makes 
#'    use of the `resource name`, created by `author(s)` at the National 
#'    Research Council Canada." (The creators of each lexicon are listed below. 
#'    Also, if you send us an email, we will be thrilled to know about how you 
#'    have used the lexicon.) If possible hyperlink to this page: 
#'    <http://saifmohammad.com/WebPages/lexicons.html>.
#' *  If you use a lexicon in a product or application, then acknowledge this in
#'    the 'About' page and other relevant documentation of the application by
#'    stating the name of the resource, the authors, and NRC. For example: "This
#'    application/product/tool makes use of the `resource name`, created by
#'    `author(s)` at the National Research Council Canada." (The creators of 
#'    each lexicon are listed below. Also, if you send us an email, we will be 
#'    thrilled to know about how you have used the lexicon.) If possible 
#'    hyperlink to this page: <http://saifmohammad.com/WebPages/lexicons.html>.
#' *  Do not redistribute the data. Direct interested parties to this page:
#'    <http://saifmohammad.com/WebPages/AccessResource.htm>.
#' *  National Research Council Canada (NRC) disclaims any responsibility for 
#'    the use of the lexicons listed here and does not provide technical 
#'    support. However, the contact listed above will be happy to respond to 
#'    queries and clarifications.
#' @note Technical and research-related questions can be addressed to Saif M.
#'   Mohammad (Senior Research Scientist at NRC):
#'   `Saif.Mohammad@nrc-cnrc.gc.ca`.
#' @keywords data
"data_dictionary_NRC"

#' Positive and negative words from Hu and Liu (2004)
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing 2,006
#' positive and 4,783 negative words from Hu and Liu (2004, 2005).
#' @format 
#' A [dictionary] of fixed word patterns with two keys:
#' * `positive`: 2,006 words with positive polarity
#' * `negative`: 4,783 words with negative polarity
#' @references 
#' Hu, M. & Liu, B. (2004). [Mining and Summarizing Customer
#' Reviews](https://www.cs.uic.edu/~liub/publications/kdd04-revSummary.pdf). In
#' Proceedings of the ACM SIGKDD International Conference on Knowledge Discovery
#' and Data Mining (KDD-2004), Aug 22--25, 2004, Seattle, Washington, USA.
#' 
#' Liu, M., Hu, M., & Cheng, J. (2005). [Opinion Observer: Analyzing and
#' Comparing Opinions on the
#' Web](https://www.cs.uic.edu/~liub/publications/www05-p536.pdf). In
#' Proceedings of the 14th International World Wide Web conference (WWW-2005),
#' May 10--14, 2005, Chiba, Japan.
#' @section License:
#' Unknown.
#' @source <https://www.cs.uic.edu/~liub/FBS/sentiment-analysis.html>
#' @keywords data
"data_dictionary_HuLiu"

#' Augmented General Inquirer *Positiv* and *Negativ* dictionary
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing the
#' *Positiv* and *Negativ* dictionary entries from the augmented
#' General Inquirer. These are new valence categories described at
#' `http://www.wjh.harvard.edu/~inquirer/homecat.htm` but also including the
#' terms from the "yes" "no" dictionary entries.
#' @format 
#' A [dictionary] of fixed word patterns with two keys:
#' * `positive`: 1,653 words with positive polarity
#' * `negative`: 2,010 words with negative polarity
#' @references Stone, P.J., Dunphy, C.D., & Smith, M.S. (1966).
#'   *The General Inquirer: A Computer Approach to Content Analysis.*
#'   Cambridge, MA: MIT Press.
#' @source `http://www.wjh.harvard.edu/~inquirer/spreadsheet_guide.htm` --
#'   although this site ceased operating some time in 2021
#' @keywords data
"data_dictionary_geninqposneg"

#' SentimentWortschatz (SentiWS)
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing
#' SentimentWortschatz (SentiWS), a publicly available German-language resource
#' for sentiment analysis. The current version of SentiWS contains 1,650
#' positive and 1,818 negative words, which sum up to 15,649 positive and 15,632
#' negative word forms including their inflections. It not only contains
#' adjectives and adverbs explicitly expressing a sentiment, but also nouns and
#' verbs implicitly containing one. The original dictionary weights within the
#' interval of -1 to 1. Note that the version implemented in
#' \pkg{quanteda.dictionaries} uses a binary classification into positive
#' (weight > 0) and negative (weight < 0) features.
#' @source <https://wortschatz.uni-leipzig.de/en/download/>
#' @references
#'   Remus, R., Quasthoff U., and Heyer, G. (2010). [SentiWS: a Publicly
#'   Available German-language Resource for Sentiment
#'   Analysis](http://www.lrec-conf.org/proceedings/lrec2010/pdf/490_Paper.pdf).
#'   In _Proceedings of the 7th International Language Ressources and Evaluation
#'   (LREC'10)_, 1168--1171.
#'
#' @keywords data
"data_dictionary_sentiws"

#' Nielsen's (2011) 'new ANEW' valenced word list
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing Finn Årup
#' Nielsen's (2011) 'new ANEW' valenced word list, a publicly available list of
#' English words rated for valence with values between -5 (negative) and +5
#' (positive). AFINN-111, the latest version, contains 2,477 words and phrases.
#' @source <http://www2.imm.dtu.dk/pubdb/pubs/6010-full.html>
#' @references
#'   Nielsen, F. Å. (2011). [A new ANEW: Evaluation of a Word List for Sentiment
#'   Analysis in Microblogs.](https://arxiv.org/abs/1103.2903) In *Proceedings
#'   of the ESWC2011 Workshop on 'Making Sense of Microposts': Big Things Come
#'   in Small Packages*, 93--98.
#' @format 
#' A [dictionary] with one key, `AFINN`, with valences from -5 (negative) to +5
#' (positive).
#' @section License:
#' [Open Database License (ODbL) v1.0](https://opendatacommons.org/licenses/odbl/1-0/)
#' @keywords data
"data_dictionary_AFINN"

#' Affective Norms for English Words (ANEW)
#'
#' A quanteda dictionary object containing the ANEW, or Affective Norms for
#' English Words (Bradley and Lang 2017) valenced lexicon.  The ANEW provides a
#' lexicon of 2,471 distinct fixed word matches that are associated with three
#' valenced categories: pleasure, arousal, and dominance.
#' @format 
#' A [dictionary] with three valenced keys: `pleasure`, `arousal`, and
#' `dominance`, each with valences from 1 to 9 and containing the same 2,471
#' fixed word values.
#' @source <https://csea.phhp.ufl.edu/media.html#bottommedia>
#' @references
#'   Bradley, M.M. & Lang, P.J. (2017). Affective Norms for English Words
#'   (ANEW): Instruction manual and affective ratings. Technical Report C-3.
#'   Gainesville, FL:UF Center for the Study of Emotion and Attention.
#' @section License:
#' For non-profit academic research purposes.
#' 
#' ANEW Statement of Use
#' 
#' In accepting the ANEW materials, I agree not to make the ANEW available to
#' the media (television, magazines, etc.) or to place them on any internet or
#' computer-accessible websites. I also agree not to publish the ANEW in any
#' print format – including JOURNALS, newspapers, etc. I also agree that I will
#' not provide the ANEW materials to profit making companies or organizations
#' and I agree not to distribute my username and password to unauthorized
#' parties.
#' @keywords data
"data_dictionary_ANEW"

#' Rauh's German Political Sentiment Dictionary
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing the
#' dictionaries provided in Rauh (forthcoming). Rauh assesses its performance
#' against human intuition of sentiment in German political language
#' (parliamentary speeches, party manifestos, and media coverage). The resource
#' builds on, harmonizes and extends the SentiWS (Remus et al. 2010) and
#' GermanPolarityClues (Waltinger 2010) dictionaries. In order to use the
#' negation correction provided by the dictionary, currently a combination of
#' [tokens_replace][quanteda::tokens_replace] and [tokens_compound][quanteda::tokens_compound] is
#' required to harmonize the five covered bi-gram patterns prior to scoring. The
#' example below shows how to conduct this transformation. Note that the process
#' changes the terms "nicht|nichts|kein|keine|keinen" to a joint term altering
#' some of the features of the original corpus.
#' @format The dictionary has four keys.
#' \describe{
#' \item{`negative`}{19,750 terms indicating negative sentiment}
#' \item{`positive`}{17,330 terms indicating positive sentiment}
#' \item{`neg_positive`}{17,330 terms indicating a positive word preceded
#' by a negation (used to convey negative sentiment)}
#' \item{`neg_negative`}{19,750 terms indicating a negative word preceded
#' by a negation (used to convey positive sentiment)}
#' }
#' @source \doi{10.7910/DVN/BKBXWD}
#' @references
#'   Rauh, C. (2018). Validating a Sentiment Dictionary for German Political
#'   Language: A Workbench Note. 
#'   *Journal of Information Technology & Politics*, 15(4), 319--343.
#'   \doi{10.1080/19331681.2018.1485608}
#'
#'   Remus, R., Quasthoff U., & Heyer, G. (2010). "[SentiWS - a Publicly
#'   Available German-language Resource for Sentiment
#'   Analysis.](http://www.lrec-conf.org/proceedings/lrec2010/pdf/490_Paper.pdf)"
#'   In *Proceedings of the 7th International Language Resources and Evaluation
#'   (LREC'10)*, 1168--1171.
#'
#'   Waltinger, U. (2010). "[GermanPolarityClues: A Lexical Resource for German
#'   Sentiment Analysis](http://www.ulliwaltinger.de/pdf/91_Paper.pdf)." In
#'   *International Conference on Language Resources and Evaluation*, 17--23 May
#'   2010 LREC'10.
#' @examples
#' \donttest{
#' # tokenize example text
#' toks <- tokens("nicht schlecht dieses wunderschöne Wörterbuch")
#' # replace negation markers with "not"
#' toks1 <- tokens_replace(toks, pattern = c("nicht", "nichts", "kein",
#'                                                     "keine", "keinen"),
#'                                   replacement = rep("not", 5))
#' # compound bi-gram negation patterns
#' toks2 <- tokens_compound(toks1, data_dictionary_Rauh, concatenator = " ")
#'
#' # apply dictionary
#' tokens_lookup(toks2, dictionary = data_dictionary_Rauh) |>
#'   dfm()
#' }
#' @keywords data
"data_dictionary_Rauh"

#' Loughran and McDonald Sentiment Word Lists
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing
#' the 2014 version of the Loughran and McDonald Sentiment Word Lists. The
#' categories are "negative" (2355 features), "positive" (354), "uncertainty" (297), "litigious" (903),
#' "constraining" (184), "superfluous" (56), "interesting" (68), "modal words strong" (68)
#' and "modal words weak" (0).
#' @source <https://sraf.nd.edu/loughranmcdonald-master-dictionary/>
#' @references
#'   Loughran, T. & McDonald, B. (2011). When is a Liability not a Liability?
#'   Textual Analysis, Dictionaries, and 10-Ks.
#'   *Journal of Finance*, 66(1), 35--65.  \doi{10.1111/j.1540-6261.2010.01625.x}
#' @keywords data
"data_dictionary_LoughranMcDonald"

#' Affective Norms for Spanish Words (ANSW) 2016
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing the
#' ANSW 2016, or Affective Norms for Spanish Words (Hinojosa et al. 2016) valenced
#' lexicon. The ANSW provides a lexicon of 875 distinct Spanish words that are
#' associated with eight valenced categories: valence, arousal, concreteness,
#' and five discrete emotional categories (happiness, anger, sadness, fear,
#' and disgust).
#' @format
#' A [dictionary] with eight valenced keys: `valence`, `arousal`, `concreteness`,
#' `happiness`, `anger`, `sadness`, `fearness`, and `disgust`, each containing
#' the same 875 Spanish word values with associated valences.
#' @references
#'   Hinojosa, J.A., Martínez-García, N., Villalba-García, C., Fernández-Folgueiras,
#'   U., & Sánchez-Carmona, A. (2016). Affective norms of 875 Spanish words for
#'   five discrete emotional categories and two emotional dimensions.
#'   *Behavior Research Methods*, 48, 272--284.
#'   \doi{10.3758/s13428-015-0572-5}
#' @source <https://link.springer.com/article/10.3758/s13428-015-0572-5>
#' @section License:
#' Unknown.
#' @note This dictionary was created by Mariano Rico (mariano.rico@upm.es). For
#'   questions about the dictionary data, please consult the original publication.
#' @keywords data
"data_dictionary_ANSW2016"

#' Affective Norms for Spanish Words (ANSW) 2018
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing the
#' ANSW 2018, or Affective Norms for Spanish Words (Stadthagen-González H. et al.) valenced
#' lexicon. The ANSW 2018 provides a lexicon of 10,491 distinct Spanish words (x10 2016 version) that are
#' associated with seven (2006 version was for eight) valenced categories: valence, arousal,
#' and five discrete emotional categories (happiness, anger, sadness, fear,
#' and disgust).
#' @format
#' A [dictionary] with seven valenced keys: `valence`, `arousal`,
#' `happiness`, `anger`, `sadness`, `fearness`, and `disgust`, each containing
#' the same 10,491 Spanish word values with associated valences.
#' @references
#'   Stadthagen-González, H., Ferré, P., Pérez-Sánchez, M.A. et al. Norms 
#'   for 10,491 Spanish words for five discrete emotions: Happiness, disgust, 
#'   anger, fear, and sadness.
#'   *Behavior Reseach Methods* 50, 1943–1952. 
#'   \doi{10.3758/s13428-017-0962-y}
#' @source <https://link.springer.com/article/10.3758/s13428-017-0962-y>
#' @section License:
#' For non-profit academic research purposes.
#' @note This dictionary was created by Mariano Rico (mariano.rico@upm.es). For
#'   questions about the dictionary data, please consult the original publication.
#' @keywords data
"data_dictionary_ANSW2018"

#' Chen and Skiena's (2014) sentiment dictionaries for 81 languages
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing
#' positive and negative words for 81 (non-English) languages. The dataset can
#' be found in Kaggle (as well as referenced from the original publication
#' page).
#' 
#' The languages are:
#' 
#' | **Code** | **Language** |
#' |------|----------|
#' | af | Afrikaans |
#' | an | Aragonese |
#' | ar | Arabic |
#' | az | Azerbaijani |
#' | be | Belarusian |
#' | bg | Bulgarian |
#' | bn | Bengali |
#' | br | Breton |
#' | bs | Bosnian |
#' | ca | Catalan; Valencian |
#' | cs | Czech |
#' | cy | Welsh |
#' | da | Danish |
#' | de | German |
#' | el | Greek, Modern |
#' | eo | Esperanto |
#' | es | Spanish; Castilian |
#' | et | Estonian |
#' | eu | Basque |
#' | fa | Persian |
#' | fi | Finnish |
#' | fo | Faroese |
#' | fr | French |
#' | fy | Western Frisian |
#' | ga | Irish |
#' | gd | Scottish Gaelic; Gaelic |
#' | gl | Galician |
#' | gu | Gujarati |
#' | he | Hebrew (modern) |
#' | hi | Hindi |
#' | hr | Croatian |
#' | ht | Haitian; Haitian Creole |
#' | hu | Hungarian |
#' | hy | Armenian |
#' | ia | Interlingua |
#' | id | Indonesian |
#' | io | Ido |
#' | is | Icelandic |
#' | it | Italian |
#' | ka | Georgian |
#' | km | Khmer |
#' | kn | Kannada |
#' | ko | Korean |
#' | ku | Kurdish |
#' | ky | Kirghiz, Kyrgyz |
#' | la | Latin |
#' | lb | Luxembourgish, Letzeburgesch |
#' | lt | Lithuanian |
#' | lv | Latvian |
#' | mk | Macedonian |
#' | mr | Marathi (Marāṭhī) |
#' | ms | Malay |
#' | mt | Maltese |
#' | nl | Dutch |
#' | nn | Norwegian Nynorsk |
#' | no | Norwegian |
#' | pl | Polish |
#' | pt | Portuguese |
#' | rm | Romansh |
#' | ro | Romanian, Moldavian, Moldovan |
#' | ru | Russian |
#' | sk | Slovak |
#' | sl | Slovene |
#' | sq | Albanian |
#' | sr | Serbian |
#' | sv | Swedish |
#' | sw | Swahili |
#' | ta | Tamil |
#' | te | Telugu |
#' | th | Thai |
#' | tk | Turkmen |
#' | tl | Tagalog |
#' | tr | Turkish |
#' | uk | Ukrainian |
#' | ur | Urdu |
#' | uz | Uzbek |
#' | vi | Vietnamese |
#' | vo | Volapük |
#' | wa | Walloon |
#' | yi | Yiddish |
#' | zh | Chinese |
#' | zhw | Chinese (characters and words) |
#' 
#' @format
#' For a given language xx, a [dictionary][quanteda::dictionary] with two keys: `xx_pos`, and `xx_neg`, where `xx` is the two-character language code, corresponding to the ISO 3166-1 A-2 standard.
#' @examples
#' library("quanteda.sentiment")
#' # Tests for 4 Spain languages
#' 
#' # Test for Spanish
#' polarity(data_dictionary_ChenSkiena2014) <- list(neg = "es_neg", pos = "es_pos")
#' textstat_polarity("Hay que ser cruel para ser amable.", 
#'                   dictionary = data_dictionary_ChenSkiena2014) 
#' ##   doc_id sentiment
#' ## 1  text1 0.5108256
#' 
#' # Test for Catalan
#' polarity(data_dictionary_ChenSkiena2014) <- list(neg = "ca_neg", pos = "ca_pos")
#' textstat_polarity("Cal ser cruel per ser amable.", 
#'                   dictionary = data_dictionary_ChenSkiena2014)
#' ##   doc_id sentiment
#' ## 1  text1 0.5108256
#' 
#' # Test for Basque
#' polarity(data_dictionary_ChenSkiena2014) <- list(neg = "eu_neg", pos = "eu_pos")
#' textstat_polarity("Krudel izan behar da atsegina izateko.", 
#'                   dictionary = data_dictionary_ChenSkiena2014)
#' ##   doc_id sentiment
#' ## 1  text1  1.098612
#' 
#' # Test for Galician
#' polarity(data_dictionary_ChenSkiena2014) <- list(neg = "gl_neg", pos = "gl_pos")
#' textstat_polarity("Hai que ser cruel para ser amable.", 
#'                   dictionary = data_dictionary_ChenSkiena2014)
#' ##   doc_id sentiment
#' ## 1  text1 0.5108256
#' @references 
#' Chen, Yanqing and Steven Skiena. (2014) "Building sentiment lexicons for all
#' major languages." In _Proceedings of the 52nd annual meeting of the
#' Association for Computational Linguistics_ (volume 2: short papers), pp.
#' 383-389. \doi{10.3115/v1/P14-2063}
#' @source <https://www.kaggle.com/rtatman/sentiment-lexicons-for-81-languages>
#' @section License:
#' [GPL-3](https://www.gnu.org/licenses/gpl-3.0.html).
#' @note This dictionary was created by Mariano Rico (mariano.rico@upm.es). For
#'   questions about the dictionary data, please consult the original publication.
#' @keywords data
"data_dictionary_ChenSkiena2014"

#' VADER Dictionary
#'
#' A \pkg{quanteda} [dictionary][quanteda::dictionary] object containing the
#' VADER (Valence Aware Dictionary and sEntiment Reasoner) lexicon, a
#' rule-based sentiment analysis tool that is specifically attuned to
#' sentiments expressed in social media.
#'
#' @details
#' The VADER lexicon contains 7,506 distinct English words and emoticons rated
#' for sentiment intensity. Each entry has an associated mean sentiment score
#' ranging from -4 (extremely negative) to +4 (extremely positive).
#'
#' The original VADER lexicon contained 14 duplicate tokens (primarily
#' emoticons such as ":-p"). For this implementation, duplicates were merged by
#' combining their raw annotation scores and recomputing the mean sentiment and
#' standard deviation from the combined values. This process reduced the
#' dictionary from 7,520 to 7,506 unique entries.
#'
#' @format
#' A [dictionary] with one valenced key, `VADER`, containing 7,506 word and
#' emoticon patterns with associated sentiment scores ranging from -4 (extremely
#' negative) to +4 (extremely positive).
#'
#' @references
#'   Hutto, C.J. & Gilbert, E.E. (2014). VADER: A Parsimonious Rule-based Model
#'   for Sentiment Analysis of Social Media Text. *Eighth International
#'   Conference on Weblogs and Social Media* (ICWSM-14). Ann Arbor, MI, June
#'   2014. \doi{10.1609/icwsm.v8i1.14550}
#'
#' @source <https://github.com/cjhutto/vaderSentiment>
#'
#' @section License:
#' [MIT License](https://opensource.org/licenses/MIT)
#'
#' @keywords data
"data_dictionary_vader"

