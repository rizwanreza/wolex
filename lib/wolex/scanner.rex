module Wolex
class Scanner

macro
  number    \d+
  add      \+
  subtract  \-
  multiply  \*
  divide    \/
  blank     [\ \t]+
rule

# [:state]  pattern  [actions]

            {number}  { [:NUMBER, text.to_i] }
            {add}  { [:ADD, text] }
            {subtract}  { [:SUBTRACT, text] }
            {multiply}  { [:MULTIPLY, text] }
            {divide}  { [:DIVIDE, text] }
            {blank}   { [:BLANK, text]}
end
end
