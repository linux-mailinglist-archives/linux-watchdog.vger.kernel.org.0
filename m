Return-Path: <linux-watchdog+bounces-904-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633289F8A7
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 15:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9744B1C20B2A
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Apr 2024 13:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9235A16E872;
	Wed, 10 Apr 2024 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="KYHzQ4Pk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6800316DEC5
	for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712756468; cv=none; b=Z4ce6hTNl3jylwh21EpOMfIniZtZHajQBN5xUP5NBiqHyZ7b6hpxaxR7oSTy4Jp0bxxwud+3pxgopLoBu3zFpvL+WNEvVlv0O8mqXSkhrpWxKJ5TE8VX89qQW1KLugkuYZPd9ighIPUNS/xZAzaUTS3pZW2+k0WgoOxkYILeekg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712756468; c=relaxed/simple;
	bh=w1yxUr+e94JNiQhyApXQzG14kOfbhJO7Nrggm3f4iz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bJO6NkDbK3ZtvWqP9EswNML0eF75VyduAQW+xdIvdAfUXMirAixbxKmDmHFAElkwVCr4tgJUYyeeSopOtka+WiOqPXauorXZJmIp6gKiNmL1y/k3+LPXoDbJbeYsFqXxYOQI/2o46ClB5QdsS0I+wqVUDQL/Z+L+trzyYE1f0y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=KYHzQ4Pk; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41739e4f8caso3003125e9.0
        for <linux-watchdog@vger.kernel.org>; Wed, 10 Apr 2024 06:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1712756463; x=1713361263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OgPnM0yPd3XkLtMCMzEU9ADT5EI0Xg/1xBhNwZOIrjI=;
        b=KYHzQ4PkeM3/nE08Z8ZT2FFaH2PPHn5tnP8IID0p9+ZBAIrMBGIObzHw/nCycwlxdd
         IEkaLWP4wuadKxJR33cZOp/Y9UwOhAQ4kfTCTNsTZElyuvTbBWGi0gmwb4VnHkCVa7qD
         dGhSImrZCP+/CtSkZVG3KSsIpcD1hbC0ZiSFDqzdpPpQQF71NcZR/6bYibqkwNh0VzXX
         wRpO/TwKFAmJFrvrglmLBUe+Zi8AcayguNlFkydZovPZzhFZtbT1Q1wjADKVfLQUVs1L
         q0bH/O5pESqyW55VbchWyTtJ1nrheynA8igjWJ3sT2gqJzeLWOpqe3YjetICeRMBqulO
         RBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712756463; x=1713361263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgPnM0yPd3XkLtMCMzEU9ADT5EI0Xg/1xBhNwZOIrjI=;
        b=P37lIeNwh2Wg+73PDjpGcT73rr9Gu+2lhSgHQzd4Xneu5T1rvwBSjgjCbexIS+IFaK
         ngDQ15TIKmBaf/g4mpv/KJ3NBXUR0oAJNZZq7Q0+KFLht0Rb/cH7pQYL3NTExvi//ubx
         HeS/Vq8kmVhqPn2KMxV3A4+RcxjlJ1sd3tZYqZjXt0desT8wSXDQ+f2rX8u3hepokKy7
         Y/ajDzksr0NH3cezjF8XCw1NYydMLKgJBgtmpUYz07TmG/VWOGzi0SYwXFJqOpffAB3n
         wzYvLm/Q6DfCvv7Ayyszt/3sxOqaIFa+2BeTFLZR8YKzRM7DMIGTdiIIqVIsQfSOFFnH
         qiGQ==
X-Gm-Message-State: AOJu0Yy/Td81G4d0IaNZ6fX5Ab+Tka1TJOEA3B9C6OsULcuhM/N0cndU
	20nnpEIWl70dsEdZzo+/vVR370piD+OXv4S+GfQpglKXNXJM9IJESVaHVBTFgIY=
X-Google-Smtp-Source: AGHT+IH6UhzKqls5jFfJx0V6zACCsECFizHKBE462Q3yuyDJDifrfACAWokgDHsk+oJkkHbGFJL4Xg==
X-Received: by 2002:a05:600c:3b9c:b0:416:b099:7878 with SMTP id n28-20020a05600c3b9c00b00416b0997878mr1854806wms.4.1712756463431;
        Wed, 10 Apr 2024 06:41:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.8])
        by smtp.gmail.com with ESMTPSA id n15-20020a05600c500f00b00417c0fa4b82sm872528wmr.25.2024.04.10.06.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:41:02 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
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
Subject: [PATCH RESEND v8 00/10] watchdog: rzg2l_wdt: Add support for RZ/G3S
Date: Wed, 10 Apr 2024 16:40:34 +0300
Message-Id: <20240410134044.2138310-1-claudiu.beznea.uj@bp.renesas.com>
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
- patch 1/10 makes the driver depend on ARCH_RZG2L || ARCH_R9A09G011
- patch 2/10 makes the driver depend on PM
- patches 3-7/10 adds fixes and cleanups for the watchdog driver
- patch 8/10 adds suspend to RAM to the watchdog driver (to be used by
  RZ/G3S)
- patch 9/10 adapt for power domain support
- patch 10/10 documents the RZ/G3S support

Thank you,
Claudiu Beznea

Changes in v8:
- added patch 9
- collected tags

Changes in v7:
- updated the dependency on patch 2/9

Changes in v6:
- update patch 2/9 description
- fixed the dependency on COMPILE_TEST previously introduced in patch
  2/9

Changes in v5:
- updated description of patch 2/9
- simplify the code in patch 2/9 by using on a new line:
  depends on PM || COMPILE_TEST

Changes in v4:
- added patch "watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
  ARCH_R9A09G011"
- collected tags

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

Claudiu Beznea (10):
  watchdog: rzg2l_wdt: Restrict the driver to ARCH_RZG2L and
    ARCH_R9A09G011
  watchdog: rzg2l_wdt: Make the driver depend on PM
  watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
  watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
  watchdog: rzg2l_wdt: Remove reset de-assert from probe
  watchdog: rzg2l_wdt: Remove comparison with zero
  watchdog: rzg2l_wdt: Rely on the reset driver for doing proper reset
  watchdog: rzg2l_wdt: Add suspend/resume support
  watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
  dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support

 .../bindings/watchdog/renesas,wdt.yaml        |   1 +
 drivers/watchdog/Kconfig                      |   3 +-
 drivers/watchdog/rzg2l_wdt.c                  | 123 +++++++++++-------
 3 files changed, 76 insertions(+), 51 deletions(-)

-- 
2.39.2


