import { Component, signal } from '@angular/core';
import { RouterOutlet } from '@angular/router';
import { LayoutComponent } from "./layout/layout/layout.component";
import { AccountComponent } from "./features/account/account.component";

@Component({
  selector: 'app-root',
  imports: [LayoutComponent, AccountComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  protected readonly title = signal('MyMoneyMateAngularApp');
}
