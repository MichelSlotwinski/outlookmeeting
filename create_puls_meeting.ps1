##chcp 65001  
function crtpulsmeeting{
    param(
        [string]$startstring,
        [string]$t1uid,
        [string]$t1vorname,
        [string]$t2uid,
        [string]$t2vorname
)
$meetstart=[Datetime]::ParseExact($startstring, 'yyyy-MM-dd HH:mm:ss' ,[Globalization.CultureInfo]::CreateSpecificCulture('de-CH'))
[string]$subj = 'PulsHorizont Austausch'
[string]$meetbody = 'Hallo '+$t1vorname+', Hallo '+$t2vorname+',
Im Rahmen des Vorhabens Puls Horizont haben wir das Thema "fehlende Koordination" bearbeitet. Daraus ist der Vorschlag entstanden, einen regelmässigen Austausch zwischen Führungskräften zu etablieren, um die Kommunikationswege zu verkürzen und für grössere Transparenz zu sorgen. Wir hatten einen ersten Versuch für zwei Monate gestartet, in welchem sich Teamleiter, die nicht in der gleichen Abteilung sind austauschen. Die Erfahrungen sollten auf der confluence Seite - Meeting zwischen allen TL (PoC) https://confluence.bedag.ch/x/FIrBDg) protokolliert werden. Die Rücklaufquote war leider wenig aussagekräftig, weshalb zusätzlich Meinungen per Interview eingeholt wurden. Daraus ergab sich als Feedback, dass trotz anfänglicher Skepsis, der Austausch als sehr positiv empfunden wurde. 

Deshalb haben wir uns entschieden, eine weitere Runde mit zwei Anpassungen zu starten. Wir erweitern den Kreis auf alle Führungskräfte welche am Workshop “Puls Bedag in Führung” teilnehmen und wir setzen einen unbestimmten Termin um die Einstiegshürde zu senken und auch einen Überblick über die Durchführung zu erhalten. 

Jedoch benötigen wir Deine Mithilfe '+$t1vorname+'. Wir bitten Dich in Rücksprache mit '+$t2vorname+' einen passenden Termin zu finden und Dich für einen Ort zu entscheiden. Bedauerlicherweise ist Outlook bei Terminen recht beschränkt und uns ist es nicht möglich, die Organisation eines Termins an jemanden zu delegieren, weshalb es nötig ist, dass Du entweder eine neue Zeit für diesen Termin vorschlägst oder diesen Termin absagst und stattdessen einen neuen Termin erstellst. In diesem Fall wären wir froh, Du würdest den Account pulshorizont@bedag.ch als optionalen Teilnehmer aufnehmen. Natürlich wären wir auch für eine freiwillige kurze Protokollierung und Eure Einschätzung unter https://confluence.bedag.ch/x/FIrBDg#MeetingzwischenallenTL(PoC)-Protokollierung dankbar.
     
Wir sind uns sicher, auch Dich von den Vorteilen dieser Meeting- Reihe überzeugen zu können und freuen uns auf einen regen Austausch. 
     
Viele Grüsse
Michel und das Puls Horizont Team
'

$ol = New-Object -ComObject Outlook.Application
$meeting = $ol.CreateItem(1)
$meeting.Organizer = 'pulshorizont@bedag.ch'
$meeting.Subject = $subj
$meeting.Body = $meetbody
$meeting.Location = 'tbd'
$meeting.ReminderSet = $true
$meeting.Importance = 1
$meeting.MeetingStatus = [Microsoft.Office.Interop.Outlook.OlMeetingStatus]::olMeeting
$meeting.Recipients.Add($t1uid)
$meeting.Recipients.Add($t2uid)
$meeting.ReminderMinutesBeforeStart = 30
$meeting.Start = $meetstart
$meeting.Duration = 30
$meeting.Send()
    #Write-Host $meetbody
}





<##>


<#
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "andreas.meyer@bedag.ch" -t1vorname "Andreas" -t2uid "michael.haueter@bedag.ch" -t2vorname "Michael"

crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "astrid.becker@bedag.ch" -t1vorname "Astrid" -t2uid "matthias.eberle@bedag.ch" -t2vorname "Matthias"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "christian.daellenbach@bedag.ch" -t1vorname "Christian" -t2uid "rolf.gottier@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "christian.saner@bedag.ch" -t1vorname "Christian" -t2uid "beat.leuenberger@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "christian.studer@bedag.ch" -t1vorname "Christian" -t2uid "beat.siegenthaler@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "daniel.imoberdorf@bedag.ch" -t1vorname "Daniel" -t2uid "jan.jeitziner@bedag.ch" -t2vorname "Jan"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "daniela.burkhard@bedag.ch" -t1vorname "Daniela" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "daniele.siragusano@bedag.ch" -t1vorname "Daniele" -t2uid "stefan.clausen@bedag.ch" -t2vorname "Stefan"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "dario.bagatto@bedag.ch" -t1vorname "Dario" -t2uid "juerg.weber@bedag.ch" -t2vorname "Jürg"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "dario.verrengia@bedag.ch" -t1vorname "Dario" -t2uid "eric.scherrer@bedag.ch" -t2vorname "Eric"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "denys.aeberhardt@bedag.ch" -t1vorname "Denys" -t2uid "martin.voegeli@bedag.ch" -t2vorname "Martin"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "domenic.mirwald@bedag.ch" -t1vorname "Domenic" -t2uid "michel.soravia@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "dominic.salzmann@bedag.ch" -t1vorname "Dominic" -t2uid "andreas.zaugg@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "dominic.stoll@bedag.ch" -t1vorname "Dominic" -t2uid "renato.stebler@bedag.ch" -t2vorname "Renato"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "eric.hugi@bedag.ch" -t1vorname "Eric" -t2uid "colin.haldemann@bedag.ch" -t2vorname "Colin"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "franz.sterchi@bedag.ch" -t1vorname "Franz" -t2uid "michel.slotwinski@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "hector.ortiz@bedag.ch" -t1vorname "Hector" -t2uid "wolfram.mathys@bedag.ch" -t2vorname "Wolfram"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "juerg.gugger@bedag.ch" -t1vorname "Jürg" -t2uid "mario.beyeler@bedag.ch" -t2vorname "Mario"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "leonhard.greulich@bedag.ch" -t1vorname "Leonhard" -t2uid "marco.cadisch@bedag.ch" -t2vorname "Marco"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "lukas.germann@bedag.ch" -t1vorname "Lukas" -t2uid "thomas.alabor@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "markus.hechelmann@bedag.ch" -t1vorname "Markus" -t2uid "rolf.kuenzli@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "matthias.pfammatter@bedag.ch" -t1vorname "Matthias" -t2uid "sylvain.perret@bedag.ch" -t2vorname "Sylvain"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "michel.kohler@bedag.ch" -t1vorname "Michel" -t2uid "thomas.schreier@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "michel.rudin@bedag.ch" -t1vorname "Michel" -t2uid "rene.caspar@bedag.ch" -t2vorname "René"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "nicolas.haenni@bedag.ch" -t1vorname "Nicolas" -t2uid "stephan.steiner@bedag.ch" -t2vorname "Stephan"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "oliver.hofer@bedag.ch" -t1vorname "Oliver" -t2uid "karin.dignazio@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "patrick.wagner@bedag.ch" -t1vorname "Patrick" -t2uid "karin.bischoff@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "peter.sinzig@bedag.ch" -t1vorname "Peter" -t2uid "markus.lauber@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "remo.broennimann@bedag.ch" -t1vorname "Remo" -t2uid "roman.wurzel@bedag.ch" -t2vorname "Roman"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "remo.wyss@bedag.ch" -t1vorname "Remo" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "reto.gertschen@bedag.ch" -t1vorname "Reto" -t2uid "joshua.brunner@bedag.ch" -t2vorname "Joshua"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "roger.koenig@bedag.ch" -t1vorname "Roger" -t2uid "hans.gehriger@bedag.ch" -t2vorname "Hans"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "thomas.murer@bedag.ch" -t1vorname "Thomas" -t2uid "francisco.alvarez@bedag.ch" -t2vorname "Francisco"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "thomas.walliser@bedag.ch" -t1vorname "Thomas" -t2uid "bruno.schori@bedag.ch" -t2vorname "Bruno"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "thomas.zindel@bedag.ch" -t1vorname "Thomas" -t2uid "jenny.dales@bedag.ch" -t2vorname "Jenny"
crtpulsmeeting -startstring "2023-02-20 08:00:00" -t1uid "yves.jacob@bedag.ch" -t1vorname "Yves" -t2uid "adrian.bronner@bedag.ch" -t2vorname "Adrian"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "adrian.bronner@bedag.ch" -t1vorname "Adrian" -t2uid "bruno.schori@bedag.ch" -t2vorname "Bruno"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "andreas.meyer@bedag.ch" -t1vorname "Andreas" -t2uid "renato.stebler@bedag.ch" -t2vorname "Renato"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "astrid.becker@bedag.ch" -t1vorname "Astrid" -t2uid "daniela.burkhard@bedag.ch" -t2vorname "Daniela"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "beat.leuenberger@bedag.ch" -t1vorname "Beat" -t2uid "andreas.zaugg@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "beat.siegenthaler@bedag.ch" -t1vorname "Beat" -t2uid "eric.scherrer@bedag.ch" -t2vorname "Eric"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "christian.daellenbach@bedag.ch" -t1vorname "Christian" -t2uid "juerg.gugger@bedag.ch" -t2vorname "Jürg"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "daniele.siragusano@bedag.ch" -t1vorname "Daniele" -t2uid "leonhard.greulich@bedag.ch" -t2vorname "Leonhard"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "dario.bagatto@bedag.ch" -t1vorname "Dario" -t2uid "dominic.stoll@bedag.ch" -t2vorname "Dominic"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "denys.aeberhardt@bedag.ch" -t1vorname "Denys" -t2uid "roman.wurzel@bedag.ch" -t2vorname "Roman"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "domenic.mirwald@bedag.ch" -t1vorname "Domenic" -t2uid "colin.haldemann@bedag.ch" -t2vorname "Colin"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "francisco.alvarez@bedag.ch" -t1vorname "Francisco" -t2uid "dominic.salzmann@bedag.ch" -t2vorname "Dominic"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "hector.ortiz@bedag.ch" -t1vorname "Hector" -t2uid "eric.hugi@bedag.ch" -t2vorname "Eric"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "juerg.weber@bedag.ch" -t1vorname "Jürg" -t2uid "christian.studer@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "karin.bischoff@bedag.ch" -t1vorname "Karin" -t2uid "daniel.imoberdorf@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "karin.dignazio@bedag.ch" -t1vorname "Karin" -t2uid "sylvain.perret@bedag.ch" -t2vorname "Sylvain"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "lukas.germann@bedag.ch" -t1vorname "Lukas" -t2uid "michel.kohler@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "mario.beyeler@bedag.ch" -t1vorname "Mario" -t2uid "stephan.steiner@bedag.ch" -t2vorname "Stephan"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "markus.lauber@bedag.ch" -t1vorname "Markus" -t2uid "yves.jacob@bedag.ch" -t2vorname "Yves"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "matthias.eberle@bedag.ch" -t1vorname "Matthias" -t2uid "rolf.gottier@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "matthias.pfammatter@bedag.ch" -t1vorname "Matthias" -t2uid "joshua.brunner@bedag.ch" -t2vorname "Joshua"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "michel.rudin@bedag.ch" -t1vorname "Michel" -t2uid "martin.voegeli@bedag.ch" -t2vorname "Martin"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "michel.soravia@bedag.ch" -t1vorname "Michel" -t2uid "thomas.murer@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "nicolas.haenni@bedag.ch" -t1vorname "Nicolas" -t2uid "dario.verrengia@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "oliver.hofer@bedag.ch" -t1vorname "Oliver" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "patrick.wagner@bedag.ch" -t1vorname "Patrick" -t2uid "markus.hechelmann@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "peter.sinzig@bedag.ch" -t1vorname "Peter" -t2uid "thomas.walliser@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "remo.broennimann@bedag.ch" -t1vorname "Remo" -t2uid "jenny.dales@bedag.ch" -t2vorname "Jenny"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "remo.wyss@bedag.ch" -t1vorname "Remo" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "rene.caspar@bedag.ch" -t1vorname "René" -t2uid "roger.koenig@bedag.ch" -t2vorname "Roger"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "reto.gertschen@bedag.ch" -t1vorname "Reto" -t2uid "franz.sterchi@bedag.ch" -t2vorname "Franz"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "rolf.kuenzli@bedag.ch" -t1vorname "Rolf" -t2uid "hans.gehriger@bedag.ch" -t2vorname "Hans"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "simon.fuhrer@bedag.ch" -t1vorname "Simon" -t2uid "thomas.schreier@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "stefan.clausen@bedag.ch" -t1vorname "Stefan" -t2uid "michael.haueter@bedag.ch" -t2vorname "Michael"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "thomas.alabor@bedag.ch" -t1vorname "Thomas" -t2uid "michel.slotwinski@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "thomas.zindel@bedag.ch" -t1vorname "Thomas" -t2uid "marco.cadisch@bedag.ch" -t2vorname "Marco"
crtpulsmeeting -startstring "2023-03-06 08:00:00" -t1uid "wolfram.mathys@bedag.ch" -t1vorname "Wolfram" -t2uid "jan.jeitziner@bedag.ch" -t2vorname "Jan"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "andreas.meyer@bedag.ch" -t1vorname "Andreas" -t2uid "stephan.steiner@bedag.ch" -t2vorname "Stephan"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "beat.leuenberger@bedag.ch" -t1vorname "Beat" -t2uid "dario.verrengia@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "beat.siegenthaler@bedag.ch" -t1vorname "Beat" -t2uid "wolfram.mathys@bedag.ch" -t2vorname "Wolfram"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "bruno.schori@bedag.ch" -t1vorname "Bruno" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "christian.daellenbach@bedag.ch" -t1vorname "Christian" -t2uid "matthias.pfammatter@bedag.ch" -t2vorname "Matthias"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "daniel.imoberdorf@bedag.ch" -t1vorname "Daniel" -t2uid "christian.saner@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "dario.bagatto@bedag.ch" -t1vorname "Dario" -t2uid "oliver.hofer@bedag.ch" -t2vorname "Oliver"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "denys.aeberhardt@bedag.ch" -t1vorname "Denys" -t2uid "michel.rudin@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "dominic.salzmann@bedag.ch" -t1vorname "Dominic" -t2uid "colin.haldemann@bedag.ch" -t2vorname "Colin"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "dominic.stoll@bedag.ch" -t1vorname "Dominic" -t2uid "francisco.alvarez@bedag.ch" -t2vorname "Francisco"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "franz.sterchi@bedag.ch" -t1vorname "Franz" -t2uid "daniela.burkhard@bedag.ch" -t2vorname "Daniela"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "hans.gehriger@bedag.ch" -t1vorname "Hans" -t2uid "michel.kohler@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "hector.ortiz@bedag.ch" -t1vorname "Hector" -t2uid "markus.hechelmann@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "jan.jeitziner@bedag.ch" -t1vorname "Jan" -t2uid "christian.studer@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "jenny.dales@bedag.ch" -t1vorname "Jenny" -t2uid "nicolas.haenni@bedag.ch" -t2vorname "Nicolas"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "juerg.weber@bedag.ch" -t1vorname "Jürg" -t2uid "joshua.brunner@bedag.ch" -t2vorname "Joshua"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "karin.dignazio@bedag.ch" -t1vorname "Karin" -t2uid "thomas.alabor@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "leonhard.greulich@bedag.ch" -t1vorname "Leonhard" -t2uid "eric.hugi@bedag.ch" -t2vorname "Eric"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "marco.cadisch@bedag.ch" -t1vorname "Marco" -t2uid "astrid.becker@bedag.ch" -t2vorname "Astrid"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "markus.lauber@bedag.ch" -t1vorname "Markus" -t2uid "karin.bischoff@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "martin.voegeli@bedag.ch" -t1vorname "Martin" -t2uid "rene.caspar@bedag.ch" -t2vorname "René"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "matthias.eberle@bedag.ch" -t1vorname "Matthias" -t2uid "adrian.bronner@bedag.ch" -t2vorname "Adrian"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "michael.haueter@bedag.ch" -t1vorname "Michael" -t2uid "renato.stebler@bedag.ch" -t2vorname "Renato"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "michel.soravia@bedag.ch" -t1vorname "Michel" -t2uid "roman.wurzel@bedag.ch" -t2vorname "Roman"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "patrick.wagner@bedag.ch" -t1vorname "Patrick" -t2uid "juerg.gugger@bedag.ch" -t2vorname "Jürg"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "peter.sinzig@bedag.ch" -t1vorname "Peter" -t2uid "mario.beyeler@bedag.ch" -t2vorname "Mario"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "remo.broennimann@bedag.ch" -t1vorname "Remo" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "remo.wyss@bedag.ch" -t1vorname "Remo" -t2uid "daniele.siragusano@bedag.ch" -t2vorname "Daniele"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "reto.gertschen@bedag.ch" -t1vorname "Reto" -t2uid "yves.jacob@bedag.ch" -t2vorname "Yves"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "roger.koenig@bedag.ch" -t1vorname "Roger" -t2uid "lukas.germann@bedag.ch" -t2vorname "Lukas"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "rolf.kuenzli@bedag.ch" -t1vorname "Rolf" -t2uid "thomas.schreier@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "simon.fuhrer@bedag.ch" -t1vorname "Simon" -t2uid "eric.scherrer@bedag.ch" -t2vorname "Eric"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "stefan.clausen@bedag.ch" -t1vorname "Stefan" -t2uid "michel.slotwinski@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "sylvain.perret@bedag.ch" -t1vorname "Sylvain" -t2uid "domenic.mirwald@bedag.ch" -t2vorname "Domenic"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "thomas.murer@bedag.ch" -t1vorname "Thomas" -t2uid "thomas.walliser@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-03-20 08:00:00" -t1uid "thomas.zindel@bedag.ch" -t1vorname "Thomas" -t2uid "andreas.zaugg@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "adrian.bronner@bedag.ch" -t1vorname "Adrian" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "astrid.becker@bedag.ch" -t1vorname "Astrid" -t2uid "dario.verrengia@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "beat.siegenthaler@bedag.ch" -t1vorname "Beat" -t2uid "nicolas.haenni@bedag.ch" -t2vorname "Nicolas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "bruno.schori@bedag.ch" -t1vorname "Bruno" -t2uid "roger.koenig@bedag.ch" -t2vorname "Roger"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "christian.daellenbach@bedag.ch" -t1vorname "Christian" -t2uid "thomas.schreier@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "christian.studer@bedag.ch" -t1vorname "Christian" -t2uid "stephan.steiner@bedag.ch" -t2vorname "Stephan"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "colin.haldemann@bedag.ch" -t1vorname "Colin" -t2uid "christian.saner@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "daniela.burkhard@bedag.ch" -t1vorname "Daniela" -t2uid "mario.beyeler@bedag.ch" -t2vorname "Mario"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "daniele.siragusano@bedag.ch" -t1vorname "Daniele" -t2uid "yves.jacob@bedag.ch" -t2vorname "Yves"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "denys.aeberhardt@bedag.ch" -t1vorname "Denys" -t2uid "daniel.imoberdorf@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "dominic.salzmann@bedag.ch" -t1vorname "Dominic" -t2uid "remo.wyss@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "dominic.stoll@bedag.ch" -t1vorname "Dominic" -t2uid "simon.fuhrer@bedag.ch" -t2vorname "Simon"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "eric.hugi@bedag.ch" -t1vorname "Eric" -t2uid "jenny.dales@bedag.ch" -t2vorname "Jenny"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "eric.scherrer@bedag.ch" -t1vorname "Eric" -t2uid "hector.ortiz@bedag.ch" -t2vorname "Hector"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "franz.sterchi@bedag.ch" -t1vorname "Franz" -t2uid "michel.soravia@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "hans.gehriger@bedag.ch" -t1vorname "Hans" -t2uid "dario.bagatto@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "joshua.brunner@bedag.ch" -t1vorname "Joshua" -t2uid "markus.lauber@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "juerg.gugger@bedag.ch" -t1vorname "Jürg" -t2uid "michael.haueter@bedag.ch" -t2vorname "Michael"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "juerg.weber@bedag.ch" -t1vorname "Jürg" -t2uid "jan.jeitziner@bedag.ch" -t2vorname "Jan"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "karin.bischoff@bedag.ch" -t1vorname "Karin" -t2uid "andreas.meyer@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "karin.dignazio@bedag.ch" -t1vorname "Karin" -t2uid "patrick.wagner@bedag.ch" -t2vorname "Patrick"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "marco.cadisch@bedag.ch" -t1vorname "Marco" -t2uid "thomas.murer@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "martin.voegeli@bedag.ch" -t1vorname "Martin" -t2uid "rolf.gottier@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "matthias.eberle@bedag.ch" -t1vorname "Matthias" -t2uid "beat.leuenberger@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "michel.kohler@bedag.ch" -t1vorname "Michel" -t2uid "markus.hechelmann@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "michel.rudin@bedag.ch" -t1vorname "Michel" -t2uid "thomas.zindel@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "michel.slotwinski@bedag.ch" -t1vorname "Michel" -t2uid "reto.gertschen@bedag.ch" -t2vorname "Reto"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "oliver.hofer@bedag.ch" -t1vorname "Oliver" -t2uid "rolf.kuenzli@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "peter.sinzig@bedag.ch" -t1vorname "Peter" -t2uid "francisco.alvarez@bedag.ch" -t2vorname "Francisco"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "renato.stebler@bedag.ch" -t1vorname "Renato" -t2uid "andreas.zaugg@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "rene.caspar@bedag.ch" -t1vorname "René" -t2uid "remo.broennimann@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "roman.wurzel@bedag.ch" -t1vorname "Roman" -t2uid "leonhard.greulich@bedag.ch" -t2vorname "Leonhard"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "sylvain.perret@bedag.ch" -t1vorname "Sylvain" -t2uid "stefan.clausen@bedag.ch" -t2vorname "Stefan"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "thomas.alabor@bedag.ch" -t1vorname "Thomas" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "thomas.walliser@bedag.ch" -t1vorname "Thomas" -t2uid "lukas.germann@bedag.ch" -t2vorname "Lukas"
crtpulsmeeting -startstring "2023-04-03 08:00:00" -t1uid "wolfram.mathys@bedag.ch" -t1vorname "Wolfram" -t2uid "domenic.mirwald@bedag.ch" -t2vorname "Domenic"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "andreas.meyer@bedag.ch" -t1vorname "Andreas" -t2uid "remo.broennimann@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "astrid.becker@bedag.ch" -t1vorname "Astrid" -t2uid "jenny.dales@bedag.ch" -t2vorname "Jenny"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "christian.daellenbach@bedag.ch" -t1vorname "Christian" -t2uid "reto.gertschen@bedag.ch" -t2vorname "Reto"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "christian.saner@bedag.ch" -t1vorname "Christian" -t2uid "dominic.salzmann@bedag.ch" -t2vorname "Dominic"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "christian.studer@bedag.ch" -t1vorname "Christian" -t2uid "michel.slotwinski@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "colin.haldemann@bedag.ch" -t1vorname "Colin" -t2uid "markus.lauber@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "daniela.burkhard@bedag.ch" -t1vorname "Daniela" -t2uid "patrick.wagner@bedag.ch" -t2vorname "Patrick"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "dario.bagatto@bedag.ch" -t1vorname "Dario" -t2uid "lukas.germann@bedag.ch" -t2vorname "Lukas"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "domenic.mirwald@bedag.ch" -t1vorname "Domenic" -t2uid "mario.beyeler@bedag.ch" -t2vorname "Mario"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "dominic.stoll@bedag.ch" -t1vorname "Dominic" -t2uid "dario.verrengia@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "eric.hugi@bedag.ch" -t1vorname "Eric" -t2uid "yves.jacob@bedag.ch" -t2vorname "Yves"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "eric.scherrer@bedag.ch" -t1vorname "Eric" -t2uid "michel.rudin@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "francisco.alvarez@bedag.ch" -t1vorname "Francisco" -t2uid "simon.fuhrer@bedag.ch" -t2vorname "Simon"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "hans.gehriger@bedag.ch" -t1vorname "Hans" -t2uid "karin.dignazio@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "juerg.gugger@bedag.ch" -t1vorname "Jürg" -t2uid "andreas.zaugg@bedag.ch" -t2vorname "Andreas"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "juerg.weber@bedag.ch" -t1vorname "Jürg" -t2uid "rolf.gottier@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "karin.bischoff@bedag.ch" -t1vorname "Karin" -t2uid "beat.leuenberger@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "leonhard.greulich@bedag.ch" -t1vorname "Leonhard" -t2uid "adrian.bronner@bedag.ch" -t2vorname "Adrian"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "marco.cadisch@bedag.ch" -t1vorname "Marco" -t2uid "peter.sinzig@bedag.ch" -t2vorname "Peter"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "markus.hechelmann@bedag.ch" -t1vorname "Markus" -t2uid "franz.sterchi@bedag.ch" -t2vorname "Franz"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "martin.voegeli@bedag.ch" -t1vorname "Martin" -t2uid "jan.jeitziner@bedag.ch" -t2vorname "Jan"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "matthias.eberle@bedag.ch" -t1vorname "Matthias" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "matthias.pfammatter@bedag.ch" -t1vorname "Matthias" -t2uid "denys.aeberhardt@bedag.ch" -t2vorname "Denys"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "michel.soravia@bedag.ch" -t1vorname "Michel" -t2uid "daniele.siragusano@bedag.ch" -t2vorname "Daniele"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "nicolas.haenni@bedag.ch" -t1vorname "Nicolas" -t2uid "wolfram.mathys@bedag.ch" -t2vorname "Wolfram"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "oliver.hofer@bedag.ch" -t1vorname "Oliver" -t2uid "joshua.brunner@bedag.ch" -t2vorname "Joshua"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "rene.caspar@bedag.ch" -t1vorname "René" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "roger.koenig@bedag.ch" -t1vorname "Roger" -t2uid "thomas.schreier@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "rolf.kuenzli@bedag.ch" -t1vorname "Rolf" -t2uid "michel.kohler@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "stefan.clausen@bedag.ch" -t1vorname "Stefan" -t2uid "roman.wurzel@bedag.ch" -t2vorname "Roman"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "stephan.steiner@bedag.ch" -t1vorname "Stephan" -t2uid "remo.wyss@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "sylvain.perret@bedag.ch" -t1vorname "Sylvain" -t2uid "renato.stebler@bedag.ch" -t2vorname "Renato"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "thomas.alabor@bedag.ch" -t1vorname "Thomas" -t2uid "beat.siegenthaler@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "thomas.murer@bedag.ch" -t1vorname "Thomas" -t2uid "bruno.schori@bedag.ch" -t2vorname "Bruno"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "thomas.walliser@bedag.ch" -t1vorname "Thomas" -t2uid "hector.ortiz@bedag.ch" -t2vorname "Hector"
crtpulsmeeting -startstring "2023-04-17 08:00:00" -t1uid "thomas.zindel@bedag.ch" -t1vorname "Thomas" -t2uid "michael.haueter@bedag.ch" -t2vorname "Michael"

crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "adrian.bronner@bedag.ch" -t1vorname "Adrian" -t2uid "marco.cadisch@bedag.ch" -t2vorname "Marco"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "andreas.meyer@bedag.ch" -t1vorname "Andreas" -t2uid "hector.ortiz@bedag.ch" -t2vorname "Hector"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "andreas.zaugg@bedag.ch" -t1vorname "Andreas" -t2uid "nicolas.haenni@bedag.ch" -t2vorname "Nicolas"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "beat.siegenthaler@bedag.ch" -t1vorname "Beat" -t2uid "christian.saner@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "bruno.schori@bedag.ch" -t1vorname "Bruno" -t2uid "christian.daellenbach@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "dario.verrengia@bedag.ch" -t1vorname "Dario" -t2uid "karin.dignazio@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "dominic.stoll@bedag.ch" -t1vorname "Dominic" -t2uid "remo.broennimann@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "eric.hugi@bedag.ch" -t1vorname "Eric" -t2uid "daniel.imoberdorf@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "eric.scherrer@bedag.ch" -t1vorname "Eric" -t2uid "remo.wyss@bedag.ch" -t2vorname "Remo"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "francisco.alvarez@bedag.ch" -t1vorname "Francisco" -t2uid "denys.aeberhardt@bedag.ch" -t2vorname "Denys"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "franz.sterchi@bedag.ch" -t1vorname "Franz" -t2uid "tanja.brunner@bedag.ch" -t2vorname "Tanja"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "jan.jeitziner@bedag.ch" -t1vorname "Jan" -t2uid "rolf.gottier@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "jenny.dales@bedag.ch" -t1vorname "Jenny" -t2uid "rolf.kuenzli@bedag.ch" -t2vorname "Rolf"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "juerg.weber@bedag.ch" -t1vorname "Jürg" -t2uid "sylvain.perret@bedag.ch" -t2vorname "Sylvain"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "leonhard.greulich@bedag.ch" -t1vorname "Leonhard" -t2uid "markus.lauber@bedag.ch" -t2vorname "Markus"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "lukas.germann@bedag.ch" -t1vorname "Lukas" -t2uid "domenic.mirwald@bedag.ch" -t2vorname "Domenic"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "markus.hechelmann@bedag.ch" -t1vorname "Markus" -t2uid "colin.haldemann@bedag.ch" -t2vorname "Colin"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "martin.voegeli@bedag.ch" -t1vorname "Martin" -t2uid "daniela.burkhard@bedag.ch" -t2vorname "Daniela"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "michael.haueter@bedag.ch" -t1vorname "Michael" -t2uid "hans.gehriger@bedag.ch" -t2vorname "Hans"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "michel.kohler@bedag.ch" -t1vorname "Michel" -t2uid "matthias.eberle@bedag.ch" -t2vorname "Matthias"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "michel.slotwinski@bedag.ch" -t1vorname "Michel" -t2uid "daniel.gertsch@bedag.ch" -t2vorname "Daniel"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "michel.soravia@bedag.ch" -t1vorname "Michel" -t2uid "beat.leuenberger@bedag.ch" -t2vorname "Beat"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "oliver.hofer@bedag.ch" -t1vorname "Oliver" -t2uid "stephan.steiner@bedag.ch" -t2vorname "Stephan"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "patrick.wagner@bedag.ch" -t1vorname "Patrick" -t2uid "michel.rudin@bedag.ch" -t2vorname "Michel"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "peter.sinzig@bedag.ch" -t1vorname "Peter" -t2uid "christian.studer@bedag.ch" -t2vorname "Christian"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "renato.stebler@bedag.ch" -t1vorname "Renato" -t2uid "astrid.becker@bedag.ch" -t2vorname "Astrid"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "rene.caspar@bedag.ch" -t1vorname "René" -t2uid "joshua.brunner@bedag.ch" -t2vorname "Joshua"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "reto.gertschen@bedag.ch" -t1vorname "Reto" -t2uid "matthias.pfammatter@bedag.ch" -t2vorname "Matthias"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "roger.koenig@bedag.ch" -t1vorname "Roger" -t2uid "thomas.walliser@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "roman.wurzel@bedag.ch" -t1vorname "Roman" -t2uid "thomas.zindel@bedag.ch" -t2vorname "Thomas"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "simon.fuhrer@bedag.ch" -t1vorname "Simon" -t2uid "daniele.siragusano@bedag.ch" -t2vorname "Daniele"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "stefan.clausen@bedag.ch" -t1vorname "Stefan" -t2uid "dominic.salzmann@bedag.ch" -t2vorname "Dominic"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "thomas.alabor@bedag.ch" -t1vorname "Thomas" -t2uid "juerg.gugger@bedag.ch" -t2vorname "Jürg"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "thomas.murer@bedag.ch" -t1vorname "Thomas" -t2uid "dario.bagatto@bedag.ch" -t2vorname "Dario"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "thomas.schreier@bedag.ch" -t1vorname "Thomas" -t2uid "karin.bischoff@bedag.ch" -t2vorname "Karin"
crtpulsmeeting -startstring "2023-05-01 08:00:00" -t1uid "yves.jacob@bedag.ch" -t1vorname "Yves" -t2uid "mario.beyeler@bedag.ch" -t2vorname "Mario"#>