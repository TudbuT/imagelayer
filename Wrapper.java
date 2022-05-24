

public class Wrapper {

    public static class EWindow extends java.awt.Window {
        ISBPLCallable draw;
        ISBPL context;
        public EWindow(ISBPL contextIn, ISBPLCallable drawIn) {
            super((java.awt.Window)null);
            context = contextIn;
            draw = drawIn;
        }

        public void paint(java.awt.Graphics g) {
            ISBPLStack<ISBPLObject> s = new ISBPLStack<>();
            s.push(context.toISBPL(g));
            draw.call(s);
        }
    }
}
