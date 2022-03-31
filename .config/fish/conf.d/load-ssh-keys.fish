#!/usr/bin/env fish

for key in (find ~/.ssh/ -not -name "*.pub" -not -name "known*" -not -name "envi*" -a -iname "[a-z]*")
    if test ! (echo $added_keys | grep -o -e $key)
        ssh-add "$key" >> /dev/null
    end
end
