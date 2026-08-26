import { Component, OnInit } from '@angular/core';
import { AccountService } from '../services/account-service';

@Component({
  selector: 'app-account',
  imports: [],
  templateUrl: './account.html',
  styleUrl: './account.scss',
})
export class Account implements OnInit {
  constructor(private accountService: AccountService) {}

  ngOnInit(): void {
    this.accountService.getAccounts().subscribe((data) => {
      console.log(data);
    });
  }
}
