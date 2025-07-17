Return-Path: <linux-watchdog+bounces-3881-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAF1B09243
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 18:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 844825A17F6
	for <lists+linux-watchdog@lfdr.de>; Thu, 17 Jul 2025 16:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240482FA638;
	Thu, 17 Jul 2025 16:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Fon+r/hn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A802F6FAD;
	Thu, 17 Jul 2025 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752771312; cv=none; b=l9JWKi6fvJsK630scvuTuR5yXJfTIzA2OEcT+CA/llKpZSqCKtKuseM7mOYWML72H2NsJEgFcr8D+8Zy5e7NWrhA4a69lJ4scTsW+WxGz0L72Mlzso5NLqe8fLFC1HqsA7cdOd2lK0RRoE3rPcfpd5nKFdA0qW1lI5b7Y5kIF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752771312; c=relaxed/simple;
	bh=aoyrm+xIj3+VkYjVVRyB5y8jKXfKxYKFb5IkC6+vbKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I643Bn4GSgqBHC5sU4MT6EZRccYxTjWIXZ9yz6hsfQ5GX3RtudDyP6WTPxqSrb3WFFMKr+7jpKy4XfBDbm3usKf8bLf1lXXYvi0fO4daOlP6fUle2Seyqz2VjMcT5oB+3Fj9RGEGQG7C0UW/3V5VKxA9GrxntkJweffBS1qU2T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Fon+r/hn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752771308;
	bh=aoyrm+xIj3+VkYjVVRyB5y8jKXfKxYKFb5IkC6+vbKg=;
	h=From:Date:Subject:To:Cc:From;
	b=Fon+r/hn4iAbgHlj62g0D4YWotPPSf5gvm0u0eBs+PKy8XWbGeyCt7F5r6p2tKbyz
	 MndNGBAbg+ukFKw9W+qke03Etzu9f7Z2q1oMsJbRk0sI0WLE7qxwHm4+KbuHfJFQhF
	 oi6yYW9c7BuBn2ZDvPl0jUdT6sQegjNIX2j8zE/UxvRKk4s5ApTx/PdDwEvyPHMEVK
	 Ne0l7oeq5gL6QxfvhZmYZoGdGIiPJEep6bXxr3YSo7bZracjsl0LUMpUU6eUMC+AQE
	 qpkmSsKP3Jyr8ZIrBZMm+T1ql3Oo3NYZQPdI9ghPjcUpyctpPeEuolgWSm4DOpoYs7
	 v/x06SEsj37pQ==
Received: from jupiter.universe (dyndsl-091-248-213-213.ewe-ip-backbone.de [91.248.213.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0A3D817E1541;
	Thu, 17 Jul 2025 18:55:08 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id BF7A7480039; Thu, 17 Jul 2025 18:55:07 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 17 Jul 2025 18:55:02 +0200
Subject: [PATCH] watchdog: dw_wdt: Fix default timeout
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-dw-wdt-fix-initial-timeout-v1-1-86dc864d48dd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOUqeWgC/x3MWwqDMBBG4a3IPDugUSt0K+LD2Jm2P7RRkngBc
 e8NffzgcE6KFmCR7sVJwTZEzD6jLgt6vMW/jKHZ5CrXVX3ds+68a+InDoZHgnw44WvzmljbqRE
 nKjdTyoMlWM7+82G8rh/iTesDbAAAAA==
X-Change-ID: 20250717-dw-wdt-fix-initial-timeout-d4b3a2ada6ed
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354; i=sre@kernel.org;
 h=from:subject:message-id; bh=aoyrm+xIj3+VkYjVVRyB5y8jKXfKxYKFb5IkC6+vbKg=;
 b=kA0DAAoB2O7X88g7+poByyZiAGh5Kuuh+oyrguAkRJEFg1gxdFZJrIZ6q/WebDqjtZt9+f7a3
 IkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJoeSrrAAoJENju1/PIO/qa7t8QAIDs
 771Lv1yl8CCOEqsen2KPOZU9vDAKnKDY9SH0G6qvgpgicfzlqKzknUWAKrAE1lDNIiDTLNiqJIU
 zPwlOSiaT0y8cfzgrLtHch8oev24njpGfCxLtVFNHaJmkCXZHTwH1ATPjM7+YMvvl+fCs0Ac0Wl
 iuREn2d1RH2zd6E4aiLT1eN0LDQ+chzCd4rwAzScSRZJrI2tNF08mhN94b4kf0XnP5F0KKxneoc
 3BRkQ3E59y99x13Ifrg3rz2t39i0ZDdWqDHfl+l4a+0lCiWh6R1tNgjWyXpuIvz3V6PPHI+ORbh
 d0m5/BPmrCp8n/8nAWal4wJsgEgJyNfKW3hjBXYxGBdKA/FJuCjrfFmajrLgCmwiogEUixT6J8Y
 O/kq5W2tmpcfKLSwpU2uh/RybT7bP6fWIhOaeH1CiAniiIaQ+vPy1ft+F+YJaK1q9XUHnuUlHfp
 AACsjwsuH+GpdIf3spJM3Sq8XKaPeogr09mG2yCFeTsawSyB9MA+dTnMncOVCEwgQTaTbF3oxTk
 tpBonDJgiATobeUlY3TdszGkt4W1cfMb0GQ/rRFuMIfusqmFxeqRh7K0Be3d/+1CENk+gLcyjHB
 AkOLzKw7a/WA6LjrbsDknkEyJ3lR6sufEB0FVVYs2xAbaRYEuKxSrNjViOHyoHRn6pNEZlT/O5I
 pZuV0
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

The Synopsys Watchdog driver sets the default timeout to 30 seconds,
but on some devices this is not a valid timeout. E.g. on RK3588 the
actual timeout being used is 44 seconds instead.

Once the watchdog is started the value is updated accordingly, but
it would be better to expose a sensible timeout to userspace without
the need to first start the watchdog.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
This has been found when setting up a CI pipeline, that
intentionally runs into the watchdog timeout.
---
 drivers/watchdog/dw_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 26efca9ae0e7d2fea1b2eaf68085a70829b62b3a..c3fbb6068c520133c8a4ca97313706e877857a7f 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -644,6 +644,8 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 	} else {
 		wdd->timeout = DW_WDT_DEFAULT_SECONDS;
 		watchdog_init_timeout(wdd, 0, dev);
+		/* Limit timeout value to hardware constraints. */
+		dw_wdt_set_timeout(wdd, wdd->timeout);
 	}
 
 	platform_set_drvdata(pdev, dw_wdt);

---
base-commit: e2291551827fe5d2d3758c435c191d32b6d1350e
change-id: 20250717-dw-wdt-fix-initial-timeout-d4b3a2ada6ed

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>


