-- MIT License

-- Copyright (c) 2018 Ben James

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local M = {}
M.newgame = false
-- ゲームの状態　各番号により状態を判別
M.STATE_TITLE = 1
M.STATE_OPTION = 2
M.STATE_SCENE = 3

M.state = M.STATE_TITLE
-- コレクション状態
M.coll = 'title'
-- ボタン操作用
M.con_ok = false
--自動送り
M.auto_skip = false -- オートスキップフラグ 早送り
--↓セーブするやつ↓
M.APP_NAME = 'ST'
M.SAVE_FILE_NAME = 'savefile'
M.SETTINGS_FILE_NAME = 'settings'
-- ノベルパートの記録
M.cut_save = 0 -- イベント行数
M.E_num = 0 -- イベントNo　ニューゲーム時0
M.atai = {} -- 変数
--表示再現用
M.BGM = ''
 --流れているＢＧＭ
M.background = '' --表示している背景
M.CG1 = ''
 --表示しているキャラクター１
M.CG2 = ''
 --表示しているキャラクター２
--setting
--音量
M.musicvol = 1.0
M.sfxvol = 1.0

--有効範囲(rect)内かどうか判定
function M.ptinrect(x, y, rect)
    local r = false

    if x > rect.x and x < rect.z and y > rect.y and y < rect.w then
        r = true
    end

    return r
end

function M.loadgamefile(self)
    local file = sys.load(sys.get_save_file(M.APP_NAME, M.SAVE_FILE_NAME))

    M.cut_save = file.cut_save
    M.E_num = file.E_num
    M.atai = file.atai
    M.BGM = file.BGM
    M.background = file.background
    M.CG1 = file.CG1
    M.CG2 = file.CG2
end

function M.savegamefile(self)
    local file = {
        valid = 1,
        cut_save = M.cut_save,
        E_num = M.E_num,
        atai = M.atai,
        BGM = M.BGM,
        background = M.background,
        CG1 = M.CG1,
        CG2 = M.CG2
    }

    sys.save(sys.get_save_file(M.APP_NAME, M.SAVE_FILE_NAME), file)
end

function M.loadsettings(self)
    local file = sys.load(sys.get_save_file(M.APP_NAME, M.SETTINGS_FILE_NAME))

    M.musicvol = file.musicvol
    M.sfxvol = file.sfxvol

    if M.musicvol == nil then
        M.musicvol = 1
    end
    if M.sfxvol == nil then
        M.sfxvol = 1
    end
end

function M.savesettings(self)
    local file = {
        musicvol = M.musicvol,
        sfxvol = M.sfxvol
    }

    sys.save(sys.get_save_file(M.APP_NAME, M.SETTINGS_FILE_NAME), file)
end

function M.clearsavegame(self)
    local file = {
        valid = nil
    }
    sys.save(sys.get_save_file(M.APP_NAME, M.SAVE_FILE_NAME), file)
    M.cut_save = 0
    M.E_num = 0
    M.atai = {}
end

function M.validsavegame(self)
    local file = sys.load(sys.get_save_file(M.APP_NAME, M.SAVE_FILE_NAME))

    if file.valid == 1 then
    --セーブ時の状態に戻したい変数を入れる
    end

    return file.valid
end

return M
