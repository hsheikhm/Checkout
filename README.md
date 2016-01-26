# Checkout [![Build Status](https://travis-ci.org/hsheikhm/Checkout.svg?branch=master)](https://travis-ci.org/hsheikhm/Checkout) [![Coverage Status](https://coveralls.io/repos/github/hsheikhm/Checkout/badge.svg?branch=master)](https://coveralls.io/github/hsheikhm/Checkout?branch=master)

* [Task](#task)
* [My Approach](#my-approach)
* [Directory Structure](#directory-structure)
* [Feature Test Sample](#feature-test-sample)
* [Download Instructions](#download-instructions)

## Task

Build a Checkout system in Ruby.

## My Approach

Initially I played around in irb to see what kind of objects and methods would need to be created. From that I put together a **Domain Model** to organise the objects. Then I decided on the number of classes that would be needed, in this case four (listed below). Once I had a clear picture, I next began writing my [tests](https://github.com/hsheikhm/Checkout/tree/master/spec) and making them pass one by one.

Throughout my code I kept strict to the **SOLID** principles and made use of **Single Responsibility Principle (SRP)** and **Dependency Injection (DI)**. I structured my code into 4 separate classes with each having its own responsibility. I also aimed to keep each method to having only one responsibility too. As for DI, you will see that I had incorporated this into my **Checkout** and **Order** classes within the ***initialize*** method. As a result I was able to use the **London Style** (as opposed to Chicago Style) when it came to my **RSpec** testing since I could use ***doubles*** to represent my other class objects. This allowed all my unit tests to become isolated.

* [Checkout](https://github.com/hsheikhm/Checkout/blob/master/lib/checkout.rb) (Responsible for creating an order instance and a set of promotional rules. Responsible for scanning items and retrieving the total price after discounts).
* [Products](https://github.com/hsheikhm/Checkout/blob/master/lib/products.rb) (Responsible for listing all products available. Any new product can easily be added into this class).
* [Order](https://github.com/hsheikhm/Checkout/blob/master/lib/order.rb) (Responsible for creating a basket, adding items to the basket, calculating the total price and applying any eligible discounts).
* [Promotional rules](https://github.com/hsheikhm/Checkout/blob/master/lib/promotional_rules.rb) (Responsible for listing all the promotional rules. A new rule can easily be added into this class).

## Directory Structure

```
├── lib/
│   ├── checkout.rb
│   ├── order.rb
│   ├── products.rb
│   └── promotional_rules.rb
│   
├── spec/
│   ├── checkout_spec.rb
│   ├── order_spec.rb
│   ├── products_spec.rb
│   ├── promotional_rules_spec.rb
│   └── spec_helper.rb
│
```

## Feature Test Sample

***New Checkout object:***
```
2.2.3 :002 > co = Checkout.new
```

***Checkout can scan items which are added to the basket:***
```
2.2.3 :003 > co.scan(001)
 => 1
2.2.3 :004 > co.scan(002)
 => 1
2.2.3 :005 > co.scan(003)
 => 1
```

***Checkout can calculate the total price:***
```
2.2.3 :006 > co.total
 => "£66.78"
```

# Download Instructions

```
$ git clone https://github.com/hsheikhm/Checkout.git
$ cd Checkout
$ irb
$ require './lib/checkout.rb'
```

Author: [Hamza Sheikh](https://github.com/hsheikhm)
