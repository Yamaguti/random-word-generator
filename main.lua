
--- Utils

local Util = {}

function Util.getLetterAtIndex(word, index)
    return word:sub(index, index)
end

function Util.sanitizeLetter(letter)
    return letter:lower()
end

function Util.isLetter(letter)
    return string.byte(letter) >= string.byte("a") and string.byte(letter) <= string.byte("z")
end


--- Main

local dict = {}

io.input("dict.txt")

local max = 0
for word in io.lines() do
    for i = 1, word:len()-1 do
        local currentLetter = Util.getLetterAtIndex(word, i)
        currentLetter = Util.sanitizeLetter(currentLetter)

        local nextLetter    = Util.getLetterAtIndex(word, i+1)
        nextLetter = Util.sanitizeLetter(nextLetter)

        if  Util.isLetter(currentLetter) and Util.isLetter(nextLetter) then
            dict[currentLetter] = dict[currentLetter] or {}
            dict[currentLetter][nextLetter] = (dict[currentLetter][nextLetter] or 0) + 1
            max = max + 1
        end
    end
end


-- local array = {}
-- local count = 1

-- for letter, config in pairs(dict) do
--     for otherLetter, amount in pairs(config) do
--         array[count] = {
--             first  = letter,
--             second = otherLetter,
--             amount = amount,
--         }
--         count = count + 1
--     end
-- end

-- table.sort(array, function (a, b)
--     return a.amount < b.amount
-- end)

-- for i = 1, #array do
--     local config = array[i]
--     print(config.first, config.second, config.amount)
-- end

print(" ")
local header = "    "
for i = string.byte("a"), string.byte("z") do
    header = string.format("%s%s     ", header, string.char(i))
end
print(header)

for i = string.byte("a"), string.byte("z") do
    local letter = string.char(i)
    local line = letter .. "  "

    for j = string.byte("a"), string.byte("z") do
        local otherLetter = string.char(j)
        line = string.format("%s%.3f ", line, (dict[letter][otherLetter] or 0)/max)
    end

    print (line)
end
print(" ")


-- local a = string.byte("a")
-- local z = string.byte("z")
-- local char = string.char

-- local len = math.random(3, 8)

-- local word = "" .. char(math.random(a, z))
-- for index = 2, len do
--     local last = index-1
--     local lastLetter = word:sub(last, last)

--     local letter =
--     word = word + letter
-- end

-- print word
