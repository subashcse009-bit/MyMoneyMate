import { R } from '@angular/cdk/keycodes';
import { HttpClient } from '@angular/common/http';
import { Component, inject, OnInit } from '@angular/core';
import { MatCard, MatCardContent, MatCardHeader, MatCardTitle } from '@angular/material/card';
import { MatGridList, MatGridTile } from '@angular/material/grid-list';
import { AccountModel } from './account.model';
import {AccountService} from './account.service'

@Component({
  selector: 'app-account',
  imports: [
    MatCard,
    MatGridList,
    MatGridTile,
    MatCardContent,
    MatCardHeader,
    MatCardTitle
  ],
  templateUrl: './account.component.html',
  styleUrl: './account.component.scss',
})
export class AccountComponent implements OnInit
{
  accounts: AccountModel[] = [];
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
