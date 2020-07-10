-- file: ch05/PrettyJSON.hs
module PrettyJSON where

import SimpleJSON
import Prettify

renderJValue :: JValue -> Doc
renderJValue (JBool True)  = text "true"
renderJValue (JBool False) = text "false"
renderJValue JNull         = text "null"
renderJValue (JNumber num) = double num
renderJValue (JString str) = string str

pointyString :: String -> Doc
pointyString s = enclose '"' '"' (hcat (map oneChar s))
