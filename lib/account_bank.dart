import 'package:flutter/cupertino.dart';

import 'account.dart';

class AccountBank{

  List<Account> accounts = [
    Account(
        "TestUser1",
        "test1",
        "TestUser1",
    )
  ];

  void addAccount(Account account){

    accounts.add(account);
  }
  Account getAccount(int accountNumber){
    return accounts[accountNumber];
  }
}

