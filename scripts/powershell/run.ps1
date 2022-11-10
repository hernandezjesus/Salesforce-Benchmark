
sfdx force:data:soql:query --query "SELECT Id FROM Benchmark_Result__c" --resultformat csv | ConvertFrom-Csv | Foreach-Object -ThrottleLimit 5 -Parallel {
    sfdx force:data:record:delete --sobjecttype Benchmark_Result__c --sobjectid $_.Id
}

$tmp = New-TemporaryFile
Get-Content .\scripts\apex\script.apex | ForEach-Object {
    $_ > $tmp.FullName
    for ($i = 0; $i -lt 15; $i++) {
        sfdx force:apex:execute --apexcodefile $tmp.FullName
    }
}

sfdx force:data:soql:query --query "SELECT Benchmark_Name__c,COUNT(ID) TIMES_RUN,AVG(Duration_Milliseconds__c) DURATION_AVERAGE FROM Benchmark_Result__c GROUP BY Benchmark_Name__c" > .\scripts\soql\result.txt
