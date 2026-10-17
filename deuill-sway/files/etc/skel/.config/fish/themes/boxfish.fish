function fish_mode_prompt
    if [ $fish_key_bindings = fish_vi_key_bindings ]
        switch $fish_bind_mode
            case default
                set_color white --background brblack
                echo -n ' n '
            case insert
                set_color white --background brblack
                echo -n ' i '
            case visual
                set_color white --background brblack
                echo -n ' v '
            case replace
                set_color white --background brblack
                echo -n ' R '
            case replace_one
                set_color white --background brblack
                echo -n ' r '
            case operator f F t T
                set_color white
                echo -n ' n '
            case '*'
                set_color white --background red
                echo -n ' ? '
        end
        set_color normal
    end
end

function fish_prompt
    set -l last_status $status
    set -l cwd (prompt_pwd)

    if not test $last_status -eq 0
        set_color --bold white --background red
        echo -n ' ! '
        set_color normal
    end

    # Show git branch and dirty state
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color white --background bryellow
            echo -n " $git_branch "
        else
            set_color white --background brgreen
            echo -n " $git_branch "
        end
    end

    # Add a space
    set_color normal
    echo -n ' '
end

set -g fish_right_prompt
