package bolacha;

public class Retangulo extends Bolacha{
    private double x;
    private double y;
    private double h;
    
    public Retangulo(){
        x = 0.0;
        y = 0.0;
        super.setArea(0.0);
        super.p = new Ponto(0.0, 0.0);
    }
    
    public void calcula_area_ret(double _x, double _y){
        h = _x * _y;
        super.setArea(h);
    }
    
    public Retangulo(double _x, double _y){
        x = _x;
        y = _y;   
        calcula_area_ret(_x,_y);
        super.p = new Ponto(x, y);
    }
}

