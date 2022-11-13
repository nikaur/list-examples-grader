import static org.junit.Assert.*;
import org.junit.*;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class TestListExamples {
    //generic test 
    @Test
      public void mergeTest(){
        List<String> s1 = Arrays.asList("apple", "boy"); 
        List<String> s2 = Arrays.asList("are", "zed");
        List<String> s3 = Arrays.asList("apple", "are", "boy", "zed");  
        assertEquals(s1, ListExamples.merge(s1, s2));
      }

    @Test 
      public void mergeTestLong(){
        List<String> s1 = Arrays.asList("a", "list", "long", "very"); 
        List<String> s2 = Arrays.asList("another", "list", "long"); 
        List<String> s3 = Arrays.asList("a", "another", "list", "list", "long", "long", "very"); 
        assertEquals(s3, ListExamples.merge(s1, s2));
      }

      @Test
      public void mergeTestEmpty(){
        List<String> s1 = new ArrayList<>();  
        List<String> s2 = new ArrayList<>();
        List<String> s3= new ArrayList<>(); 
        assertEquals(s3, ListExamples.merge(s1, s2));
      }

      @Test
      public void filterTest(){
          List<String> input = Arrays.asList("hi", "hello", "k", "hm"); 
          //String a = "h";
          StringChecker sc = new StringChecker(){
              public boolean checkString(String s){
                  return true; 
              } 
          };  
          assertEquals(input, ListExamples.filter(input,sc));
        }

      @Test
      public void filterTestAgain(){
        List<String> s1 = Arrays.asList("apple", "berry", "smth"); 
        List<String> s2 = new ArrayList<>(); 
        StringChecker sc = new StringChecker(){
            public boolean checkString(String s){
              return false; 
            }
        }; 
        assertNotEquals(s1, ListExamples.filter(s1, sc));
        assertEquals(s2, ListExamples.filter(s1, sc));
      }
}
