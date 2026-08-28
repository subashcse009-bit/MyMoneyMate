import { Component, OnInit, ChangeDetectionStrategy } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AccountService } from '../../services/account';
import { Account } from '../../models/account';

@Component({
  selector: 'app-account-component',
  standalone: true,
  imports: [
    CommonModule
  ],
  templateUrl: './account-component.html',
  changeDetection: ChangeDetectionStrategy.Eager,
  styleUrl: './account-component.scss'
})

export class AccountComponent implements OnInit {
  accounts: Account[] = [];

  constructor(private accountService: AccountService) {}

  ngOnInit(): void {
    this.accountService.getAccounts().subscribe({
      next: (data) => {
        this.accounts = data.accounts;
      },
      error: (err) => {
        console.error('Error fetching accounts', err);
      }
    });
  }
}
