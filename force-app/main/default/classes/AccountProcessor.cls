global class AccountProcessor {
    @future
    public static void countContacts(List<Id> accids){
        List<Account> AccsList = [SELECT id, Number_of_Contacts__c, (SELECT id FROM contacts) from account where id in :accids];

        for(Account a: AccsList){
            a.Number_of_Contacts__c = a.contacts.size();
        }

        update AccsList;
    }
}
