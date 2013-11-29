runtime! plugin/tabpagecd.vim

describe 'tabpagecd'
  before
    let g:cwd = getcwd()
  end

  after
    cd `=fnameescape(g:cwd)`
  end

  it 'records and restores the current working directory for each tab page'
    Expect exists('t:cwd') toBeFalse

    let t:id = 1
    cd ./t
    tabnew
    let t:id = 2
    cd ../plugin

    tabnext 1
    Expect t:id == 1
    Expect t:cwd ==# g:cwd . '/t'
    Expect getcwd() ==# t:cwd

    tabnext 2
    Expect t:id == 2
    Expect t:cwd ==# g:cwd . '/plugin'
    Expect getcwd() ==# t:cwd
  end
end
