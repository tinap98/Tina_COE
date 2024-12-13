def salary_compute(basic):
    if basic < 10000:
        hra = basic * 0.67
        da = basic * 0.73
    elif 10000 <= basic < 20000:
        hra = basic * 0.69
        da = basic * 0.76
    else:
        hra = basic * 0.73
        da = basic * 0.89
    
    gs = hra + da + basic
    return gs


basic_salary = float(input("Enter your basic salary: "))
gs = salary_compute(basic_salary)
print(f"Gross Salary (GS): {gs:.2f}")
