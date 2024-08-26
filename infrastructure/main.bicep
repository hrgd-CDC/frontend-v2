// App Service Plan 생성
resource appServicePlan 'Microsoft.Web/serverfarms@2021-01-15' = {
  name: 'myAppServicePlan'  // [필수] App Service Plan의 이름입니다. 고유한 이름으로 변경하세요.
  location: 'KoreaCentral'  // [필수] Azure 리소스의 지역입니다. 적절한 지역으로 변경하세요. 예: 'KoreaCentral', 'EastUS' 등.
  sku: {
    name: 'F1'  // [옵션] 요금제입니다. 필요에 따라 'B1', 'P1v2' 등의 다른 요금제를 선택할 수 있습니다. 'F1'은 Free Tier입니다.
    tier: 'Free'  // [옵션] 요금제의 계층입니다. 요금제에 맞게 'Free', 'Basic', 'Standard' 등으로 변경하세요.
  }
  kind: 'app'
}

// App Service 생성
resource appService 'Microsoft.Web/sites@2021-01-01' = {
  name: 'my-react-app'  // [필수] App Service의 이름입니다. 고유한 이름으로 변경하세요. 예: 'my-unique-react-app'.
  location: 'KoreaCentral'  // [필수] Azure 리소스의 지역입니다. App Service Plan과 동일한 지역으로 설정하세요.
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id  // [자동 참조] App Service Plan의 ID입니다. 참조값이므로 수정할 필요 없습니다.
    httpsOnly: true  // [옵션] HTTPS만 허용할지 여부입니다. 보안 설정에 맞게 변경할 수 있습니다.
  }
}

// App Service에 대한 배포 슬롯 (선택사항)
resource deploymentSlot 'Microsoft.Web/sites/slots@2021-01-01' = {
  name: 'staging'  // [필수] 배포 슬롯의 이름입니다. 예: 'staging', 'production' 등으로 변경하세요.
  parent: appService  // [자동 참조] 상위 App Service의 참조입니다. 수정할 필요 없습니다.
  properties: {
    serverFarmId: appServicePlan.id  // [자동 참조] App Service Plan의 ID입니다. 참조값이므로 수정할 필요 없습니다.
  }
}
