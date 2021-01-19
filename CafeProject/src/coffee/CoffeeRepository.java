package coffee;

import java.util.ArrayList;

public class CoffeeRepository {
	private ArrayList<Coffee> listOfCoffees = new ArrayList<Coffee>();
	private static CoffeeRepository instance = new CoffeeRepository();

	public static CoffeeRepository getInstance(){
		return instance;
	}
	public ArrayList<Coffee> getAllCoffees() {
		return listOfCoffees;
	}
	
	//select * from product where id='제품아이디';
	//아이디로 리스의 제품을 검색해서 제품 객체를 기턴한다
	public Coffee getCoffeeById(String cafeid) {
		Coffee coffeeById = null;
		//리스트의 제품들을 하나씩 반복문을 실행한다.
		for (int i = 0; i < listOfCoffees.size(); i++) {
			Coffee coffee = listOfCoffees.get(i);
			if (coffee != null && coffee.getCafeid() != 0) {
				coffeeById = coffee;
				break;
			}
		}
		return coffeeById;
	}
	
	//새로 등록된 제품을 DB에 저장
	//새로 등록된 제품을 리스트에 추가
	public void addCoffee(Coffee coffee) {
		listOfCoffees.add(coffee);
	}
	
}
