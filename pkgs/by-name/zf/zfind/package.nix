{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "zfind";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "laktak";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-KAkMoCanflMNiAQLyA7yHdcxjlgigpL/naHrvFPbDd0=";
  };

  vendorHash = "sha256-mmoJrqWRmJTAR2wkAB52mpYEEj3XD+jHvlVrw51vqys=";

  ldflags = [ "-X" "main.appVersion=${version}" ];

  meta = with lib; {
    description = "zfind allows you to search for files, including inside tar, zip, 7z and rar archives. It makes finding files easy with a filter syntax that is similar to an SQL-WHERE clause.";
    homepage = "https://github.com/laktak/zfind";
    changelog = "https://github.com/laktak/zfind/releases/tag/v${version}";
    license = licenses.mit;
    mainProgram = "zfind";
    maintainers = with maintainers; [ eeedean ];
  };
}
