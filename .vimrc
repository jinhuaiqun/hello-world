set nu "显示行号
syntax on "自动语法高亮
set shiftwidth=4 "默认缩进4个空格
set softtabstop=4 "使用tab时 tab空格数
set tabstop=4 "tab 代表4个空格
set expandtab "使用空格替换tab
set ai ci
set smartindent
set fileencodings=utf-8,gb2312,gbk,gb18030


""""""""""""""""""""""""""""""""""""""""""""""""
""快捷键F4，添加文件头注释，以及版权声明
map <F4> :call TitleDet()<cr>'s
function AddTitle()
    "call append( 0, "/* COPYRIGHT NOTICE")
    call append( 0, "\/* 版权声明")
    call append( 1, " * 功能     ：")
    call append( 2, " * 作者     ：jinhq")
    call append( 3, " * 文件路径 : ".expand("%:p:h")."/".expand("%:t"))
    call append( 4, " * 创建时间 ：".strftime("%Y/%m/%d %H:%M"))
    call append( 5, " *\/")
    call append( 6, "")

    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/#       @date      /s@:.*$@\=strftime(":%Y-%m-%d %H:%M")@'                                                            
    normal ''
    normal mk
    execute '/#       @file      /s@:.*$@\=":".expand("%:p:h")."\\".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有COPYRIGHT NOTICE这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n = 1
        "默认为添加
        let line = getline(n)
        "let str = '^/\* COPYRIGHT NOTICE$'
        let str = '^/\* 版权声明$'
        if line =~ str
            call UpdateTitle()
            return
        endif
    call AddTitle()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
""快捷键F5，生成main函数模板
map <F5> :call TitleDet_main()<cr>'s
function AddTitle_main()
    "call append( 0, "/* COPYRIGHT NOTICE")
    call append( 0, "\/* 版权声明")
    call append( 1, " * 功能     ：")
    call append( 2, " * 作者     ：jinhq")
    call append( 3, " * 文件路径 : ".expand("%:p:h")."/".expand("%:t"))
    call append( 4, " * 创建时间 ：".strftime("%Y/%m/%d %H:%M"))
    call append( 5, " *\/")
    call append( 6, "")                                                                                                             
    call append( 7, "#include <stdio.h>")
    call append( 8, "#include <string.h>")
    call append( 9, "")
    call append(10, "int main(int argc, char *argv[])")
    call append(11, "{")
    call append(12, "")
    call append(13, "    return 0;")
    call append(14, "}")


    echohl WarningMsg | echo "Successful in adding the main function." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle_main()
    normal m'
    execute '/#       @date      /s@:.*$@\=strftime(":%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/#       @file      /s@:.*$@\=":".expand("%:p:h")."\\".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the main function." | echohl None
endfunction
"判断前10行代码里面，是否有COPYRIGHT NOTICE这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet_main()
    let n = 1
    "默认为添加
        let line = getline(n)
        "let str = '^/\* COPYRIGHT NOTICE$'
        let str = '^/\* 版权声明$'                                                                                                  
        if line =~ str
            call UpdateTitle_main()
            return
        endif
    call AddTitle_main()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""
""快捷键F6，生成.h文件模板
map <F6> :call TitleDet_h()<cr>'s
function AddTitle_h()
    "call append( 0, "/* COPYRIGHT NOTICE")
    call append( 0, "\/* 版权声明")
    call append( 1, " * 功能     ：")
    call append( 2, " * 作者     ：jinhq")
    call append( 3, " * 文件路径 : ".expand("%:p:h")."/".expand("%:t"))
    call append( 4, " * 创建时间 ：".strftime("%Y/%m/%d %H:%M"))
    call append( 5, " *\/")
    call append( 6, "")
    call append( 7, "#ifndef ")
    call append( 8, "#define ")
    call append( 9, "")
    call append(10, "")
    call append(11, "")
    call append(12, "#endif")

    echohl WarningMsg | echo "Successful in adding the .h file." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle_h()
    normal m'
    execute '/#       @date      /s@:.*$@\=strftime(":%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/#       @file      /s@:.*$@\=":".expand("%:p:h")."\\".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the .h file." | echohl None                                                    
endfunction
"判断前10行代码里面，是否有COPYRIGHT NOTICE这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet_h()
    let n = 1
    "默认为添加
        let line = getline(n)
        "let str = '^/\* COPYRIGHT NOTICE$'
        let str = '^/\* 版权声明$'
        if line =~ str
            call UpdateTitle_h()
            return
        endif
    call AddTitle_h()                                                                                                               
endfunction


