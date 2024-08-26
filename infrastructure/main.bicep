resource staticWebApp 'Microsoft.Web/staticSites@2021-01-01' = {
  name: 'my-static-web-app'  // [필수] Static Web App의 이름입니다. 전역적으로 고유해야 하므로 원하는 이름으로 변경해야 합니다.
  location: 'KoreaCentral'  // [필수] Azure 리소스의 배포 위치입니다. 프로젝트에 적합한 Azure 지역으로 변경하세요. 예: 'KoreaCentral', 'EastUS', 등.
  sku: {
    name: 'Free'  // [옵션] 요금제입니다. 필요에 따라 'Standard'와 같은 다른 요금제를 선택할 수 있습니다.
    tier: 'Free'  // [옵션] 요금제의 계층입니다. 'Free' 또는 'Standard'로 설정할 수 있습니다.
  }
  properties: {
    repositoryUrl: 'https://github.com/yourusername/your-repo'  // [필수] GitHub 리포지토리 URL입니다. 사용자 계정명과 리포지토리 이름으로 변경해야 합니다.
    branch: 'main'  // [옵션] 배포할 브랜치입니다. 기본적으로 'main'이지만, 다른 브랜치에서 배포하려면 해당 브랜치명으로 변경하세요.
    buildProperties: {
      appLocation: 'app'  // [필수] 애플리케이션 코드의 위치입니다. 프로젝트 구조에 맞게 변경해야 합니다. 일반적으로 React 애플리케이션의 경우 "/" 또는 "src"로 설정합니다.
      apiLocation: 'api'  // [옵션] API 코드의 위치입니다. API가 없다면 빈 문자열로 설정하거나, API 코드의 위치에 맞게 경로를 변경하세요.
      appArtifactLocation: 'build'  // [필수] 빌드 결과물이 생성되는 위치입니다. 보통 React 프로젝트에서는 'build'가 기본이지만, 프로젝트 설정에 맞게 변경할 수 있습니다.
    }
  }
}
