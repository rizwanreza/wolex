module Wolex
class Scanner

macro
  number    \d+

rule

# [:state]  pattern  [actions]

            {number}  { [:NUMBER, text.to_i] }

end
end
