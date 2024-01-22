Return-Path: <linux-watchdog+bounces-431-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C884836135
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 12:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA2072874EA
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 11:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922253B190;
	Mon, 22 Jan 2024 11:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="aqNLgk52"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13723B18F
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921903; cv=none; b=ZaWiGUiUusHBwVU9vKrN6zQsjhM0u5e5SBzrIIVKYnlTpkwDzL+gAbsrPAMdthlqm8i1RMze5of2uwXNxD4hDJ49tzX3nBtORRpzqZI9dyF94KfVGoN3FASNSH566090M+b5x86U5LSrjIdxgKduMybAHtH/wiBSGIjEnq1RUV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921903; c=relaxed/simple;
	bh=UxyTRYJrjqQ5DKtv4x7xt8N6ofKWsaiz0ZFqC7P9iQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SI770tgAjAEIlvPxuLgbXV+DvmOyMupyFvFf+FtqA1gZa9jQG4vVCAXJ3WZgh/Y0KsN6DMGDeSLxtVjV84nnNO6oR84fBuooVXxDw2JHh9SdypUnVqC5+/nbB6hSHuStktpNMuSRrP18eUXnqhrV3C6toXDcoSRIPsYFpv9Z4mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=aqNLgk52; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-559edcee47eso2504980a12.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921899; x=1706526699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=aqNLgk5275sDX48SHiN/znMn0nYhbuic4/hP5/FA/YaBtKuZ4/P3q/fT6ZwvhH1W65
         rfJTwX0UwvOl6iedQ2JoKWw+THqznadPcRevqKCXVp2sM6lLGAAgiAl4gsp2ieDWfSZ4
         OpsuDDBjks/qq8E/q+1NlJws5QX92jzKFhcMPfCUZVPulSXb/cSr8gMi8PhNyBBhFVXE
         gjWD+gEGkYqdsQjPPYn5sTRB9uxbc3hWF5AJoVGdhFYnPuSc2gfiC0w99HRzuDCrHCIJ
         oxqhSgZYK1ZT5IL+Ho68Si0XmB9tBjZYiv5txVqL3JttSqTAnjonY25tFEDDKxAFveeN
         LTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921899; x=1706526699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+NuF+IrheqV39DhurkeC/NdqjCC1Krg29+Aw27A90o=;
        b=QAM0z+0ikq/rMJPkOFQHYO3URJgd2Y5PaIR2GzFArsWTg1AYjbGHU0NIckbSEi5C7b
         3IhqENAJ0c8lWBr1xRPUlm5B7aRDzmwHHdJlVLoOJOTJJeNzJO62VogNXTNbOJ/2CwpV
         6LTpwB/VY8S+ixJzI4WUmhkZeQ9gaRq6RYkeSwNDAlLiOsoeR81riQ67SEeqGA09qaTM
         UxtvjrMcc+WhvXWhBTUMYXhi9GcQGQBsxa05lneazNMd8WIJA/SezC2Z3EKsZyFctqFW
         4oYB/gNekr+d5OVDNeQ5CHaVEEdZyLzFZqSisD26Jey/Q4m+lYpYv6b40fcgWSYOReGF
         JUHA==
X-Gm-Message-State: AOJu0YxZe/0APkhj3nUbVe/tl3T45M0YG4z9IXjXFrXRhkYkoXRxTk90
	HW9Pze5691s4Dxkes7PI8A4OXeWdaxmHXHM68UD/RY8gfrAxGRUYJdTdy+93IUw=
X-Google-Smtp-Source: AGHT+IHTI3lS82Shzhgaq78IcSLYXJWf0bXqAjyhj0u6OR9ZSFyNceOlihdHtJoisQ6VBe9RQdQutw==
X-Received: by 2002:aa7:c618:0:b0:55a:8430:834d with SMTP id h24-20020aa7c618000000b0055a8430834dmr1650512edq.65.1705921898698;
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:38 -0800 (PST)
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
Subject: [PATCH 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Mon, 22 Jan 2024 13:11:05 +0200
Message-Id: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
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
- patch 1/10 adds clock and reset support for watchdog
- patches 2-6/10 adds fixes and cleanup for the watchdog driver
- patch 7/10 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 8/10 documents the RZ/G3S support
- patches 9-10/10 add device tree support

It is expected that the clock and device tree support will go through
Geert's tree while the rest of the patches through the watchdog tree.

Thank you,
Claudiu Beznea

Claudiu Beznea (10):
  clk: renesas: r9a08g045: Add clock and reset support for watchdog
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
 drivers/watchdog/rzg2l_wdt.c                  | 100 ++++++++++--------
 5 files changed, 76 insertions(+), 47 deletions(-)

-- 
2.39.2


