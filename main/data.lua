
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
-- イベント番号、ADVパートの読み込みデータの切り替え用
M.EVENT_NUM = 0
-- イベントNo　ニューゲーム時0
M.E_num = "0"
-- ゲームの状態　各番号により状態を判別
M.STATE_TITLE = 1
M.STATE_OPTION = 2
M.STATE_SCENE = 3

M.state = M.STATE_TITLE
-- コレクション状態
M.coll = "title"
-- table[1.1] = 1
-- 変数
M.atai = {}
-- イベントNo　ニューゲーム時0
M.E_num = 0

return M
