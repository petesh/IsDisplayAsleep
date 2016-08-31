
public class jna_monitors_run {

    public static void main(String[] args) {
        try {
            boolean isAsleep = IsDisplayAsleep.IsDisplayAsleep();
            System.out.println(isAsleep ? "Asleep" : "Awake");
            System.exit(isAsleep ? 1 : 0);
        } catch (Exception ex) {
            ex.printStackTrace();
            System.exit(2);
        }
    }
}
