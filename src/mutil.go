package m;
import (
   "fmt"
   "os"
)
func Er(msg string, err error) bool{
   if err != nil { 
      fmt.Print( fmt.Errorf("ERROR: %s: %v", msg, err));
      return true;
   }
   return false;
}
func Ex(msg string, err error){
   if err != nil { 
      fmt.Print( fmt.Errorf("ERROR: %s: %v", msg, err));
      os.Exit(3)
   }
}
func Ep(msg string, err error){
   if err != nil { 
      fmt.Print( fmt.Errorf("ERROR: %s: %v", msg, err));
      panic(err);
   }
}
