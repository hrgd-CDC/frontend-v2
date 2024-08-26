param location string = 'eastus'  // Azure 리전 설정
param appServicePlanName string = 'myAppServicePlan'  // App Service Plan 이름
param webAppName string = 'myWebApp${uniqueString(resourceGroup().id)}'  // Web App 이름

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'F1'  // 무료 플랜
    tier: 'Free'
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webAppUrl string = webApp.properties.defaultHostName
