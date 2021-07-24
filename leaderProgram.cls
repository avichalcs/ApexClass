public class leaderProgram {
    public static void selectLeader(){
        
        List<Integer> stList = new List<Integer>{149, 1, 3, 248, 2, 8, 70, 5};
        
        for (Integer i = 0; i<stList.size(); i++)  
        { 
            Integer j; 
            for (j = i + 1; j < stList.size(); j++)  
            { 
                if (stList[i] < stList[j]) 
                    break; 
            } 
            if (j == stList.size())                       // if the loop didn't break
                 System.debug(stList[i] + ' ');
        } 
            
            }

}