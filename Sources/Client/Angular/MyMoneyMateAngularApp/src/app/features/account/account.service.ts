import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AccountModel } from './account.model';

@Injectable({
  providedIn: 'root'
})
export class AccountService {
   private apiUrl = 'http://localhost:7021/api/accounts/'; // Replace with your API endpoint
  constructor(private http: HttpClient) {}

  getAccounts(): Observable<{ accounts: any[] }> {
    return this.http.get<{ accounts: AccountModel[]}>(this.apiUrl + 'GetList');
  }
}
