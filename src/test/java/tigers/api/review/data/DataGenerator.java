package tigers.api.review.data;

import com.github.javafaker.Faker;

public class DataGenerator {

	public static String getEmail() {
		Faker faker = new Faker();
		return faker.name().firstName() + faker.name().lastName() + "@gmail.com";
	}
	public static String getFirstName() {
		Faker faker = new Faker();
		return faker.name().firstName();
	}

	public static String getLastName() {
		Faker faker = new Faker();
		return faker.name().lastName();
	}

	public static String getAddressType() {
		Faker faker = new Faker();
		return faker.name().toString();
	}

	public static String getStreetAddress() {
		Faker faker = new Faker();
		return faker.name().toString();
	}

	public static String getCity() {
		Faker faker = new Faker();
		return faker.name().toString();
	}

	public static String getState() {
		Faker faker = new Faker();
		return faker.name().toString();
	}

	public static String getPostalCode() {
		Faker faker = new Faker();
		return faker.name().toString();
	}

	public static String getCountryCode() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getPhoneNumber() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getPhoneExtension() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getPhoneTime() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getPhoneType() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getMake() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getModel() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getYear() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	public static String getLicensePlate() {
		Faker faker = new Faker();
		return faker.name().toString();
	}
	

}