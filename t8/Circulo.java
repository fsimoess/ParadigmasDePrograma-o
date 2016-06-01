package bolacha;

public class Circulo extends Bolacha{
    private double r;
    private double h;
    
    public Circulo(){
        r = 0.0;
        super.setArea(0.0);
    }
    
    public void calcula_area_circulo(double _r){
        h = Math.PI * _r * _r;
        super.setArea(h);
    }
    
    public Circulo(double _r){
        r = _r;
        calcula_area_circulo(r);
        super.p = new Ponto(r*2, r*2);
    }
}

