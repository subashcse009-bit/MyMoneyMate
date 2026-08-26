import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  imports: [RouterOutlet],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {
  constructor(private http: HttpClient) {}
   private apiUrl = 'https://localhost:7021/api/accounts/'; // Replace with your API endpoint
  protected readonly title = signal('MyMoneyMate-Angular-App');

  ngOnInit(): void {
    this.http.get(this.apiUrl + "GetList").subscribe((data) => {
      console.log(data);
    });
  }
}
