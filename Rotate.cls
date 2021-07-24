public class Rotate{
    public static void rotateRight(){
        List<integer> List1 = new List<integer>{2,5,3,6,4,8,9};
        List<integer> List2 = new List<integer>();
        integer order = 1;
        System.debug('List before rotation'  +List1);
        integer var=List1.size()- math.mod(order,List1.size());
        System.debug(var);
        if (var>0){
            List2=List1.clone();
            for (integer i=0;i<List1.size();i++){
                integer j=math.mod((i+var),List1.size());
                List1[i]=List2[j];
                    }
        }
        System.debug('List After Right Rotation ' +List1);
                
            }
    
    public static void rotateLeft(){
        List<integer> List1 = new List<integer>{2,5,3,6,4,8,9};
        List<integer> List2 = new List<integer>();
        integer order = 1;
        System.debug('List before rotation'  +List1);
        integer var=math.mod(order,List1.size());
        System.debug(var);
        if (var>0){
            List2=List1.clone();
            for (integer i=List1.size()-1;i>=0;i--){
                integer j=math.mod((i+var),List1.size());
                List1[i]=List2[j];
                    }
        }
        System.debug('List After Left Rotation ' +List1);
                
            }
            
            

}