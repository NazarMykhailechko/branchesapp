import java.math.BigDecimal;

public class Item {

    String name;
    int count;
    BigDecimal price;

    public Item() {
    }

    public Item(String fruit, int count, BigDecimal price) {
        this.name = fruit;
        this.count = count;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setFruit(String fruit) {
        this.name = fruit;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Item{" +
                "name='" + name + '\'' +
                ", count=" + count +
                ", price=" + price +
                '}';
    }
}
