<#
Meeting Mitte Dezember
aus dem Puls Horizont wurde ein Postfach erstellt
versuch aus PW heraus mehrere Meetings automatisiertzu erstellen
#>
$ol = New-Object -ComObject Outlook.Application
##$ol.Session.Accounts | select DisplayName
$meeting = $ol.CreateItem(1)
$meeting.Organizer = 'pulshorizont@bedag.ch'
$meeting.Subject = 'Test # 4'
$meeting.Body = 'Let''s have a meeting'
$meeting.Location = 'tbd'
$meeting.ReminderSet = $true
$meeting.Importance = 1
$meeting.MeetingStatus = [Microsoft.Office.Interop.Outlook.OlMeetingStatus]::olMeeting
$meeting.Recipients.Add('michel.slotwinski@bedag.ch')
$meeting.Recipients.Add('michel.slotwinski@outlook.com')
$meeting.ReminderMinutesBeforeStart = 15
$meeting.Start = [datetime]::Today.Adddays(1)
##$meeting.Start = 2023-02-01 08:00:00.000
$meeting.Duration = 30
$meeting.Send()
# $meeting.move($folder)
$meeting | gm

$ol | gm

$ol.DefaultProfileName

$meeting.owner

$ol.Accounts

$ol.Session.Accounts

$al.AddressLists

$meeting.Organizer
$meeting | gm

