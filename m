Return-Path: <linux-watchdog+bounces-4137-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4920B3E733
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 16:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4677D1892B09
	for <lists+linux-watchdog@lfdr.de>; Mon,  1 Sep 2025 14:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA9D341673;
	Mon,  1 Sep 2025 14:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="lEZ+kvdO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A346340DB9
	for <linux-watchdog@vger.kernel.org>; Mon,  1 Sep 2025 14:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737001; cv=none; b=sOBjyIHk6S4s8lmBe6eTtj/5fClpm9O4j2puevj/3ZONiI96d9LbjJNRDUbrttxV0Xwq43t1qcLH9tHywQli9HYKAsk9FvnUj7Y+fxauP1O32fW24Et2+QdrN5n2l1h/ibCkyCYPrus4hCqcTMbL13BPfB3y9NgRSEJyE6VS3j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737001; c=relaxed/simple;
	bh=8k/cTAP1uGo7YkU154SU3zLypsg/dO9vH8JEnPRukQw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=UjFlIn9+HLqChV828JXW+FCqjmZB98TgDPxlCyaUYJ7LOuEk3uXdmr6bP96OX8XeZ/fEsETiwcRK5sJy94HL0jFRTiWfv8T2Dn8r0wYksHdZg1AkjhYK1Gi8w4jHJBa8GfYjMmKcQUe1Xy5r7NyqSApdS2geEPq8OfpSOlKiWIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=lEZ+kvdO; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250901142951epoutp0140d8a362abc7a37e80ec687fc9f09ad2~hLvxkgYMe1206812068epoutp01b
	for <linux-watchdog@vger.kernel.org>; Mon,  1 Sep 2025 14:29:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250901142951epoutp0140d8a362abc7a37e80ec687fc9f09ad2~hLvxkgYMe1206812068epoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756736991;
	bh=2IVilufhTk8OxJwrv6/zlVYsrGN5/kHDHMnuC7CDzWc=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=lEZ+kvdOgAgJi4Jw3RYYcX1BYw64Dh00cK7YI8yvONrG/6TnTVqR9fyPzn6WX5k7Q
	 7TcB+flqvRXLj0KvWO+tm2WAqvxbOU7bD804SwRZoHV+ffVW1VFhp44wu5ouBy6OQ4
	 +1LIIQ74X+ltEcB3moz9SMmZRmnic2NC1PNK8Xnk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250901142950epcas5p13ea9f7cdf7c686e688e71ae08aa36acc~hLvwyJHrt2550625506epcas5p1T;
	Mon,  1 Sep 2025 14:29:50 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cFrqd2hpgz6B9m5; Mon,  1 Sep
	2025 14:29:49 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250901142948epcas5p3b6580da89ca826378481451bdafce798~hLvvQIxzi3166431664epcas5p3P;
	Mon,  1 Sep 2025 14:29:48 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250901142947epsmtip2a81a5af8319bbbf7d82d50d5339d3232~hLvtvrwLf0150201502epsmtip23;
	Mon,  1 Sep 2025 14:29:46 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@linaro.org>, "'Wim Van
 Sebroeck'" <wim@linux-watchdog.org>, "'Guenter Roeck'" <linux@roeck-us.net>,
	"'Rob Herring'" <robh@kernel.org>, "'Krzysztof Kozlowski'"
	<krzk+dt@kernel.org>, "'Conor Dooley'" <conor+dt@kernel.org>
Cc: "'Krzysztof Kozlowski'" <krzk@kernel.org>,
	<linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>
In-Reply-To: <20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>
Subject: RE: [PATCH 4/4] dt-bindings: watchdog: samsung-wdt: Split if:then:
 and constrain more
Date: Mon, 1 Sep 2025 19:59:45 +0530
Message-ID: <31f501dc1b4c$dedf8fd0$9c9eaf70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMq6vyl63rBWSdRs1NKiWzUsYqwtwJkufMiArpZRa2xt8VwUA==
Content-Language: en-us
X-CMS-MailID: 20250901142948epcas5p3b6580da89ca826378481451bdafce798
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250830101916epcas5p13a007b24285862d6ed0db1e2d8b738d6
References: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
	<CGME20250830101916epcas5p13a007b24285862d6ed0db1e2d8b738d6@epcas5p1.samsung.com>
	<20250830-watchdog-s3c-cleanup-v1-4-837ae94a21b5@linaro.org>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> Sent: Saturday, August 30, 2025 3:49 PM
> To: Wim Van Sebroeck <wim=40linux-watchdog.org>; Guenter Roeck
> <linux=40roeck-us.net>; Rob Herring <robh=40kernel.org>; Krzysztof Kozlow=
ski
> <krzk+dt=40kernel.org>; Conor Dooley <conor+dt=40kernel.org>; Alim Akhtar
> <alim.akhtar=40samsung.com>
> Cc: Krzysztof Kozlowski <krzk=40kernel.org>; linux-
> watchdog=40vger.kernel.org; devicetree=40vger.kernel.org; linux-
> kernel=40vger.kernel.org; linux-arm-kernel=40lists.infradead.org; linux-
> samsung-soc=40vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski=40linaro.org>
> Subject: =5BPATCH 4/4=5D dt-bindings: watchdog: samsung-wdt: Split if:the=
n: and
> constrain more
>=20
> Binding defined two if:then: blocks covering different conditions but not=
 fully
> constraining the properties per each variant:
> 1. =22if:=22 to require samsung,syscon-phandle, 2. =22if:=22 with =22else=
:=22 to narrow
> number of clocks and require or disallow
>    samsung,cluster-index.
>=20
> This still did not cover following cases:
> 1. Disallow samsung,syscon-phandle when not applicable, 2. Narrow
> samsung,cluster-index to =5B0, 1=5D, for SoCs with only two
>    clusters.
>=20
> Solving this in current format would lead to spaghetti code, so re-write =
entire
> =22if:then:=22 approach into mutually exclusive cases so each SoC appears=
 only in
> one =22if:=22 block.  This allows to forbid samsung,syscon-phandle for S3=
C6410,
> and narrow samsung,cluster-index to =5B0, 1=5D.
>=20
This looks much cleaner.=20
On a side note, may be you can add an example of latest SoC binding=20
for the documentation purpose as current example in this file is pretty old=
 and simple one.=20
(I know one can always look into dtsi/dts for the example, but updating her=
e won't harm)

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski=40linaro.org>
> ---
In anycase,

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>

>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  =7C 70
> ++++++++++++++++------
>  1 file changed, 52 insertions(+), 18 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/samsung-
> wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-
> wdt.yaml
> index
> 51e597ba7db2615da41f5d3b6dc4e70f6bb72bb6..41aee1655b0c22a6dce212a6
> 3fa4849089253f09 100644
> --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> =40=40 -74,24 +74,7 =40=40 allOf:
>            contains:
>              enum:
>                - google,gs101-wdt
> -              - samsung,exynos5250-wdt
> -              - samsung,exynos5420-wdt
> -              - samsung,exynos7-wdt
>                - samsung,exynos850-wdt
> -              - samsung,exynos990-wdt
> -              - samsung,exynosautov9-wdt
> -              - samsung,exynosautov920-wdt
> -    then:
> -      required:
> -        - samsung,syscon-phandle
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - google,gs101-wdt
> -              - samsung,exynos850-wdt
> -              - samsung,exynos990-wdt
>                - samsung,exynosautov9-wdt
>                - samsung,exynosautov920-wdt
>      then:
> =40=40 -104,9 +87,41 =40=40 allOf:
>            items:
>              - const: watchdog
>              - const: watchdog_src
> +        samsung,cluster-index:
> +          enum: =5B0, 1=5D
>        required:
>          - samsung,cluster-index
> -    else:
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos990-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, used for register interface
> +            - description: Source clock (driving watchdog counter)
> +        clock-names:
> +          items:
> +            - const: watchdog
> +            - const: watchdog_src
> +      required:
> +        - samsung,cluster-index
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,exynos5250-wdt
> +              - samsung,exynos5420-wdt
> +              - samsung,exynos7-wdt
> +    then:
>        properties:
>          clocks:
>            items:
> =40=40 -115,6 +130,25 =40=40 allOf:
>            items:
>              - const: watchdog
>          samsung,cluster-index: false
> +      required:
> +        - samsung,syscon-phandle
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - samsung,s3c6410-wdt
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus clock, which is also a source clock
> +        clock-names:
> +          items:
> +            - const: watchdog
> +        samsung,cluster-index: false
> +        samsung,syscon-phandle: false
>=20
>  unevaluatedProperties: false
>=20
>=20
> --
> 2.48.1



