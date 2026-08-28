import { Component, signal } from '@angular/core';
import { AccountComponent } from './components/account-component/account-component';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [AccountComponent,MatCardModule,MatFormFieldModule],
  templateUrl: './app.html',
  styleUrl: './app.scss'
})
export class App {
  protected readonly title = signal('MyMoneyMate-Angular-App');
}