public class accountUpdateRestrict {
    public static void accRestrict(List<Account> accList){
        Id profileid=Userinfo.getProfileId();  
        profile pfName=[select Name from Profile where id=:profileid];
        for(Account ac:accList){
        if(pfName.Name!='System Administrator'){
          ac.addError('You can not update');  
        }
    

}
    }
}