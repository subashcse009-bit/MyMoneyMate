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
builder.Services.AddScoped<ITransactionStageRepository, TransactionStageRepository>();
builder.Services.AddScoped<IImportBatchRepository, ImportBatchRepository>();

builder.Services.AddSingleton<DbConnectionFactory>();

// register importer implementations you have
builder.Services.AddTransient<IImporter, ExcelImporter>();
builder.Services.AddTransient<IImporter, CSVImporter>();

var app = builder.Build();

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
