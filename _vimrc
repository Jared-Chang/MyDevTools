set ignorecase smartcase
nmap zcc :mapclear!<CR>
nmap zso :source C:\Users\QiFen\_vimrc <CR>
imap <F1> <Esc>y?[T<CR>p/void<CR>w
nmap <F1> y?[T<CR>p/void<CR>w
imap <F2> <Esc>y?TEST(<CR>p4wciw
nmap <F2> y?TEST(<CR>p4wciw
nmap zrn :vsc Project.AddNewItem<CR> 
nmap zm :vsc CodeMaid.CleanupActiveDocument<CR>:make<CR>
nmap zra zz:vsc CodeMaid.CleanupActiveDocument<CR>:vsc TestExplorer.RunAllTests<CR>:vsc TestExplorer.ShowTestExplorer<CR>
imap zra <Esc>zz:vsc CodeMaid.CleanupActiveDocument<CR>:vsc TestExplorer.RunAllTests<CR>:vsc TestExplorer.ShowTestExplorer<CR>
vmap zra <Esc><Esc>zz:vsc CodeMaid.CleanupActiveDocument<CR>:vsc TestExplorer.RunAllTests<CR>:vsc TestExplorer.ShowTestExplorer<CR>
nmap zst zz:vsc TestExplorer.ShowTestExplorer<CR>
imap zst <Esc>zz:vsc TestExplorer.ShowTestExplorer<CR>
vmap zst <Esc><Esc>zz:vsc TestExplorer.ShowTestExplorer<CR>
nmap zrl zz:vsc CodeMaid.CleanupActiveDocument<CR>:vsc TestExplorer.RepeatLastRun<CR>
imap zrl <Esc>zz:vsc CodeMaid.CleanupActiveDocument<CR>:vsc TestExplorer.RepeatLastRun<CR>
nmap zgc zz:vsc CodeMaid.CleanupActiveDocument<CR>:make<CR>:vsc Team.Git.GotoGitChanges<CR>
nmap zgp :vsc Team.Git.Pull<CR>
nmap zk :vsc View.NavigateBackward<CR>
imap zk <Esc>:vsc View.NavigateBackward<CR>
nmap zj :vsc View.NavigateForward<CR>
imap zj <Esc>:vsc View.NavigateForward<CR>
nmap z. :vsc View.QuickActions<CR>
imap z. <Esc>:vsc View.QuickActions<CR>

nmap zss zz:vsc View.SolutionExplorer<CR>
imap zss <Esc>zz:vsc View.SolutionExplorer<CR>
vmap zss <Esc><Esc>zz:vsc View.SolutionExplorer<CR>

nmap gw1 :vsc Window.ApplyWindowLayout1<CR>
nmap gw2 :vsc Window.ApplyWindowLayout2<CR>
nmap gw3 :vsc Window.ApplyWindowLayout3<CR>
nmap gw4 :vsc Window.ApplyWindowLayout4<CR>
nmap gw5 :vsc Window.ApplyWindowLayout5<CR>
nmap gw6 :vsc Window.ApplyWindowLayout6<CR>
nmap gw7 :vsc Window.ApplyWindowLayout7<CR>
nmap gfs :vsc View.FullScreen<CR>

imap zae Assert.AreEqual(expected,actual);<Esc>T(
nmap zae aAssert.AreEqual(expected,actual);<Esc>T(

nmap zrr :vsc ReSharper.ReSharper_Rename<CR>
nmap zrm :vsc ReSharper.ReSharper_ExtractMethod<CR>
vmap zrm :vsc ReSharper.ReSharper_ExtractMethod<CR>
map zrp :vsc ReSharper.ReSharper_IntroduceParameter<CR>
map zri :vsc ReSharper.ReSharper_InlineVariable<CR>
map zrv :vsc ReSharper.ReSharper_IntroVariable<CR>
map zrf :vsc ReSharper.ReSharper_IntroduceField<CR>
nmap zrt :vsc ReSharper.ReSharper_GotoType<CR>
nmap zro :vsc ReSharper.ReSharper_Move<CR>
nmap zsc :vsc ReSharper.ReSharper_ShowCodeStructure<CR> 
nmap zcs :vsc ReSharper.ReSharper_ChangeSignature<CR>
nmap zpm :vsc ReSharper.ReSharper_PasteMultiple<CR>
imap zpm <Esc>:vsc ReSharper.ReSharper_PasteMultiple<CR>
nmap zf :vsc ReSharper.ReSharper_GoToDeclaration<CR>
imap zf <Esc>:vsc ReSharper.ReSharper_GoToDeclaration<CR>

nmap zrc :vsc CodeMaid.CleanupActiveDocument<CR>
imap zrc <Esc>:vsc CodeMaid.CleanupActiveDocument<CR>
nmap zrz :vsc CodeMaid.ReorganizeActiveDocument<CR>
imap zrz <Esc>:vsc CodeMaid.ReorganizeActiveDocument<CR>

nmap za; $a;<Esc>
imap za; <Esc>$a;<Esc>
vmap za; <Esc>$a;<Esc>

:vmap <Esc> <Esc><Esc><Esc>
:imap jj <Esc>
:nmap <BS> a<BS>
:nmap zh ^
:nmap hh ^
:imap zh <Esc>^i
:nmap zl $
:nmap ll $
:imap zl <End>
:nmap hc ^C
:nmap zb bcw
:imap zd <Esc>dd
nmap j gj
nmap k gk
nmap qq ZQ
nmap zq :wq<CR>
" map C :set rnu!<CR>
" insert single char
:map ,i i?<Esc>r
" append single char
:map ,a a?<Esc>r