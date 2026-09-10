# 강원랜드 프로젝트 맛집 지도 — 설치 안내 (무료, 10분)

## 1. DB 만들기 (Supabase, 무료)
1. https://supabase.com 가입 → **New project** (리전 Northeast Asia 선택, DB 비밀번호 아무거나)
2. 왼쪽 메뉴 **SQL Editor** → `supabase.sql` 내용 붙여넣고 **Run**
3. **Project Settings → API** 에서 두 값 복사
   - Project URL: `https://xxxx.supabase.co`
   - anon public key: `eyJ...`
4. `index.html` 상단 설정에 붙여넣기
   ```js
   const SUPABASE_URL  = "https://xxxx.supabase.co";
   const SUPABASE_ANON = "eyJ...";
   ```

## 2. 웹에 올리기 (택1, 모두 무료)
- **Netlify Drop** (가장 쉬움): https://app.netlify.com/drop 에 `index.html` 이 든 폴더를 드래그 → 주소 발급
- **GitHub Pages**: 저장소 만들고 `index.html` 업로드 → Settings → Pages → Branch main → 저장
- **Cloudflare Pages / Vercel**: 폴더 업로드

발급된 주소를 단톡방에 공유하면 끝. 로그인 없이 누구나 등록·수정·추천 가능.

## 3. 기능 (v3)
- 하단 탭: 지도 / 랭킹(포디움 TOP3 + 별점·평가수·신규) / 뽑기(오늘 뭐 먹지 룰렛) / MY(내 이름·즐겨찾기·내 평가)
- 즐겨찾기 ♥ (기기에 저장), 이름 자동 기억, 60초마다 자동 동기화
- 영업중·곧 마감·오픈 전·오늘 휴무 배지 (영업시간 텍스트에서 자동 계산), 영업중 필터
- 태그(#회식 #혼밥 #주차 …) 등록·필터, 초성 검색(ㅎㅂㅅ), 새 버전 자동 알림
- 홈 화면 추가 시 앱 아이콘·이름 적용(manifest)

- 빌드 없이 한 파일: React·Babel을 CDN으로 불러오므로 GitHub Pages에 index.html 하나만 올리면 됨
- 카카오맵 앱 방식: 전체 화면 지도 + 아래서 끌어올리는 목록 시트(3단계), PC에서는 좌측 패널
- 빠른 필터: ★4/4.5 이상, 평가 있는 곳, 도보 15분권, 종류별 / 정렬: 가까운·별점·평가수·최신
- 핀에 평균 별점 배지 표시

- 인재개발센터 기준 거리·도보/차 소요시간 자동 계산, 가까운 순/추천순/별점순 정렬
- 종류 필터(고기·밥·면·카페·술·기타), 검색, 마커 클러스터
- 등록: 주소 검색으로 핀 자동 찍기 → 지도 클릭/드래그로 미세 조정
- **사용자 별점·한줄평**: 상세 화면에서 누구나 1~5점 + 한줄평 등록, 평균·분포 자동 집계
- TOP 탭(별점 높은 순), 평가 많은 순 정렬
- 팝업에서 전화 걸기, 카카오맵 길찾기
- Supabase 값이 비어 있으면 **데모 모드**로 동작(새로고침 시 초기화)

## 4. 운영 팁
- 장난 삭제가 걱정되면 `supabase.sql` 의 `places delete` / `reviews delete` 정책을 지우면 삭제만 막힘
- 사진은 URL 방식. 직접 업로드가 필요하면 Supabase Storage 버킷 하나 만들어 연결 가능
- 무료 한도: DB 500MB, 월 요청 무제한(대역폭 5GB) — 소규모 팀 사용엔 충분
