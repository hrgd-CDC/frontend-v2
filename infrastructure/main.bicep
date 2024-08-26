// App Service Plan 생성
resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'myAppServicePlan'
  location: 'CentralUS'  // Azure 리소스 지역
  sku: {
    name: 'F1'  // 요금제 (Free Tier)
    tier: 'Free'
  }
  kind: 'app'
}

// App Service 생성
resource appService 'Microsoft.Web/sites@2021-01-01' = {
  name: 'my-react-app'  // App Service 이름
  location: 'CentralUS'
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id  // App Service Plan ID 참조
    httpsOnly: true  // HTTPS만 허용
  }
}

// App Service에 대한 배포 슬롯 (선택사항)
resource deploymentSlot 'Microsoft.Web/sites/slots@2021-01-01' = {
  name: 'staging'
  parent: appService
  properties: {
    serverFarmId: appServicePlan.id
  }
}
