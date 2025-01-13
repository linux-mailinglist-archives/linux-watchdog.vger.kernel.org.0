Return-Path: <linux-watchdog+bounces-2675-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E907A0B56D
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 12:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77509164C3A
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B5B23ED42;
	Mon, 13 Jan 2025 11:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8QgMmSv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC0A23ED4B;
	Mon, 13 Jan 2025 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736767442; cv=none; b=d8vPrFVeXw6bCK0be0ORdNBlTwmtHf6xNITDfwqsyV0GCIHAKswNqQVFllbErlp3rDan1ygmlLXWIBjd7GQ0OhOnolWOsLLuzGEnBtknP/AAloEzqmIaCHp5Hhvw5JmmR98LpQ9z17Il1eJe7xDdd/CenlHZ1BJZsa+xU6LIe2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736767442; c=relaxed/simple;
	bh=uF1xHrcLaagZaXrl3wDes6fYBZW88Tn53KzTiwDHhwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VlVMP5E+QyFwUPiBu3xXkVq6TaOXhRUsDGw05/OHEWC05BoL3vRMy2vh3mZ/upsRwP+kZiVEBqhphMuHVc0D+ewlV8vz7vWig6wklF456YLx6LzVYB/lyjCHJ/Mfre/+iSTT8QVIrx0fVeeZ8I6UjyjC/dbKqH9NhWf4fPMLnsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8QgMmSv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43621d27adeso28507675e9.2;
        Mon, 13 Jan 2025 03:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736767438; x=1737372238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K82cda9e4i7k6cM1nftq/HIlblP/nkUsi0oIq9UZS3g=;
        b=K8QgMmSvlYilV3tYSzqsU/iO1/Ziv9uwq1JnYK53IZcgiovtNoNav/GwTkMaF+BmpT
         iFLyUSG8G3T+SYB+u+BTEGMZ2Qp5LVHx7q20ElHTwQoe9QOREZ/WlS97oywCEPRV3S0k
         9Z+PJ05Pcwb04AsUz5C9dePwDVIDZX+e3Q8hzOggsjidQosXPZvO/d1IUV0bmG9pGCvC
         2QvCM2CdhpdfGNoDO5djBFgxQQxyBb3fdvMk3TPWNs5H/2jqmVoy6233OeDx+3vGP1AF
         tI3vTAfNBp+AAENroaG8dfaBWuNVrrCXuGgjszT1tyHr28NwY4R4Fr2L2t+Vhi4eYQzT
         pFKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736767438; x=1737372238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K82cda9e4i7k6cM1nftq/HIlblP/nkUsi0oIq9UZS3g=;
        b=qHdEF3Ogh2zXN/BxWeBLlOwaiPViu1H93RWYv+78/ZFmRCi05IR9SAwWlBwjd47bZR
         WVcAIqP7b3tR83A4LOv42XXilctiNiOlqYNnLFh0uPtwoF2ntxkXUgQZep6LwrmN0/EP
         a48Oo7gXQo6XTiXCWB0RbwwC8hPcCw8K5A4X0WM6uLj5fVb+8i/1av7fkRmTLToz6Lx5
         ioGMHywCAOGSEiV4P4ASQAGyf5Y3wy6HkyJfuzKNpnwHpXC1qhgSUnaBuGTl+Qrro0FK
         CZFr+TNvuqvGf2+ZUFXPCLqKwKZ4a+M8hoehW2UT6T7I87pDgXTrtVUGa65Im2pMHSGJ
         GZwA==
X-Forwarded-Encrypted: i=1; AJvYcCUZh68IIGwhaPM8qYPio9fNTURcMjV065q1VLJH32JXtCdHDiE6tJCE+nTp9uT5G/iL+7BDpnagIOa/GHs9edI=@vger.kernel.org, AJvYcCVEhH7LHopbqlB5mJ2kGY94ti3ZkrYzaShOx+8lyhPzC0HLe2uDl0rQNj02jm3DST61wIveN6/akn23@vger.kernel.org, AJvYcCW+7MTzBxnAWVbwbohVVYnaUAn7o5QGd0cKYBGB6Myvxwk0epXGV0o4+Yi3QwjP7tZHCzvoxfZ4+Fbv@vger.kernel.org, AJvYcCWPNY/kaPaJjtiDkGcJMH03AhJwg1lACHlD/8z8b/tqwWAfJw10kKqM87+ZqoqsYytxpB1w6OWsXUkbzkwo@vger.kernel.org
X-Gm-Message-State: AOJu0YxnaC+3HXwd2dH2u1uHC5bAMJV65i8TxMI4JlXCESomsz0ENkGh
	GVz+yxTLLs0unhUJ2SzUwJpjgXGRDycIDVpdpgJAtw2mLN8AbdEk
X-Gm-Gg: ASbGncvWMxEprDqXq5MywA5bvqpgFh7s70nB+cC9FNizhtw37pUt6hfZoosH4BpWBaf
	aZBF/IfxZT7mWvIvxQkfbelpC8LpAXaCxBkrNcLg3ViJvJHWFBu2zMz/wVgZmcRuqzaALpbwfVb
	PrB7ugNlsOYXdQiNBp6/JmprdiN+3stH+2caZWM8zaKINE7mECd1jbb1RGcmjFDB7ZPgGrhd841
	Ol0j4YpFLQd9UGcyCSveLI9SmP/dPX/OwhaMJacOvX9BAuMYELogLhwGpNx0CItuL02mIiEpFWd
	UvX7hdWjwA==
X-Google-Smtp-Source: AGHT+IHH5J2EPnxorufguZOGVZ5rjBX3pnnxrSTz7m2S4kPmydjcSVlwu2/QEsHUzPPnB7zePS5yKQ==
X-Received: by 2002:a05:600c:3b0c:b0:434:fa24:b84a with SMTP id 5b1f17b1804b1-436e26d96d8mr160946715e9.25.1736767438079;
        Mon, 13 Jan 2025 03:23:58 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:acc9:404c:3a6c:d1aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f04df606sm107597115e9.12.2025.01.13.03.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 03:23:57 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/6] Add support to retrieve the bootstatus from watchdog for RZ/V2H(P) SoC
Date: Mon, 13 Jan 2025 11:23:43 +0000
Message-ID: <20250113112349.801875-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds SYSCON support to retrieve boot status information
for RZ/V2H(P) SoC.
Summary of Changes,

    Clock:
        Add syscon compatible support to the CPG block in bindings and
        device trees.

    Watchdog:
        Document the renesas,r9a09g057-syscon-wdt-errorrst property.
        Update the watchdog driver to fetch and report boot status via
        Error Reset Registers (CPG_ERROR_RSTm).

    Device Tree:
        Add the syscon property to CPG and WDT nodes in R9A09G057 and
        R9A09G047 SoC DTSI.

These changes enable the watchdog driver to identify boot sources like
Power-on Reset and Watchdog Reset, improving system diagnostics.

v2->v3
- Updated comment section to mentione there arent any ABI breakages with
  this patch series.

Cheers,
Prabhakar

Lad Prabhakar (6):
  dt-bindings: clock: rzv2h-cpg: Add syscon compatible for CPG block
  arm64: dts: renesas: r9a09g047: Add `syscon` compatible for CPG node
  arm64: dts: renesas: r9a09g057: Add `syscon` compatible for CPG node
  dt-bindings: watchdog: renesas: Document
    `renesas,syscon-cpg-error-rst` property
  watchdog: rzv2h_wdt: Add support to retrieve the bootstatus
    information
  arm64: dts: renesas: r9a09g057: Add `renesas,syscon-cpg-error-rst`
    property to WDT node

 .../bindings/clock/renesas,rzv2h-cpg.yaml     | 10 +++---
 .../bindings/watchdog/renesas,wdt.yaml        | 17 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    |  2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    |  6 +++-
 drivers/watchdog/rzv2h_wdt.c                  | 35 +++++++++++++++++++
 5 files changed, 64 insertions(+), 6 deletions(-)

-- 
2.43.0


