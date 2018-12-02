import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;

public class NashornTest {
    public static void main(String[] args) {
      ScriptEngineManager scriptEngineManager = new ScriptEngineManager();
      ScriptEngine engine = scriptEngineManager.getEngineByName("nashorn");
      try {
        engine.eval("print('Hello World!');");
      } catch(ScriptException e) {
         System.out.println("Error executing script: "+ e.getMessage());
      }
    }
}
