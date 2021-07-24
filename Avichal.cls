public class Avichal {
    public static void avi(){
        List<Account> acc=[SELECT Id, Name, Rating FROM Account];
    
        for(Account a:acc){
           a.Rating='Cold';
    }
        System.debug(acc);

}
}