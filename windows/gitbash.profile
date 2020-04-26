# See@ http://nekoyukimmm.hatenablog.com/entry/2015/03/22/224339
#
# "\e]2;" > control code to start changing the window title
# "\007"  > control code to end

function set_title()
{
	title="[$@]"
	echo -ne "\e]2;${title}\007"
}

function cd()
{
	builtin cd $@ && set_title `pwd`
}

