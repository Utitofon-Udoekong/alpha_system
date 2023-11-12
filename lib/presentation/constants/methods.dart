/// Uses regex to validate emails
bool isValidEmail(String email) {
  return RegExp(
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
      .hasMatch(email);
}

/// Uses regex to validate passwords. Passwords must contain a lowercase 
/// letter, a unique symbol, a number and must be upto 8 characters
/// in length
bool isValidPassword(String password) {
  return RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$')
      .hasMatch(password);
}
