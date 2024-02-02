Return-Path: <linux-watchdog+bounces-565-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DBE8469EA
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 08:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56D731F26E2A
	for <lists+linux-watchdog@lfdr.de>; Fri,  2 Feb 2024 07:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C8C17C96;
	Fri,  2 Feb 2024 07:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AN6opwMe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849FB18027
	for <linux-watchdog@vger.kernel.org>; Fri,  2 Feb 2024 07:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706860744; cv=none; b=iJ+PjnSawUjM1ElXr3CPd92WwvcV3f2ePETsh9GHsvzxHp2k0yL3GfxE6i7aKQA+rBGHEx/qHmyFiKGX0kh0KVrBA9kvIANumbMuQquTxCj12wgUfmXjhZJbokEPNAGpBjUjGabHYeLIAezbakj1Zc2KB91682qjH+ngXVI0nrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706860744; c=relaxed/simple;
	bh=9VQr3qBEExgAyIdAPOjFjPcbsh7gCfkBN/AKEwWZGWA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EcM4KVDir0gqbC5cOoagy/D1M8MhY8kzUwMnhQkN1CvdrdegLx/OYcrvNouG9++eMC2mdyG0aZ3qAddhZ4b3CMhH2jZItiDk7DhChQGoWxFozLu5wWCHWmGIPrX3rF20vCTYbOxvDPJnfVLgc5TSS2EY43Xi1iYqeQUFvgCmLoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AN6opwMe; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a36126ee41eso243534166b.2
        for <linux-watchdog@vger.kernel.org>; Thu, 01 Feb 2024 23:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706860739; x=1707465539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vg7eGbiNpgbKafsQCEgg8Uv1Axfky5dqLGTTkaDFDAQ=;
        b=AN6opwMexLItIPyx0YfzQ5s4dJ4gB9JNAzPzhC4ay70pnSCzRFadu68d4MCc34varv
         vr5i5iv/J+9ZB43ks7oj5LOp9693BQ7WLuSACN+dK6iRRCR1BMWsAlc+uB5z5yfz2NBc
         4ILLoSn+EDjSKq4V8aCnrb1n+JnjxC9/+0tjgqZwZx9+PbVICh/mlsEd1QIdUJ345cxe
         ut2EcOObugygejdbtRxO7gJpOXtgN7W8DJMwy1JfjoaLmFswVJvuBNXg4UsXVj6WXkHP
         YjCTCvnFmwlELyjLw8vM3SzYw+LfP7tqbRy2DUW9H5Szd5Tz5ZTq7+q5hcQX5Vymj1RU
         Nn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706860739; x=1707465539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vg7eGbiNpgbKafsQCEgg8Uv1Axfky5dqLGTTkaDFDAQ=;
        b=OYfeTBjzUtF6uTlDRcc/Td5dOnfURpd22zd/5iHnUv+78V1UqV0Y0bvG0W7cRJFeUj
         Un5FJdHOYi9Osx0dx/Q1OniofW+e+X4RgeDQ0qF4dw/Bg0UxHNZdE+78MOS2Vj3C+qjE
         RoG3phYyMP0O9k6n8rOvyFlKTBpRHuEoN7XWnxMQmMsdhCZlnNqZyeX1dFvkhUnd8QtN
         S9oMXm3Jm1dQ1+7sCc+qaqHLH+h013oephvkjVoMWyIMBS4BMl40Idh7zPSz53EVJKbO
         LK1evANv9iM+HvSeGLVmP2WhmdQf4K0aO/dggtiF3K7Bp7/AlfFcbEWjqc536NAchRN4
         hGNA==
X-Gm-Message-State: AOJu0YyOYnRopnv0a2111ISNi3+U8rMHcxaS8dGlMJhvfWrHzz0/MFQI
	IeafSFMuhDOp8IelxwqUkpWXmjsq5dTfINLM43UmWiaO2QI9vhwg2I4Pis6VPZI=
X-Google-Smtp-Source: AGHT+IHhLl8Jusm77YBx8djmKrZh6S5P+dmY1JNozaGSAKUnIfrULWIidho3cu6CEJ5jjZ6Wpf8Esw==
X-Received: by 2002:a17:906:3108:b0:a37:ea:ac15 with SMTP id 8-20020a170906310800b00a3700eaac15mr598662ejx.35.1706860739585;
        Thu, 01 Feb 2024 23:58:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXVDm2TJfYO3hrY4Q+xL9KAz6xi1v7Q14VJavUrv6BZj1bCAqHWFvUGEa9w2D1GTIUiO9amhqCHzr0SvSebZVLDeazibmJIzugNasiRrBfxKSFvJqBmqduDfumxnF4AgO8ou/ODF58EtfI3/yeE8oxGLpIzlJNQ9TN4vwTeTAJ826zr0HOmRrKMdDYe9dNW57P1ODgf5jmKpZKQulO/cFHeNDCocmpLVPsNzF9QAUYZGQT1jHbTvtnjgtOWzUoosxewagGKZ1bgpp9eii2jobXAOthmVKwEtJ2i95PxsUnknRfyorWTslDAgrCAdOG6JUPtxKS7fciLHeQELIoTbs+ZUvfodASnJzbCCC0zCnNm263lX5APZ2F1ld9qQ4JNy01TjYsCs6YYaIrBZJNyKlF8dzLrt/ox8v8R7VPPnNlkwPmJ2eSL3sYnyhA0sA+ZuZylkeU5H7ZgZcpaWozE4UALt6dIeCSP2tk0JsvgFE1HXzCrg+c90gwdkbvjIb7aySmpeRpIh3MLGw==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id ty13-20020a170907c70d00b00a3715be38c4sm185544ejc.210.2024.02.01.23.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 23:58:59 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/8] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Fri,  2 Feb 2024 09:58:41 +0200
Message-Id: <20240202075849.3422380-1-claudiu.beznea.uj@bp.renesas.com>
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
- patch 1/8 makes the driver depend on CONFIG_PM
- patches 2-6/8 adds fixes and cleanups for the watchdog driver
- patch 7/8 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 8/8 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v3:
- make driver depend on PM not select it
- drop patches already accepted (patches 1, 10, 11 from v2)
- re-arranged the tags in patch 8/8 as they were messed by b4 am/shazam

Changes in v2:
- added patch "watchdog: rzg2l_wdt: Select PM"
- propagate the return status of rzg2l_wdt_start() to it's callers
  in patch "watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()" 
- propagate the return status of rzg2l_wdt_stop() to it's callers
  in patch "watchdog: rzg2l_wdt: Check return status of pm_runtime_put()" 
- removed pm_ptr() from patch "watchdog: rzg2l_wdt: Add suspend/resume support"
- s/G2UL/G2L in patch "dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support"
- collected tags


Claudiu Beznea (8):
  watchdog: rzg2l_wdt: Select PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert on probe/stop
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   2 +-
 drivers/watchdog/rzg2l_wdt.c                  | 111 ++++++++++--------
 3 files changed, 63 insertions(+), 51 deletions(-)

-- 
2.39.2


