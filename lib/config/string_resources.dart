import 'package:ChaiChod/config/app_theme.dart';

AppState appState = AppState();

class StringRes {

  //Font string
  static const fontFamilyRoboto              = 'Roboto';

  //Login Screen
  static const signIn                        = 'SIGN IN';
  static const forgotPasswordTitle           = 'Forgot your Password?';
  static const youHaveAccount                = 'If you do not have a account yet,';
  static const pleaseRegister                = '  Please Register';
  static const googleLoginTitle              = 'Login with Google';
  static const faceBookLoginTitle            = 'Login with Facebook';
  static const appleLoginTitle               = 'Sign in with Apple';
  static const userName                      = 'Username';
  static const enterUserName                 = 'Enter your Username';

  //Register Screen
  static const register                      = 'REGISTER';

  //card common screen
  static const homeFirstRecord               =  "HomeFirstRecord";
  static const userListScreen                =  "UserListScreen";

  //Success screen
  static const successMessage                =  "Successfully registered!";
  static const reviewAdmin                   =  "Please wait for the review from  Admin";

  //Home page
  static const heading                       =  "Salam, Style, Ory";
  static const secondHeading                 =  "Promotion Product This Month";
  //Archive Page
  static const archiveHeading                =  "Track delivery";

  static const StyleOry                      =  "Salam, Style, Ory";
  static const promotionTitle                =  "Promotion Product This Month";
  static const chooseHereTitle               =  "Choose acconding to here";

  //Notification Page
  static const notificationHeading           =  "Notification";

  //Notification Page
  static const userHeading                   =  "Your Account";

  //Cart Screen
  static const shoppingCart                  =  "Shopping Carts";
  static const continueText                  =  "Continue";
  static const prices                        =  "Prices";
  static const discount                      =  "Discount";
  static const total                         =  "Total";
  static const brand                         =  "Brand";
  static const miCheIn                       =  "MICHELIN";
  static const pageWidth                     =  "pageWidth";
  static const width                         =  "Width";
  static const serialNumber                  =  "Serial number";
  static const edgeNumber                    =  "Edge number";
  static const sideWall                      =  "The sidewall";
  static const numberItem                    =  "The Number of Item";

  // tab 2
  static const shipping                      =  "Shipping";
  static const successDelivery               =  "Successful delivery";

  //Tab2 => tab1 shipping
  static const dayOrder                      =  "Day Order the";

  //tab2 => tab2 success
  static const orders                        =  "Orders";
  static const dateOrder                     =  "Date order";
  static const dateOfReceipt                 =  "Date of receipt of goods";

  //tab3
  static const all                           =  "All";
  static const shipment                      =  "Shipment";
  static const payment                       =  "Payment";

  //Tab4
  static const manageProfile                 =  "Manage profile";
  static const favorites                     =  "Favorites";
  static const orderHistory                  =  "Order history";
  static const setUp                         =  "Set up";
  static const address                       =  "Address";
  static const setLanguage                   =  "Set Language";
  static const save                          =  "Save";

  //User Profile
  static const accountTheYou                 =  "Account The You";
  static const youAreNotLogin                =  "You Are not logged in";
  static const logIn                         =  "Log In";
  static const storeName                     =  "Store Name";
  static const hTax                          =  "H number tax";
  static const currentAddress                =  "Current Address";


  //Contact Us
  static const contactUs                     =  "Contact Us";
  static const description                   =  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. \n\n  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
  static const description1                  = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";


  //Privacy
  static const privacyPolicy                 =  "Privacy Poliicy";
  static const PrivacyDescription1           =  "Chaichod built the Chaichod app as a Free app. This SERVICE is provided by Chaichod at no cost and is intended for use as is.                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                   This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                    If you choose to use our Service, then you agree to the collection and use of information in relation to this policy The Personal Information that we collect is used for providing and improving the Service we will not use or share your information with anyone except as described in this Privacy Policy.                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                    The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Chaichod unless otherwise defined in this Privacy Policy.";
  static const PrivacyDescription2           =  "For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                    The app does use third party services that may collect Information used to identify you.                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                    Link to privacy policy of third party service providers used by the app";
  static const PrivacyDescription3           =  "we want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data.  This Log Data may include information such as your device Internet Protocol (IP) address, device.";
  static const PrivacyTitle1                 =  "Information Collection and Use";
  static const PrivacyTitle2                 =  "Log Data";

  //About Us
  static const setup                         = "Set Up";
  static const deSetup                       =  "Current address";
  static const aboutUs                       =  "About Us";

  //Change Password
  static const passwordTitle                 =  "Change Password";

  //Edit Profile
  static const editProfile                   =  "Edit Profile";

  //category Profile
  static const categoryTitle                 = "Pickup truck tires, super cars";

  //Product Profile
  static const ProductTitle                  = "Product Details";
  static const brandName                     = "Brand";
  static const buttonName                    = "Tire specification";
  static const ProductTitle1                 = "More product details";
  static const tab1                          = "Details";
  static const tab2                          = "Reviews";
  static const ProductTitle3                 = "Related Products";
  static const btn1                          = "Transparent trolley";
  static const btn2                          = "Buy now";
  static const rubberSeries                  = "Rubber Series";
  static const rubberEdge                    = "Rubber edge";
  static const sidewallTxt                   = "Sidewall";
  static const btn1details                   = "Add to cart";



  //OrderSummary
  static const OrderSummaryTitle             = "Order Summary";
  static const OrderSummaryDescription       = "Order now at wipost124 30/05/20";
  static const serviceDetails                = "Delivery and installation service";
  static const serviceDetails1               = "Please select an address and delivery service.";
  static const discountDetails               = "Discount coupons";
  static const discountDetailsBtn1           = "Coupon Code";
  static const discountDetailsBtn2           = "Take";

  //Details Screen
  static const Title1                        = "Lorem properties";
  static const Description                   = "Lorem ipsum dolor sit amet , consectetur adipiscing elit , sed do eiusmod tempor incididunt ut";
  static const Description1                  = "Lorem ipsum dolor sit amet , consectetur adipiscing elit , sed do eiusmod tempor incididunt ut labore et dolore magna aliqua . Ut enim ad minim veniam , quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat . Duis aute inure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur . Excepteur sint occaecat cupidatat non proident , sunt in culpa qui officia deserunt mollit anim id est laborum . Lorem ipsum dolor sit amet , consectetur adipiscing elit . sed do eiusmod tempor incididunt ut labore et dolore magna aliqua .                            \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t                             Ut enim ad minim veniam , quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat . Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur . Excepteur sint occaecat cupidatat non proident , sunt in culpa qui";

  //payment transfer Screen
  static const paymentTitle                  =  "Pay by bank account";
  static const paymentTitle2                  =  "Order no.410031124 30/05/20";

  //GoodYear
  static const goodyear                      = "GOODYEAR";

  //Service Screen
  static const serviceTitle                  = "Delivery and installation service fhhdgbhfvbhcvbcb";
  static const serviceTitle1                 = "Buy Now Order 4 1003I124 30/05/20";
  static const serviceDes1                   = "Name and shipping address";
  static const serviceDes2                   = "Please select an address";
  static const discountServiceBtn1           = "Choose an appointment date";
  static const serviceDescription            = "Choose an appointment date";


  //Shipping Screen
  static const shippingTitle                  = "Shipping address details";
  static const shippingTitle1                 = "Order No. 81003I124 30/05/20";
  static const shippingDes1                   = "Recipient name";
  static const shippingDes2                   = "Contact phone number";
  static const shippingDescription1           = "Delivery address";
  static const shippingDescription2           = "Choose a shipping address";

  //Delivery Address Screen
  static const DeliveryAddressTitle           = "Delivery Address";
  static const DeliveryAddressDescription1    = "Choose new address";

  //Order Details Screen
  static const orderDetailsTitle             = "Order Details";
  static const status                        = "Status";
  static const seriesNumber                  = "Series Number";
  static const edgeRubber                    = "Edge Rubber";
  static const sidewall                      = "The Sidewall";
  static const count                         = "The number of";
  static const price                         = "Price";
  static const sectionAA                     = "Section AA";
  static const totalMod                      = "Include H mod";
  static const rated                         = "Rated Applications";
  static const dateReceipt                   = "Date Of Receipt";

  //Rate Screen
  static const RateTitle                     = "Rate your satisfaction with the product.";
  static const RateDes1                      = "More Details";
  static const RateDes2                      = "pin #Not";
  static const RateBtn1                      = "Small lift";
  static const RateBtn2                      = "Confirm";


  //Complete Screen
  static const CompleteTitle                  = "Completed";
  static const CompleteTitle1                 = "Thank you for Rating                                                                                                                      \t        and 555";
  static const CompleteBtn1                   = "Back to homepage";


  //BottomSheetButton Screen
  static const paymentChannel                 = "Select the payment channel";


  //PaymentSuccess screen
  static const PaymentSuccessTitle            =  "Order was successful, thank you.";
  static const PaymentSuccessDec1             =  "   Thank you for shopping with us,\nyou can track the delivery status at";
  static const PaymentSuccessDec2             =  "Track Delivery";
  static const PaymentSuccessDec3             =  "Find udarauni 10031124";

  //DebitCard Screen
  static const DebitCardTitle                  =  "Scan to pay";
  static const DebitCardTitle2                 =  "Order no.410031124 30/05/20";

 // Search Screen

 static const Searchtab1                         = "tab1";
  static const Searchtab2                        = "tab2";
  static const Searchtab3                        = "tab3";
}

