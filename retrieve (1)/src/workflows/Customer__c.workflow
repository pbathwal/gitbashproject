<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>Enable One to One Relation</fullName>
        <actions>
            <name>Update_Original_Account</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <formula>Account__c != null  || Account__c != &apos;&apos;</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
