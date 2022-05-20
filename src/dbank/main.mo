import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor DBank{
  stable  var currentValue: Float = 200;
  currentValue:=200;
  Debug.print(debug_show(currentValue));
  // let id = 546446 ;
  // Debug.print(debug_show(id));

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  public func topUp(amount: Float){
    currentValue+=amount;
    Debug.print(debug_show(currentValue));
  };
  // topUp();

  // Allow user to withdrawl money from the currentbalance
  // Decrease the currentValue by the amount ;

  public func withdrawl(deduct: Float){
    let tempValue: Float = currentValue-deduct ;
    if(tempValue>=0){
      currentValue-=deduct;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount to large, currentValue less than zero.");
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };
  public func compound(){
    let cuurentTime = Time.now();
    let timeElapsedNS = cuurentTime-startTime;
    let timeElapsedS = timeElapsedNS / 100000000 ;
    // currentValue := currentValue * (1.01 ** timeElapsedS); 
    currentValue := currentValue * (1.001 ** Float.fromInt(timeElapsedS));
    startTime := cuurentTime ;
  }
}