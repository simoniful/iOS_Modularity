# Modularity
iOS Tuist 기반의 모듈화 실습

## Description
+ Jake Kim Blog 기본 실습
+ Raywenderich 실습 - 네트워크 코드 모듈, 외부 의존성 주입, Test Target 구성
+ 민소네 Blog 심화 실습 - 아키텍쳐 고려

## Getting Start
> Tuist, XcodeGen

## Issue
### 1. 버젼 상향에 따른 구성 방식 변경
+ ver. 1.0 ~ 3.0의 구성 코드의 변화
  + 옵션 및 내부 구성에 있어서 구조체의 변화 및 최적화
  + 실습 대상이 되는 교재에 있어서도 코드 변화 양상 추적
  + 공식 Doc 관련 숙지가 반드시 필요

### 2. 설계의 중요성
+ 모듈 분리에 있어서 레이어 분리
  + 데이터, 도메인, 프레젠트 등 어느 부분을 주안점으로 나눌 것인가 → [민소네 Git](https://github.com/minsOne/iOSApplicationTemplate)
+ 의존성 주입도 고려, 전체 state 관리
  + ReactorKit / Swinject 등
  + 서드 파티를 어떻게 효과적으로 활용할 건지 구분

## KeyNote
[<img src = "" width = 400>]()

## References
+ [민소네 블로그](https://minsone.github.io/mac/ios/ios-project-generate-with-tuist-1)
+ [JakeKim 블로그](https://ios-development.tistory.com/1004)
+ [Tuist Doc](https://docs.tuist.io/)
