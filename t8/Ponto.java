package bolacha;

public class Ponto{
    public static double x = 0;
    public static double y = 0;
    
    public Ponto(){
    }
    
    public Ponto(double dx, double dy){
        x += dx;
        y += dy;
    }
}
