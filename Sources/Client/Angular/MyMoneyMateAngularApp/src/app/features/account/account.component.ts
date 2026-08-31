import { Component, computed, signal } from '@angular/core';
import { CommonModule, CurrencyPipe } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatChip } from '@angular/material/chips';
import { MatMenuModule } from '@angular/material/menu';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatDividerModule } from '@angular/material/divider';
  import { MatToolbarModule } from '@angular/material/toolbar';
  import {MatExpansionModule} from '@angular/material/expansion';

export interface Account {
  id: number;
  name: string;
  type: string;
  currentBalance: number;
  status: 'Active' | 'Inactive';
  lastTransaction: string;
  icon: string;
}

@Component({
  selector: 'app-account',
   imports: [
    CommonModule,
    FormsModule,
    CurrencyPipe,
    MatCardModule,
    MatTableModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatIconModule,
    MatChip,
    MatMenuModule,
    MatTooltipModule,
    MatDividerModule,
    MatToolbarModule,
    MatExpansionModule
  ],
  templateUrl: './account.component.html',
  styleUrl: './account.component.scss',
})

export class AccountComponent {

  displayedColumns: string[] = [
    'name',
    'type',
    'currentBalance',
    'status',
    'lastTransaction',
    'actions'
  ];

  searchText = signal('');
  selectedType = signal('All');
  selectedStatus = signal('All');

  accountTypes = [
    'All',
    'Bank Account',
    'Cash',
    'Credit Card',
    'Loan',
    'Mutual Fund',
    'Life Insurance',
    'PF / PPF',
    'Gold'
  ];

  statuses = ['All', 'Active', 'Inactive'];

  accounts = signal<Account[]>([
    {
      id: 1,
      name: 'HDFC Bank - Savings',
      type: 'Bank Account',
      currentBalance: 1245780,
      status: 'Active',
      lastTransaction: 'Today',
      icon: 'account_balance'
    },
    {
      id: 2,
      name: 'ICICI Bank - Salary',
      type: 'Bank Account',
      currentBalance: 135420,
      status: 'Active',
      lastTransaction: 'Yesterday',
      icon: 'account_balance'
    },
    {
      id: 3,
      name: 'Cash Wallet',
      type: 'Cash',
      currentBalance: 25000,
      status: 'Active',
      lastTransaction: 'Today',
      icon: 'account_balance_wallet'
    },
    {
      id: 4,
      name: 'SBI Credit Card',
      type: 'Credit Card',
      currentBalance: -71834,
      status: 'Active',
      lastTransaction: '2 days ago',
      icon: 'credit_card'
    },
    {
      id: 5,
      name: 'Home Loan - SBI',
      type: 'Loan',
      currentBalance: -12456780,
      status: 'Active',
      lastTransaction: 'Today',
      icon: 'home'
    },
    {
      id: 6,
      name: 'Axis BlueChip Fund',
      type: 'Mutual Fund',
      currentBalance: 475430,
      status: 'Active',
      lastTransaction: '2 days ago',
      icon: 'trending_up'
    },
    {
      id: 7,
      name: 'HDFC Life Insurance',
      type: 'Life Insurance',
      currentBalance: 283600,
      status: 'Active',
      lastTransaction: '3 days ago',
      icon: 'security'
    },
    {
      id: 8,
      name: 'Provident Fund',
      type: 'PF / PPF',
      currentBalance: 525400,
      status: 'Active',
      lastTransaction: '3 days ago',
      icon: 'savings'
    }
  ]);

  filteredAccounts = computed(() => {

    const search = this.searchText().toLowerCase();
    const type = this.selectedType();
    const status = this.selectedStatus();

    return this.accounts().filter(account => {

      const matchesSearch =
        account.name.toLowerCase().includes(search) ||
        account.type.toLowerCase().includes(search);

      const matchesType =
        type === 'All' || account.type === type;

      const matchesStatus =
        status === 'All' || account.status === status;

      return matchesSearch && matchesType && matchesStatus;
    });

  });

  totalAssets = computed(() =>
    this.accounts()
      .filter(x => x.currentBalance > 0)
      .reduce((sum, x) => sum + x.currentBalance, 0)
  );

  totalLiabilities = computed(() =>
    Math.abs(
      this.accounts()
        .filter(x => x.currentBalance < 0)
        .reduce((sum, x) => sum + x.currentBalance, 0)
    )
  );

  netWorth = computed(() =>
    this.totalAssets() - this.totalLiabilities()
  );

  totalAccounts = computed(() =>
    this.accounts().length
  );

  addAccount(): void {
    console.log('Add Account clicked');
  }

  viewAccount(account: Account): void {
    console.log('View Account', account);
  }

  editAccount(account: Account): void {
    console.log('Edit Account', account);
  }

  deleteAccount(account: Account): void {

    const confirmed = confirm(
      `Are you sure you want to delete ${account.name}?`
    );

    if (confirmed) {
      this.accounts.update(accounts =>
        accounts.filter(x => x.id !== account.id)
      );
    }
  }

  clearFilters(): void {
    this.searchText.set('');
    this.selectedType.set('All');
    this.selectedStatus.set('All');
  }
}

// export class AccountComponent implements OnInit
// {
//   accounts: AccountModel[] = [];
//   constructor(private accountService: AccountService) {}

//   ngOnInit(): void {
//     this.accountService.getAccounts().subscribe({
//       next: (data) => {
//         this.accounts = data.accounts;
//       },
//       error: (err) => {
//         console.error('Error fetching accounts', err);
//       }
//     });
//   }
// }
