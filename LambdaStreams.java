package collectionsUdemy;

import java.util.*;
import java.util.stream.Collectors;

public class list {
	public static void main(String[] args) {
		List<Integer> l = new ArrayList<>();
		for(int i=1;i<=50;i++)
			l.add(i);
		System.out.println(l);
		Long count = l.stream().count();
		System.out.println(count);
		List<Integer> l1 = l.stream().filter(i -> i%2 == 0).collect(Collectors.toList());
		Long newCount = l1.stream().count();
		System.out.println(newCount);
		System.out.println(l1);
		List<Integer> l2 = l.stream().map(i -> i%2).collect(Collectors.toList());
		System.out.println(l2);
		ArrayList<Integer> l4 = (ArrayList<Integer>) l.stream().filter(i -> i%2 != 0).collect(Collectors.toList ());
		System.out.println(l4);
	}
}
