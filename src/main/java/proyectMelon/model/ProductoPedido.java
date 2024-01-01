package proyectMelon.model;

import java.util.Objects;

public class ProductoPedido {
    private int idPedido;
    private Producto producto;
    private int cantidad;

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto p) {
        this.producto = p;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductoPedido that = (ProductoPedido) o;

        return this.producto.getId() == that.producto.getId();

    }

    @Override
    public int hashCode() {
        return producto != null ? producto.hashCode() : 0;
    }

    @Override
    public String toString() {
        return "ProductoPedido{" +
                "idPedido=" + idPedido +
                ", producto=" + producto +
                ", cantidad=" + cantidad +
                '}';
    }
}
