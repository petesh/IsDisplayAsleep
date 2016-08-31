
import com.sun.jna.*;
import com.sun.jna.ptr.IntByReference;

public class IsDisplayAsleep {

  static final int MAX_DISPLAYS = 20;
  public static boolean IsDisplayAsleep() throws Exception {
    IntByReference ib = new IntByReference();
    CoreGraphics.CGDirectDisplayID ids[] = new CoreGraphics.CGDirectDisplayID[MAX_DISPLAYS];
    if (!CoreGraphics.CGError.Success.equals(CoreGraphics.INSTANCE.CGGetActiveDisplayList(
        MAX_DISPLAYS, ids, ib))) {
      throw new Exception("Could Not Get Active Display List");
    }
    boolean is_asleep = true;
    int i = ib.getValue();
    while (--i >= 0) {
      is_asleep &= CoreGraphics.INSTANCE.CGDisplayIsAsleep(ids[i]);
    }
    return is_asleep;
  }
}
