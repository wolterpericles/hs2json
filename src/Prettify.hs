-- file: src/Prettify.hs
module Prettify where
import Prelude hiding ((<>))

import SimpleJSON
import PrettyJSON

data Doc = ToBeDefined
         deriving (Show)

--string :: String -> Doc
--string str = undefined

text :: String -> Doc
text str = undefined

double :: Double -> Doc
double num = undefined

string :: String -> Doc
string = enclose '"' '"' . hcat . map oneChar

(<>) :: Doc -> Doc -> Doc
a <> b = undefined

char :: Char -> Doc
char c = undefined

hcat :: [Doc] -> Doc
hcat xs = undefined

oneChar :: Char -> Doc
oneChar c = case lookup c simpleEscapes of
              Just r -> text r
              Nothing | mustEscape c -> hexEscape c
                      | otherwise    -> char c
    where mustEscape c = c < ' ' || c == '\x7f' || c > '\xff'

simpleEscapes :: [(Char, String)]
simpleEscapes = zipWith ch "\b\n\f\r\t\\\"/" "bnfrt\\\"/"
    where ch a b = (a, ['\\',b])

fsep :: [Doc] -> Doc
fsep xs = undefined

punctuate :: Doc -> [Doc] -> [Doc]
punctuate p []     = []
punctuate p [d]    = [d]
punctuate p (d:ds) = (d <> p) : punctuate p ds
