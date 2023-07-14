class PaymentEndPoints {
  static const apiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T0RRNE1UY3dMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuY1huczVVdG9FcEFiMGlJWnBpci1JbHNWcDJRaFQzX2tsWm5qS25Fb3VjOGxCY0ZZbjRNQkNCUVpaUkFyS1NXQWwtRnVkemhzQ1dNeXNsSlJMMUVOR3c=';
  static const String baseURL = 'https://accept.paymob.com/api';
  static const String authEndpoint = '$baseURL/auth/tokens';
  static const String ordersEndpoint = '$baseURL/ecommerce/orders';
  static const String walletEndpoint = '$baseURL/acceptance/payments/pay';
  static const String paymentEndpoint = '$baseURL/acceptance/payment_keys';
  static const String iFrameCardEndpoint =
      'https://accept.paymob.com/api/acceptance/iframes/771090?payment_token';
}
