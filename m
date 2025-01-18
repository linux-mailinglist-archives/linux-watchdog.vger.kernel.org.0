Return-Path: <linux-watchdog+bounces-2735-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E391AA15C8A
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 12:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43DCC16601C
	for <lists+linux-watchdog@lfdr.de>; Sat, 18 Jan 2025 11:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73E1718A6D2;
	Sat, 18 Jan 2025 11:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EC1JPgKQ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3CC187849;
	Sat, 18 Jan 2025 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737200832; cv=none; b=jPaH9/N510Eo5YsvUwCAu6V3htahwBSUv7MBAgXsggDGm1J0WFC7VslWaCHh2LUcfUrsoz6YbIKakF0Isi14BryjjOREVKj+0Sx/8I4YEDIbwBzWTqniB9615IoqNoIJ2omgCfNowMZnBlx4Uu/9ZuCsvfcy5bp7f1B3EH9IEYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737200832; c=relaxed/simple;
	bh=tQS9mwd/H1zn81rX8U4yBTj/dA+Zv8W0IY5ZRLr3fps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SOAa6u2vg3x6a2hwNdjwFI7SKVmJnnACBQXxSV6293hRKDFhqLAIW5U3QYTsy/GcNZ35aPkJ+PORjnpZK28R32D8fmuNachdkenREpdFBSm73fr6wpBhnEhsQ/2+FlSG1CS7Qmwk3gMoAuE3wO4x+7GuhkTsTQDTzHGpMQtpm9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EC1JPgKQ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so445043966b.1;
        Sat, 18 Jan 2025 03:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737200828; x=1737805628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=EC1JPgKQwS14Y3y6ABn5gGHimFVSuvd6zmVqn0TvN1tR8TqEMoQBK2Q3rMI3Yy/xt7
         p8lwty4gPx3lTKCHbGETFdQ8cMJxPmBPjfxzh2/bQVouiYTOCr/kwDpOTX2rJvyPG3WB
         UmuDL/Ainyjbh2LnhFa35U1gLRrl8rfc3w5T3nbX8PcL4enAnK3K9b7G8DWxJJcXLmqu
         HNwESAWU7AuBzYnI/4r0HcVST0f9vRFS18fkohThvBb3b02UfYr2pgFdpjyhNM8SrCbe
         hOfhAeyez7JxdfnOrkxuTshhQXmOhZjKZENsZF/C86f26W6OxXc1lAB7MBaum92biOO3
         xFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737200828; x=1737805628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEETbdnKlsxmZe5oB6rAoR/Y3VNUS2QT7unKpMA9HfA=;
        b=qdr67XDrf0FypzgWXx/gZRWk5w7qnGRTaUsazohWwLKt4XCQM2ADBHQjtp+UmcRFnJ
         BcIO2CKHlD01NGe9I/jYd5Aupd4kKpchP6I5X58agAiFjEV+evVAo723jY1L4PXCOByd
         3CiYoDxFtDcM1TJjx5Z7he/uRgskja+sKABX1uF74yYI6l97B4+923u86iTx9Fd7SHoe
         UlQSLEDUeAYF2KDgO7FMlWU5wEewYi4faF9JissUty0bxjS1PolenYOjCFyiSBW1nXyS
         ojNsuXInOU4+dwiFIh7Y9oFYV4wDvMQz09Ji2szuj8l0BzuVpUiMOoZkzbgIEGq6QJ8d
         HsyA==
X-Forwarded-Encrypted: i=1; AJvYcCWdcrOOsnxGInC+acMZHaGKEKqVLJQl2EOmwZL8ng2IhFglfOFkmll0rLJlR5aNivzRGK7WzCSY2dzqlis=@vger.kernel.org, AJvYcCXRFWtjwGWhYiipFtDRcztJh+KmgE1LUwN0/SHqrNw+TgOD5qGzSNxedpSQ2F9H3epJR4nTcPOU4XBP+ZGVnrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/QDHGJUymAILfkWw1uXSKRCfkuF5bt99KJi/eGtOwVVOXm0Zf
	cUqT8kCV0gy0GPgxj76rsZ/QoaZ6PyzSKAQ90t5n0NjYBbAUKxH6
X-Gm-Gg: ASbGnctZvsI+u7z9AS8W/mDmWqDHJE+V+tzKIgrcLOvSDkvKynV2+62rqrnexh2+qAG
	kMjrKK9mqJl78R0l0jTk74e7e7mAMO3oeSoTA7f1T2VhBRweO8TTsUiMZ5Dqdel/D63CWVJ8/Ju
	uqUvx1siGNhXy3KuonxguwOl2idq3enf+iv1Sc2zg5S+W1+Qr1juuNhfyL3qzb/i3vUJRJDqCZC
	jK4GfZtD7b/LiqysYyjGK56mUDaYmRW7h3NGiLJsM2XuMpUGyNkIFldVnA4V9jHopkFVqVdalgr
	xay0R3CQcX8t9eQ=
X-Google-Smtp-Source: AGHT+IE/jKdo/VLXGSTwqZLRban4tKHtpH41BP/bx4E15bq4lS0FrHpTEehBdX2Yz4BsnqkbLRGFRA==
X-Received: by 2002:a17:907:7faa:b0:ab3:30c5:f6d3 with SMTP id a640c23a62f3a-ab38b0b7f5amr554823466b.9.1737200827845;
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384ce17f7sm323829966b.40.2025.01.18.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 03:47:07 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject:
 Re: [PATCH 03/14] dt-bindings: watchdog: sunxi: add Allwinner A523 compatible
 string
Date: Sat, 18 Jan 2025 12:47:06 +0100
Message-ID: <5534097.Sb9uPGUboI@jernej-laptop>
In-Reply-To: <20241111013033.22793-4-andre.przywara@arm.com>
References:
 <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-4-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 11. november 2024 ob 02:30:22 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC features a watchdog similar to the one used in
> previous SoCs, but moves some registers around (by just one word), making
> it incompatible to existing IPs.
>=20
> Add the new name to the list of compatible string, and also to the list
> of IP requiring two clock inputs.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>


Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml   | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a=
10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a1=
0-wdt.yaml
> index 64c8f73938099..b35ac03d51727 100644
> --- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> +++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.=
yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - const: allwinner,sun20i-d1-wdt-reset
>            - const: allwinner,sun20i-d1-wdt
> +      - const: allwinner,sun55i-a523-wdt
> =20
>    reg:
>      maxItems: 1
> @@ -60,6 +61,7 @@ if:
>            - allwinner,sun20i-d1-wdt-reset
>            - allwinner,sun50i-r329-wdt
>            - allwinner,sun50i-r329-wdt-reset
> +          - allwinner,sun55i-a523-wdt
> =20
>  then:
>    properties:
>=20





