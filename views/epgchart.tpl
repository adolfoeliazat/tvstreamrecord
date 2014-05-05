<div id="zoom" zoom="{{zoom}}"></div>
<div id="users-contain" class="ui-widget">
    <h1>
        <div id="label_epg_1">§Electronic Program Guide§. §Current date§:</div>
        <input type="text" maxlength="10" id="datepicker_epg" class="text ui-widget-content ui-corner-all" name="datepicker_epg" dbvalue="{{curr}}"/> 
        <div id="label_epg_2">§Keyword§:</div>
        <input type="text" maxlength="50" id="searchepg" class="text ui-widget-content ui-corner-all" name="searchepg" value=""/> 
        <button id="searchepgbutton">§Highlight§</button>
        <button id="grabepg" text1="§Grab EPG from§" text2="§source(s)§" text3="§Stop loading EPG§" text4="§Stopping EPG, please refresh§"></button>
    </h1>
</div>
%cnt=0
%for rows in rowss:
    %if len(rows)>0:
        %if rows[0][0] == -1:
<div id="epg_cname" cnt="{{cnt}}">
        %else:
<div id="epg_cname" cnt="{{cnt}}">
    <div><b><a href="live/{{rows[0][0]}}.m3u">{{rows[0][8]}}</a></b>
        <label title="Disable channel" id="iconsDisable-{{rows[0][0]}}" class="ui-state-default ui-corner-all"><span class="ui-icon ui-icon-close"></span></label>
    </div>
        %end
</div>
<div id="channelgroup">
        %for row in rows:
    <div class="ui-state-default" id="event" cnt="{{cnt}}" cid="{{row[0]}}" x="{{row[1]}}" width="{{row[2]}}" at="{{row[4]}}" till="{{row[5]}}" fulltext="{{row[6]}}" rid="{{row[7]}}" recording="{{row[9]}}">{{row[3]}}</div>
        %end
</div>
        %cnt=cnt+1
    %end
%end
</div>
<div id="dialog_record_from_epg" title="§Detail view§" record="§Record§" cancel="§Cancel§">
    <div id="dialog_content">
        <!-- Empty -->
    </div>
</div>
<form method='POST' enctype='multipart/form-data' action='/createepg' name='returnform'>
    <input type="text" style="display: none;" name="ret" id="ret" value="X"/>
</form>
<div id="dialog_channel_disable" title="§Channel disable§" disable="§Disable§" cancel="§Cancel§">
	<p>§Do you want to disable this channel? You can enable it again at the channel list page.§</p>
</div>