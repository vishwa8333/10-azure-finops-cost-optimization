param amount int = 250
param contactEmail string

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'monthly-dev-budget'
  properties: {
    category: 'Cost'
    amount: amount
    timeGrain: 'Monthly'
    timePeriod: {
      startDate: '2026-01-01T00:00:00Z'
      endDate: '2030-12-31T00:00:00Z'
    }
    notifications: {
      actualGreaterThan80: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          contactEmail
        ]
      }
    }
  }
}

