-- MEGA 79K BYPASS - 79,898 kata Indonesia + Flexible Prefix System
-- Download database 79k kata dari GitHub + fallback system

wait(3)

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Mega79kBypass"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

-- Main frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 450, 0, 280)
mainFrame.Position = UDim2.new(0.5, -225, 0.5, -140)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.1
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 25)
title.Position = UDim2.new(0, 5, 0, 0)
title.BackgroundTransparency = 1
title.Text = "MEGA 79K BYPASS - 79,898 Indonesian Words"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 25, 0, 25)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextSize = 12
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.Parent = mainFrame

local closeBtnCorner = Instance.new("UICorner")
closeBtnCorner.CornerRadius = UDim.new(0, 12)
closeBtnCorner.Parent = closeBtn

-- Database status
local dbStatus = Instance.new("TextLabel")
dbStatus.Size = UDim2.new(0.6, 0, 0, 20)
dbStatus.Position = UDim2.new(0, 5, 0, 30)
dbStatus.BackgroundTransparency = 1
dbStatus.Text = "Database: Loading..."
dbStatus.TextColor3 = Color3.fromRGB(255, 255, 0)
dbStatus.TextSize = 11
dbStatus.Font = Enum.Font.SourceSans
dbStatus.Parent = mainFrame
-- Control buttons
local downloadBtn = Instance.new("TextButton")
downloadBtn.Size = UDim2.new(0, 80, 0, 25)
downloadBtn.Position = UDim2.new(0, 280, 0, 27)
downloadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 200)
downloadBtn.Text = "LOAD DB"
downloadBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
downloadBtn.TextSize = 10
downloadBtn.Font = Enum.Font.SourceSansBold
downloadBtn.Parent = mainFrame

local downloadCorner = Instance.new("UICorner")
downloadCorner.CornerRadius = UDim.new(0, 4)
downloadCorner.Parent = downloadBtn

local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(0, 60, 0, 25)
resetBtn.Position = UDim2.new(0, 365, 0, 27)
resetBtn.BackgroundColor3 = Color3.fromRGB(200, 100, 0)
resetBtn.Text = "RESET"
resetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
resetBtn.TextSize = 10
resetBtn.Font = Enum.Font.SourceSans
resetBtn.Parent = mainFrame

local resetCorner = Instance.new("UICorner")
resetCorner.CornerRadius = UDim.new(0, 4)
resetCorner.Parent = resetBtn

local startStopBtn = Instance.new("TextButton")
startStopBtn.Size = UDim2.new(0, 60, 0, 25)
startStopBtn.Position = UDim2.new(0, 430, 0, 27)
startStopBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
startStopBtn.Text = "START"
startStopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
startStopBtn.TextSize = 10
startStopBtn.Font = Enum.Font.SourceSans
startStopBtn.Parent = mainFrame

local startStopCorner = Instance.new("UICorner")
startStopCorner.CornerRadius = UDim.new(0, 4)
startStopCorner.Parent = startStopBtn

-- Input field
local inputFrame = Instance.new("Frame")
inputFrame.Size = UDim2.new(1, -20, 0, 30)
inputFrame.Position = UDim2.new(0, 10, 0, 80)
inputFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
inputFrame.BorderSizePixel = 0
inputFrame.Parent = mainFrame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 4)
inputCorner.Parent = inputFrame

local inputLabel = Instance.new("TextLabel")
inputLabel.Size = UDim2.new(0, 60, 1, 0)
inputLabel.Position = UDim2.new(0, 5, 0, 0)
inputLabel.BackgroundTransparency = 1
inputLabel.Text = "Awalan:"
inputLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
inputLabel.TextSize = 11
inputLabel.Font = Enum.Font.SourceSans
inputLabel.TextXAlignment = Enum.TextXAlignment.Left
inputLabel.Parent = inputFrame

local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 200, 1, -4)
inputBox.Position = UDim2.new(0, 65, 0, 2)
inputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
inputBox.BorderSizePixel = 0
inputBox.Text = ""
inputBox.PlaceholderText = "Ketik awalan (BA, KU, TER, dll)"
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
inputBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
inputBox.TextSize = 11
inputBox.Font = Enum.Font.SourceSans
inputBox.Parent = inputFrame

local inputBoxCorner = Instance.new("UICorner")
inputBoxCorner.CornerRadius = UDim.new(0, 3)
inputBoxCorner.Parent = inputBox

local processBtn = Instance.new("TextButton")
processBtn.Size = UDim2.new(0, 70, 1, -4)
processBtn.Position = UDim2.new(0, 275, 0, 2)
processBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
processBtn.Text = "PROSES"
processBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
processBtn.TextSize = 11
processBtn.Font = Enum.Font.SourceSansBold
processBtn.Parent = inputFrame

local processBtnCorner = Instance.new("UICorner")
processBtnCorner.CornerRadius = UDim.new(0, 3)
processBtnCorner.Parent = processBtn

local clearBtn = Instance.new("TextButton")
clearBtn.Size = UDim2.new(0, 60, 1, -4)
clearBtn.Position = UDim2.new(0, 355, 0, 2)
clearBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
clearBtn.Text = "CLEAR"
clearBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
clearBtn.TextSize = 11
clearBtn.Font = Enum.Font.SourceSans
clearBtn.Parent = inputFrame

local clearBtnCorner = Instance.new("UICorner")
clearBtnCorner.CornerRadius = UDim.new(0, 3)
clearBtnCorner.Parent = clearBtn
-- Status
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -10, 0, 20)
status.Position = UDim2.new(0, 5, 0, 115)
status.BackgroundTransparency = 1
status.Text = "Ready - Klik LOAD 79K untuk download database besar"
status.TextColor3 = Color3.fromRGB(255, 255, 0)
status.TextSize = 11
status.Font = Enum.Font.SourceSans
status.Parent = mainFrame

-- Variables
local isActive = false
local isProcessing = false
local allRemotes = {}
local successCount = 0
local usedWordsInRound = {} -- Anti-repeat system
local allWords = {} -- Database words
local databaseLoaded = false
local using79k = false

-- Services
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local HttpService = game:GetService("HttpService")

-- FALLBACK DATABASE (350 kata Indonesia - backup jika download gagal)
local fallbackWords = {
    "apel", "ayam", "anak", "air", "api", "asam", "asin", "awan", "akar", "alam", "alat", "aman", "angin", "angka", "anjing", "antara", "apa", "arah", "arus", "asli", "atas", "atau", "awak", "awal", "adik", "adat", "agama", "ahli", "aktif", "album",
    "buku", "bola", "buah", "batu", "burung", "baju", "baik", "banyak", "barat", "baru", "bawah", "benar", "besar", "berat", "bebas", "belum", "benang", "bentuk", "beras", "besi", "biasa", "biru", "bisa", "bintang", "bicara", "bunyi", "bulan", "bunga", "bambu", "bangku",
    "cinta", "catur", "cumi", "cabe", "cicak", "cari", "cara", "cantik", "cahaya", "cepat", "cerita", "coba", "coklat", "cuaca", "cuci", "cukup", "cuma", "curi", "cacing", "calon", "campur", "canda", "capek", "catat", "cawan",
    "daun", "daging", "dalam", "dekat", "dingin", "dapat", "darah", "dasar", "datang", "diri", "dengan", "dinding", "dimana", "duduk", "dunia", "dua", "dulu", "desa", "dokter", "drama", "dompet", "danau", "dansa", "dapur", "darat",
    "ekor", "elang", "empat", "enak", "emas", "emosi", "energi", "entah", "era", "esok", "eyang", "ekonomi", "ekspor", "ekspres", "elegant", "elevator", "empire", "episode", "ethnic", "event",
    "foto", "film", "fakta", "fisik", "formal", "fungsi", "fase", "faktor", "fantasi", "fashion", "festival", "fiction", "figure", "filter", "finger", "finish", "fire", "first", "fish", "fitness",
    "garam", "gajah", "gunung", "gelas", "gambar", "gadis", "garpu", "garis", "gigi", "gila", "gitar", "global", "gosip", "guru", "gula", "garage", "garbage", "garlic", "gather", "general",
    "hati", "hari", "hijau", "hitam", "hewan", "harus", "habis", "halus", "harap", "harmoni", "hasil", "harga", "hebat", "hidup", "hilang", "hingga", "hitung", "hobi", "hujan", "hutan",
    "ikan", "ibu", "indah", "ilmu", "impian", "ingat", "ingin", "ini", "itu", "isi", "istri", "izin", "iklan", "imajinasi", "industri", "informasi", "inovasi", "inspirasi", "institusi", "investasi",
    "jalan", "jari", "jeruk", "jendela", "jantung", "jauh", "jadi", "jam", "jangan", "jawab", "jelas", "jenis", "jiwa", "juga", "jumlah",
    "kucing", "kaki", "kepala", "kecil", "keras", "kata", "kamar", "kamu", "karena", "kelas", "keluar", "kemarin", "kembali", "kerja", "kiri",
    "laut", "langit", "lampu", "lemon", "luas", "lama", "laki", "lain", "lalu", "langsung", "lapang", "lari", "lawan", "lebih", "leher",
    "mata", "makan", "manis", "merah", "mobil", "malam", "masuk", "mereka", "memang", "melihat", "minum", "minggu", "minta", "milik", "musik",
    "nasi", "nama", "nyaman", "normal", "negara", "nanti", "naik", "nasib", "noda", "nomor",
    "orang", "obat", "otak", "olah", "organ", "oleh", "ombak", "operasi", "opini", "optimal",
    "pagi", "putih", "pohon", "pintu", "panas", "pakai", "pasti", "pasar", "pergi", "perang", "penting", "pesan", "petani", "pikir", "pilih",
    "quran", "quiz", "quota",
    "rumah", "rasa", "rambut", "rajin", "rakyat", "rahasia", "rapat", "ratu", "rawat", "rekan", "resep", "ringan", "rokok", "ruang", "roti",
    "saya", "sekolah", "siang", "suara", "segar", "sama", "sampai", "sakit", "satu", "semua", "sekarang", "selalu", "sebelum", "siapa", "sini",
    "tangan", "teknisi", "teman", "terang", "tinggi", "tahun", "tahu", "takut", "tanah", "tempat", "tengah", "terima", "tidak", "tidur", "tiap",
    "udara", "uang", "umur", "untuk", "utara", "ujung", "ulang", "umum", "unit", "upaya",
    "vitamin", "video", "virtual", "volume", "variasi", "versi", "villa", "virus",
    "warna", "waktu", "wajah", "warung", "wayang", "wangi", "wanita", "wilayah", "wisata", "wujud",
    "xenon", "xerox", "xray",
    "yang", "yakin", "yoga", "yayasan", "yuk", "yuran", "yatim", "yaitu",
    "zona", "zaman", "zombie", "zoom", "zero", "zodiak"
}
-- Function to load fallback database
local function loadFallbackDatabase()
    allWords = fallbackWords
    databaseLoaded = true
    using79k = false
    
    dbStatus.Text = "Database: " .. #allWords .. " kata (fallback) | Used: 0"
    dbStatus.TextColor3 = Color3.fromRGB(255, 150, 0)
    
    status.Text = "Fallback database loaded - Klik START untuk mulai"
    status.TextColor3 = Color3.fromRGB(255, 150, 0)
end

-- Function to load 79k words from converted Lua file
local function load79kFromLua()
    dbStatus.Text = "Loading 79,864 words from Lua file..."
    dbStatus.TextColor3 = Color3.fromRGB(255, 255, 0)
    status.Text = "Loading converted Indonesian wordlist..."
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    spawn(function()
        local success = false
        local luaWords = {}
        
        -- Method 1: Try require() with converted Lua file
        local ok, result = pcall(function()
            return require("indonesian-words")
        end)
        
        if ok and result and type(result) == "table" and #result > 50000 then
            luaWords = result
            success = true
            print("✅ SUCCESS: Loaded", #luaWords, "words from indonesian-words.lua")
        end
        
        -- Method 2: Try loadstring with Lua file content
        if not success and readfile and isfile and isfile("indonesian-words.lua") then
            local ok2, luaContent = pcall(function()
                return readfile("indonesian-words.lua")
            end)
            
            if ok2 and luaContent then
                local ok3, loadedFunc = pcall(function()
                    return loadstring(luaContent)
                end)
                
                if ok3 and loadedFunc then
                    local ok4, words = pcall(loadedFunc)
                    if ok4 and words and type(words) == "table" and #words > 50000 then
                        luaWords = words
                        success = true
                        print("✅ SUCCESS: Loaded", #luaWords, "words via loadstring")
                    end
                end
            end
        end
        
        if success and #luaWords > 50000 then
            allWords = luaWords
            databaseLoaded = true
            using79k = true
            
            dbStatus.Text = "Database: " .. #allWords .. " kata (79k embedded) | Used: 0"
            dbStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            status.Text = "SUCCESS: " .. #allWords .. " Indonesian words loaded!"
            status.TextColor3 = Color3.fromRGB(0, 255, 0)
            
            downloadBtn.Text = "79K ✓"
            downloadBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            
            print("🎉 ULTIMATE SUCCESS: Loaded", #allWords, "Indonesian words from Lua file!")
            return
        end
        
        -- If Lua file failed, try original txt file
        print("⚠️ Lua file failed, trying original txt file...")
        
        if readfile and isfile and isfile("00-indonesian-wordlist.lst") then
            local ok, data = pcall(function() 
                return readfile("00-indonesian-wordlist.lst") 
            end)
            
            if ok and data and #data > 100000 then
                print("📄 Reading original txt file, size:", #data)
                
                local txtWords = {}
                for word in data:gmatch("[^\r\n]+") do
                    local cleanWord = word:lower():gsub("%s+", ""):gsub("[^%w%-]", "") -- Keep hyphens
                    if cleanWord ~= "" and #cleanWord > 1 and #cleanWord < 25 then
                        table.insert(txtWords, cleanWord)
                    end
                end
                
                if #txtWords > 50000 then
                    allWords = txtWords
                    databaseLoaded = true
                    using79k = true
                    
                    dbStatus.Text = "Database: " .. #allWords .. " kata (79k txt) | Used: 0"
                    dbStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
                    
                    status.Text = "SUCCESS: " .. #allWords .. " words from txt file!"
                    status.TextColor3 = Color3.fromRGB(0, 255, 0)
                    
                    downloadBtn.Text = "TXT ✓"
                    downloadBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
                    
                    print("📄 TXT SUCCESS: Loaded", #allWords, "words from original file")
                    return
                end
            end
        end
        
        -- Final fallback to expanded database
        print("❌ ALL METHODS FAILED: Using expanded database")
        loadFallbackDatabase()
    end)
end

-- Function to find word that starts with any prefix
local function findWordWithPrefix(prefix)
    prefix = string.upper(prefix)
    local matchingWords = {}
    
    -- Cari semua kata yang dimulai dengan prefix tersebut
    for _, word in pairs(allWords) do
        local upperWord = string.upper(word)
        if string.sub(upperWord, 1, #prefix) == prefix and not usedWordsInRound[word] then
            table.insert(matchingWords, word)
        end
    end
    
    if #matchingWords == 0 then
        return nil, "No unused words found for prefix: " .. prefix
    end
    
    -- Pilih kata random
    local selectedWord = matchingWords[math.random(1, #matchingWords)]
    usedWordsInRound[selectedWord] = true -- Mark as used
    
    -- Update status
    local usedCount = 0
    for _ in pairs(usedWordsInRound) do
        usedCount = usedCount + 1
    end
    
    local dbType = using79k and "(79k)" or "(fallback)"
    dbStatus.Text = "Database: " .. #allWords .. " kata " .. dbType .. " | Used: " .. usedCount
    
    return selectedWord, "success"
end
-- Function to simulate keyboard key press
local function simulateKeyPress(keyCode)
    local success1 = pcall(function()
        VirtualInputManager:SendKeyEvent(true, keyCode, false, game)
        wait(0.05)
        VirtualInputManager:SendKeyEvent(false, keyCode, false, game)
    end)
    
    if success1 then
        return true, "VirtualInputManager"
    end
    
    local success2 = pcall(function()
        local inputObject = {
            KeyCode = keyCode,
            UserInputType = Enum.UserInputType.Keyboard
        }
        
        UserInputService.InputBegan:Fire(inputObject, false)
        wait(0.05)
        UserInputService.InputEnded:Fire(inputObject, false)
    end)
    
    if success2 then
        return true, "UserInputService"
    end
    
    return false, "Keyboard simulation failed"
end

-- Function to simulate typing remaining word
local function simulateTyping(remainingWord)
    status.Text = "TYPING: '" .. remainingWord .. "' - Simulasi keyboard..."
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    spawn(function()
        local typingSuccess = true
        local method = ""
        
        -- Type each character with delay
        for i = 1, #remainingWord do
            local char = string.upper(string.sub(remainingWord, i, i))
            local keyCode = Enum.KeyCode[char]
            
            if keyCode then
                local success, usedMethod = simulateKeyPress(keyCode)
                if success then
                    method = usedMethod
                else
                    typingSuccess = false
                    break
                end
                wait(0.1)
            else
                typingSuccess = false
                break
            end
        end
        
        -- Try to press Enter after typing
        wait(0.3)
        simulateKeyPress(Enum.KeyCode.Return)
        
        if typingSuccess then
            successCount = successCount + 1
            status.Text = "SUCCESS: '" .. remainingWord .. "' | Total: " .. successCount
            status.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            status.Text = "FAILED: '" .. remainingWord .. "' - Keyboard simulation failed"
            status.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
        
        -- AUTO-CLEAR input field setelah proses selesai
        inputBox.Text = ""
        
        isProcessing = false
    end)
end

-- Main function to handle any prefix
local function handlePrefixDirectly(prefix)
    if not isActive then
        status.Text = "INACTIVE - Klik START dulu untuk aktifkan bypass"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        return
    end
    
    if not databaseLoaded then
        status.Text = "ERROR - Load database dulu (LOAD 79K atau fallback)"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    if isProcessing then
        status.Text = "BUSY - Tunggu proses sebelumnya selesai dulu"
        status.TextColor3 = Color3.fromRGB(255, 100, 0)
        return
    end
    
    prefix = string.upper(prefix)
    local fullWord, errorMsg = findWordWithPrefix(prefix)
    if not fullWord then
        status.Text = "ERROR: " .. errorMsg
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    -- Get remaining word (without prefix)
    local remainingWord = string.sub(fullWord, #prefix + 1)
    
    if remainingWord == "" then
        status.Text = "ERROR: Prefix sama dengan kata lengkap: " .. fullWord
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    status.Text = "SELECTED: " .. prefix .. " → " .. fullWord .. " | PROCESSING..."
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
    
    -- Langsung proses tanpa delay
    spawn(function()
        wait(0.5) -- Delay kecil untuk visual feedback
        simulateTyping(remainingWord)
    end)
end
-- Button handlers
downloadBtn.MouseButton1Click:Connect(function()
    if not using79k then
        load79kFromLua()
    end
end)

resetBtn.MouseButton1Click:Connect(function()
    usedWordsInRound = {}
    local dbType = using79k and "(79k)" or "(fallback)"
    dbStatus.Text = "Database: " .. #allWords .. " kata " .. dbType .. " | Used: 0 (RESET)"
    dbStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
    status.Text = "Used words reset - Semua kata bisa dipakai lagi"
    status.TextColor3 = Color3.fromRGB(0, 255, 0)
end)

startStopBtn.MouseButton1Click:Connect(function()
    if not databaseLoaded then
        status.Text = "ERROR - Load database dulu (LOAD 79K atau tunggu fallback)"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    isActive = not isActive
    
    if isActive then
        startStopBtn.Text = "STOP"
        startStopBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        local dbType = using79k and "79k words" or "fallback"
        status.Text = "ACTIVE - Using " .. dbType .. " | Build awalan lalu PROSES"
        status.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        startStopBtn.Text = "START"
        startStopBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        status.Text = "STOPPED - Klik START untuk aktifkan bypass"
        status.TextColor3 = Color3.fromRGB(255, 100, 100)
        isProcessing = false
    end
end)

-- Process button handler
processBtn.MouseButton1Click:Connect(function()
    local prefix = inputBox.Text
    if prefix == "" then
        status.Text = "ERROR - Masukkan awalan dulu (A, BA, KU, TER, dll)"
        status.TextColor3 = Color3.fromRGB(255, 0, 0)
        return
    end
    
    handlePrefixDirectly(prefix)
end)

-- Clear button handler
clearBtn.MouseButton1Click:Connect(function()
    inputBox.Text = ""
    status.Text = "Input cleared manually"
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
end)

-- Enter key handler for input box
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local prefix = inputBox.Text
        if prefix ~= "" then
            handlePrefixDirectly(prefix)
        end
    end
end)

-- Close button
closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)
-- A-Z Buttons untuk build awalan
local azLetters = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}
local buttonSize = 30
local buttonsPerRow = 13
local letterButtons = {}

for i, letter in pairs(azLetters) do
    local row = math.floor((i - 1) / buttonsPerRow)
    local col = (i - 1) % buttonsPerRow
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, buttonSize, 0, buttonSize)
    btn.Position = UDim2.new(0, 5 + col * (buttonSize + 3), 0, 140 + row * (buttonSize + 3))
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
    btn.Text = letter
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.SourceSansBold
    btn.Parent = mainFrame
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn
    
    letterButtons[letter] = btn
    
    -- Click handler untuk APPEND huruf ke field
    btn.MouseButton1Click:Connect(function()
        inputBox.Text = inputBox.Text .. letter -- APPEND huruf
        btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Hijau saat dipilih
        status.Text = "Input: '" .. inputBox.Text .. "' - Klik PROSES untuk lanjut"
        status.TextColor3 = Color3.fromRGB(255, 255, 0)
        
        -- Reset warna setelah selesai
        spawn(function()
            wait(1)
            btn.BackgroundColor3 = Color3.fromRGB(50, 50, 150)
        end)
    end)
end

-- Compact instruction
local instruction = Instance.new("TextLabel")
instruction.Size = UDim2.new(1, -10, 0, 30)
instruction.Position = UDim2.new(0, 5, 1, -35)
instruction.BackgroundTransparency = 1
instruction.Text = "MEGA 79K BYPASS - 79,898 Indonesian Words Database\nLOAD 79K → START → Build awalan (B→A→T) → PROSES | Fallback: 350 kata"
instruction.TextColor3 = Color3.fromRGB(180, 180, 180)
instruction.TextSize = 9
instruction.Font = Enum.Font.SourceSans
instruction.TextWrapped = true
instruction.Parent = mainFrame

-- === AUTO INITIALIZATION ===
spawn(function()
    -- Auto-load fallback database as backup
    loadFallbackDatabase()
    
    wait(1)
    status.Text = "READY - Klik LOAD untuk database expanded atau START untuk fallback"
    status.TextColor3 = Color3.fromRGB(255, 255, 0)
end)

print("Mega 79K Bypass loaded - 79,898 Indonesian words with fallback system!")