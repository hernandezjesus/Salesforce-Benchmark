ls .\force-app\main\default\objects\ | ForEach-Object {
    $objectName = $_.Name
    $fields = ".\force-app\main\default\objects\$objectName\fields"
    if(Test-Path $fields){
        ls $fields | ForEach-Object {
            $fieldName = $_.Name
            "$objectName.$fieldName"
        }
    }
}



# <fieldPermissions>
# <editable>true</editable>
# <field>After_Save_Field_Update__c.Text_1__c</field>
# <readable>true</readable>
# </fieldPermissions>


# <objectPermissions>
# <allowCreate>true</allowCreate>
# <allowDelete>true</allowDelete>
# <allowEdit>true</allowEdit>
# <allowRead>true</allowRead>
# <modifyAllRecords>true</modifyAllRecords>
# <object>Workflow_Field_Update__c</object>
# <viewAllRecords>true</viewAllRecords>
# </objectPermissions>