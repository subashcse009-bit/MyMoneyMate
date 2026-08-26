using Microsoft.EntityFrameworkCore;
using MyMoneyMate.Application.Import;
using MyMoneyMate.Application.Repository;
using MyMoneyMate.Application.Repository.IRepository;
using MyMoneyMate.Application.Services;
using MyMoneyMate.Infrastructure;
using MyMoneyMate.Infrastructure.Data;
using MyMoneyMate.Infrastructure.Repositories;
using OfficeOpenXml;

var builder = WebApplication.CreateBuilder(args);

ExcelPackage.License.SetNonCommercialOrganization("MyMoneyMate");

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
//Configure DbContext with SQL Server
builder.Services.AddDbContext<MyMoneyMateDBContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

builder.Services.AddScoped<ImportService>();
builder.Services.AddScoped<ValidateService>();
builder.Services.AddScoped<AccountService>();
builder.Services.AddScoped<ITransactionStageRepository, TransactionStageRepository>();
builder.Services.AddScoped<IImportBatchRepository, ImportBatchRepository>();
builder.Services.AddScoped<ITransactionRepository, TransactionRepository>();
builder.Services.AddScoped<IAccountRepository, AccountRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();

builder.Services.AddSingleton<DbConnectionFactory>();

// register importer implementations you have
builder.Services.AddTransient<IImporter, ExcelImporter>();
builder.Services.AddTransient<IImporter, CSVImporter>();

// Register CORS policy
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAngularApp",
        policy => policy.WithOrigins("http://localhost:4200") // Angular dev server
                        .AllowAnyHeader()
                        .AllowAnyMethod());
});

var app = builder.Build();

app.UseCors("AllowAngularApp");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
