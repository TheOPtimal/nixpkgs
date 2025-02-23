{ lib
, rustPlatform
, fetchFromGitHub
, openssl
, pkg-config
, stdenv
, Security
}:

rustPlatform.buildRustPackage rec {
  pname = "stork";
  version = "1.5.0";

  src = fetchFromGitHub {
    owner = "jameslittle230";
    repo = "stork";
    rev = "v${version}";
    sha256 = "sha256-4aNY66y4dY+/MsZZGb5GBIlpZI+bAySff9+BEQUlx9M=";
  };

  cargoSha256 = "sha256-XyFZSQylBetf9tJLaV97oHbpe0aBadEZ60NyyxK8lfo=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ]
    ++ lib.optionals stdenv.isDarwin [ Security ];

  meta = with lib; {
    description = "Impossibly fast web search, made for static sites";
    homepage = "https://github.com/jameslittle230/stork";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ chuahou ];
  };
}
