#Slack Uri generation steps for required workspace is available in url https://api.slack.com/messaging/webhooks#
$SlackChannelUri = "https://hooks.slack.com/services/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"
#$ChannelName is the place where name of the channel or slack id to whom the message needs to be sent is mentioned#
$ChannelName = "#bim_reporting_cube_status"
 
$BodyTemplate = @"
    {
        "channel": "CHANNELNAME", 
        "username": "BIM_PA_BOT", 
        "text": "MD cube refresh is done in BIM_PROD. Pending data validation",
        "icon_emoji":"robot_face:"
    }
"@
  $body = $BodyTemplate.Replace("DOMAIN_USERNAME","$user").Replace("DATETIME",$(Get-Date)).Replace("CHANNELNAME","$ChannelName")
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls -bor [Net.SecurityProtocolType]::Tls11 -bor [Net.SecurityProtocolType]::Tls12
        Invoke-RestMethod -uri $SlackChannelUri -Method Post -body $body -ContentType 'application/json'
   