runtime! plugin/tabpagecd.vim

describe 'tabpagecd'
  it 'works well with a path with spaces'
    let cwd = getcwd()

    cd `=cwd . '/plugin'`
    tabnew
    cd `=cwd . '/t/sample/spaced path'`

    tabnext 1
    Expect t:cwd ==# cwd . '/plugin'
    Expect getcwd() ==# t:cwd

    tabnext 2
    Expect t:cwd ==# cwd . '/t/sample/spaced path'
    Expect getcwd() ==# t:cwd
  end
end
