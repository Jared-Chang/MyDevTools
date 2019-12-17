set ignorecase smartcase

"""""""""""""""""""Misc
nmap zcc :mapclear!<CR>
nmap zso :source $VIM/_vimrc<CR>

"""""""""""""""""""Testing
"Copy test case from NUnit or Google Test
imap zct <Esc>o<Esc>y?\[Test\|TEST<CR>p/)<CR>Bciw
nmap zct o<Esc>y?\[Test\|TEST<CR>p/)<CR>Bciw

"Clean up code and run all test and open test explorer
nmap zra :vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz:vsc TestExplorer.RunAllTests<CR>zst
imap zra <Esc>:vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz:vsc TestExplorer.RunAllTests<CR>zst
vmap zra <Esc>:vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz:vsc TestExplorer.RunAllTests<CR>zst

"Open test explorer
nmap zst zz:vsc TestExplorer.ShowTestExplorer<CR>
imap zst <Esc>zz:vsc TestExplorer.ShowTestExplorer<CR>
vmap zst <Esc><Esc>zz:vsc TestExplorer.ShowTestExplorer<CR>

"Repeat last test
nmap zrl zz:vsc TestExplorer.RepeatLastRun<CR>
imap zrl <Esc>zz:vsc TestExplorer.RepeatLastRun<CR>
vmap zrl <Esc>zz:vsc TestExplorer.RepeatLastRun<CR>

"Debug last test
nmap zdl :vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz:vsc TestExplorer.DebugLastRun<CR>
imap zdl <Esc>:vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz<Esc>zz:vsc TestExplorer.DebugLastRun<CR>
vmap zdl <Esc>:vsc ReSharper.ReSharper_SilentCleanupCode<CR>zz<Esc>zz:vsc TestExplorer.DebugLastRun<CR>

"""""""""""""""""Navigation
"Navigate backward
nmap zk :vsc View.NavigateBackward<CR>
imap zk <Esc>:vsc View.NavigateBackward<CR>
vmap zk <Esc>:vsc View.NavigateBackward<CR>

"Navigate forward
nmap zj :vsc View.NavigateForward<CR>
imap zj <Esc>:vsc View.NavigateForward<CR>
vmap zj <Esc>:vsc View.NavigateForward<CR>

"Go to implementation
nmap zi :vsc VAssistX.GotoImplementation<CR>
imap zi <Esc>:vsc VAssistX.GotoImplementation<CR>
vmap zi <Esc>:vsc VAssistX.GotoImplementation<CR>

"Like Alt+m
nmap ,m :vsc ReSharper.ReSharper_GotoFileMember<CR>

"jump to define or usage or declaraction or parameter
nmap zf :vsc ReSharper.ReSharper_GoToDeclaration<CR>:vsc Resharper.ReSharper_GotoUsage<CR>
imap zf <Esc>:vsc ReSharper.ReSharper_GoToDeclaration<CR>:vsc Resharper.ReSharper_GotoUsage<CR>

"find usages of symbol
nmap zus :vsc Resharper.ReSharper_GotoUsage<CR>
imap zus <Esc>:vsc Resharper.ReSharper_GotoUsage<CR>

"Open find usage window
nmap zuu :vsc Resharper.Resharper_FindUsages<CR>
imap zuu <Esc>:vsc Resharper.Resharper_FindUsages<CR>

"jump to error (red wave)
nmap zn :vsc ReSharper.ReSharper_GotoPrevErrorInSolution<CR>

"jump to highlight (any color wave)
nmap zN :vsc ReSharper.ReSharper_GotoPrevHighlight<CR>

"next character after next ) or }
:nmap g) ])l<Esc>
:nmap g} ]}l<Esc>

"Visual studio ace jump extension
nmap <Space> :vsc Tools.InvokeAceJumpCommand<CR>

"""""""""""""""""Refactoring
"Extract Method
vmap M :vsc ReSharper.ReSharper_ExtractMethod<CR><Esc>

"Rename
nmap zrr :vsc ReSharper.ReSharper_Rename<CR><Esc>

"Show auto complete window
nmap zcw :vsc Edit.CompleteWord<CR>
imap zcw <Esc>:vsc Edit.CompleteWord<CR><Esc>

"Inline variable
map ziv :vsc ReSharper.ReSharper_InlineVariable<CR><Esc>

"Introduce variable
map zv :vsc ReSharper.ReSharper_IntroVariable<CR><Esc>

"Introduce parameter C# Only
map zsp vi":vsc ReSharper.ReSharper_IntroduceParameter<CR><Esc>
map zip :vsc ReSharper.ReSharper_IntroduceParameter<CR><Esc>
vmap P :vsc ReSharper.ReSharper_IntroduceParameter<CR><Esc>

"Introduce Field
nmap zif :vsc ReSharper.ReSharper_IntroduceField<CR><Esc>
imap zif <Esc>:vsc ReSharper.ReSharper_IntroduceField<CR><Esc>
vmap zif <Esc>:vsc ReSharper.ReSharper_IntroduceField<CR><Esc>

"Introduce field after find var and word
nmap zvf ?var <CR>w:vsc ReSharper.ReSharper_IntroduceField<CR><Esc>

"Change signature
nmap zcs :vsc ReSharper.ReSharper_ChangeSignature<CR>

"Right click menu > Create Unit Tests C# only
nmap ,t :vsc EditorContextMenus.CodeWindow.CreateUnitTests<CR>

"Create from template(class,interface,enum...)
nmap ,c :vsc ReSharper.ReSharper_GenerateFileBesides<CR>

"Generate members (ctor, override...)
nmap ,g :vsc ReSharper.ReSharper_Generate<CR>

"SurroundWith
vmap S :vsc ReSharper.ReSharper_SurroundWith<CR>

"Move line to SetUp when SetUp not exist C# only
nmap zrs dd?class<CR>jo[SetUp]<CR>public<Space>void<Space>SetUp(){<CR>}<Esc>P:vsc ReSharper.ReSharper_SilentCleanupCode<CR>

"Move line to SetUp when SetUp exist C# only
nmap zrx dd?SetUp<CR>jp:vsc ReSharper.ReSharper_SilentCleanupCode<CR>

"""""""""""""""""""Misc

"Open output window
nmap zo :vsc View.Output<CR>
imap zo <Esc>:vsc View.Output<CR>

"Copy history with search
nmap zpm :vsc ReSharper.ReSharper_PasteMultiple<CR>
imap zpm <Esc>:vsc ReSharper.ReSharper_PasteMultiple<CR>

"Move method to other type/class/interface
nmap zro :vsc ReSharper.ReSharper_Move<CR>

"newline and back to break point
nmap <C-CR> mza<CR><Esc>`z

"Add ;
nmap z; A;<Esc>
imap z; <Esc>A;<Esc>
vmap z; <Esc>A;<Esc>

"go to line head
nmap hh ^

"go to line tail
nmap ll $

"Delete line in insert mode
imap zdd <Esc>dd

"Reformat code and build
nmap zm :vsc ReSharper.ReSharper_ReformatCode<CR>:make<CR>

vmap <Esc> <Esc><Esc><Esc>
nmap <BS> a<BS>

"paste from yank not delete
nmap ,p "0p
nmap ,P "0P

""""""""""""""""""""""""""""""""""""""""""""""""Deprecated""""""""""""""""""""""""""""""""""""""""""""""
"""""Use resharper create file
"nmap zai :vsc Project.AddNewItem<CR> 
"nmap zac yiw:vsc Project.AddClass<CR><C-V>
"imap zac <Esc>:vsc Project.AddClass<CR>

""""""Use Ctrl+; or Ctrl+T or Search Every Where
"nmap zss zz:vsc View.SolutionExplorer<CR>
"imap zss <Esc>zz:vsc View.SolutionExplorer<CR>
"vmap zss <Esc><Esc>zz:vsc View.SolutionExplorer<CR>

"""""Use Ctrl+Alt+# and Shift+Alt+Enter
"nmap z1 :vsc Window.ApplyWindowLayout1<CR>
"nmap z2 :vsc Window.ApplyWindowLayout2<CR>
"nmap z3 :vsc Window.ApplyWindowLayout3<CR>
"nmap zfs :vsc View.FullScreen<CR>

"nmap zgc zz:make<CR>:vsc Team.Git.GotoGitChanges<CR>
"nmap zgp :vsc Team.Git.Pull<CR>
