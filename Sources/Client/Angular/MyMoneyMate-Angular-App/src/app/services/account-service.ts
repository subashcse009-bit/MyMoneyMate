import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AccountService 
{
  private apiUrl = 'https://localhost:7021/api/accounts/'; // Replace with your API endpoint

  constructor(private http: HttpClient) {}

  // Example: Get all accounts
  getAccounts(): Observable<any> {
    return this.http.get(this.apiUrl + "GetList");
  }
}
