runtime! plugin/tabpagecd.vim

describe 'tabpagecd'
  before
    let g:cwd = getcwd(-1)
  end

  after
    cd `=g:cwd`
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
    Expect getcwd(-1) ==# t:cwd

    tabnext 2
    Expect t:id == 2
    Expect t:cwd ==# g:cwd . '/plugin'
    Expect getcwd(-1) ==# t:cwd
  end
end
