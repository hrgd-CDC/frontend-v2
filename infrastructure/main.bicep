resource staticWebApp 'Microsoft.Web/staticSites@2021-01-01' = {
  name: 'my-static-web-app'
  location: 'CentralUS'
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/yourusername/your-repo'
    branch: 'main'
    buildProperties: {
      appLocation: 'app'   # 애플리케이션 코드 경로
      apiLocation: 'api'   # API 경로 (필요 없으면 빈 문자열로)
      appArtifactLocation: 'build'  # 빌드 결과물 위치
    }
  }
}
