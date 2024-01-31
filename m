Return-Path: <linux-watchdog+bounces-534-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A165843C15
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 11:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6131291F37
	for <lists+linux-watchdog@lfdr.de>; Wed, 31 Jan 2024 10:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0D569964;
	Wed, 31 Jan 2024 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OIsnyWfX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8669D01
	for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 10:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696430; cv=none; b=tm/f+vHJ3B8T1Sp35w0AcdJIgJWb03Rr0sf2SbZI20aEva37G+ZPCQtT3GhHMUIpxbRFMr71w6P/nQB+2JBU2MUDksikKmUrxI5Xq7hWoqwTGqQLROZdNGmyNQFefn6tspKaXB/lzZza5K7j3wZHvrxOstofBiyLxuioTHcSmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696430; c=relaxed/simple;
	bh=UiORm6wg+ND2g1timUzZOpcyVuU+9hkkKah588hb8I0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TSG4xKWFP4XvbZto3S+EbArAz6sq+ztLZS/Aoq1hiC/PP7D6pbJ39FEhd0mUC1/4x01EFYu2We3nleT5R6oxydNym6Sbil+7T4/T7yDEWiNrojfetxHHi2kzXhPqkeC9VuefVY0u5amriDsLdyoAf6mYZ4fhmxQE3H/g66tAbFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OIsnyWfX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a359446b57dso425052366b.3
        for <linux-watchdog@vger.kernel.org>; Wed, 31 Jan 2024 02:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706696427; x=1707301227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T5kJFKr5iTOo1U31zyzdDHRoKpUWs/L5KPoOuxNE44c=;
        b=OIsnyWfX2TvfrJaoCw5HUFgjtWkv93KI62j96xZDFbDwr3BRHuWErO7SLxTwd3/f1Z
         WCsax3b9rfowTCbC7GtqFbHdIMLBq4J9gMzJCOguMsLVezW9/ipuV5uaMXEG3CxAmwSc
         +nsR/a+hx2W4igRpMPRVkwAPg7P3vFS8G9EMl4/Orywc1ISmT03ScgAMvs/QST8J8Vbb
         mV5/fnzjLV2SXNgZ5XFsi1QHJYw6Uzz5WG1xxV+2Pa3911SPKHgbKU0xuhWtp0Tl5Ugh
         3N6gMpcfEVNfSE2QzknYEV2N7IBuQZeKfyt3pYKwjr4Jjh6S1qsvaaHTQsOTCtRYU4Jv
         xNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696427; x=1707301227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T5kJFKr5iTOo1U31zyzdDHRoKpUWs/L5KPoOuxNE44c=;
        b=C/r3lxvLQNxDs/GByPJKJgbY2XoFn5F9OX7k0FIWksPuaN6XRxXAuGS7ySXp06PemY
         dct+FJ56BgEPEvSvaaa1C3qvXUBKckdlsMUBWd3wEoCVnoVb1Hvj3E9QjZnc+JeMUlFQ
         I8VKJhrDhc6H4aPaRm3LB1FSuGi3yx+TeL7M395w86sGMlsFE/F0/Rd36Fps6xEAFi1P
         hCsK5L0bsjJihQ4iWUL73xfJc9cS1r0/2V4O/wWiFfruA5MdAUw+3p8DMDYPqYyU8KUt
         7/pXXxc3OeL8JBPRTnrQit2qNynjoxbSMCWp3KOthlKTs2XBzXsLTjl53A2EYWNVkESt
         EUzA==
X-Gm-Message-State: AOJu0YzQ4UBevLZnADmJRztkaH4vDxwmHB8GsKtV9ebx8A0QU+AvB62X
	5Vn3FtuGRFajVA3L9QCKh38mBxafF1rYi/gPWa6P7IOHGwmb2FgEdkk1GVgOYww=
X-Google-Smtp-Source: AGHT+IGsS1EVCz9f1k8KuUptnP8yNx0ak7r9DfqvZR6JCmobFGB5IciSh4lafL4wf8HZCeB9WD+/NA==
X-Received: by 2002:a17:906:4f10:b0:a31:81e9:dbbb with SMTP id t16-20020a1709064f1000b00a3181e9dbbbmr744774eju.52.1706696426805;
        Wed, 31 Jan 2024 02:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWqb/5dxkuvkTtbLVQaq3G8f1oqCG6PQKLkgRSnq4U7gFpJvcncDYg0Qe7BZGgD6TVGQ1r1WeZIkouY0CmEC6vX9wDZFXFx9xvkchCCpGkggbnXguZftsvVMixwWixVS3rnDH+MjN5WbaUtSjvVGhNDJ8xv9LpM5iTzQ/BdIjbfmJdnIO8n5tLe52NG8Ci3LIBNdOli73YkQGsqhUE0pEemxPOcoFULibOJuqhRffOBy7jcww4hzC1dd0YqkrpU7+otl4/l9JgruqvTe6AXaxyPA8Dw6oJY+5FyrEJNjZ1vAgJLAOYoHEIPSi6PN/ofn+6BQgfSL+1c2yRCpXHEEhUG8KpwUwvcoUZlLxBrqyNquEynepYij6zUAw8f1ArUi7oCHT5Te14N7sJSfTVQAclxBPXs5LajiqQQ16WQdNuy9v3R2RUytKdDqMgAmQ2dIAHKHeEm6VnCIrrIMULqLjkTaPV7NK49B1R0sdsAvlBXMCzBlXCXa5VCO8s6D4juUWilW4bwkwjx4bbWxJyCxcbIZStAvSalZo1uD+HRNykWJvN2DwtSq8D1Xg/fIw4ca4BiPQELfFmQRv6ymBh0uwAmgYsxa+u4pCUe2RJfZ2J2B6E=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a3524be5a86sm5212966ejc.103.2024.01.31.02.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 02:20:26 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 00/11] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Wed, 31 Jan 2024 12:20:06 +0200
Message-Id: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


Hi,

Series adds watchdog support for Renesas RZ/G3S (R9A08G045) SoC.

Patches do the following:
- patch 1/11 selects CONFIG_PM for the watchdog driver
- patch 2/11 adds clock and reset support for watchdog
- patches 3-7/11 adds fixes and cleanup for the watchdog driver
- patch 8/11 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/11 documents the RZ/G3S support
- patches 10-11/11 add device tree support

It is expected that the clock and device tree support will go through
Geert's tree while the rest of the patches through the watchdog tree.

Thank you,
Claudiu Beznea

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags

Claudiu Beznea (11):
  clk: renesas: r9a08g045: Add clock and reset support for watchdog
  watchdog: rzg2l_wdt: Select PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
  arm64: dts: renesas: r9a08g045: Add watchdog node
  arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  14 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   5 +
 drivers/clk/renesas/r9a08g045-cpg.c           |   3 +
 drivers/watchdog/Kconfig                      |   1 +
 drivers/watchdog/rzg2l_wdt.c                  | 111 ++++++++++--------
 6 files changed, 85 insertions(+), 50 deletions(-)

-- 
2.39.2


