Return-Path: <linux-watchdog+bounces-2232-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7339A4091
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 15:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFFB6B20974
	for <lists+linux-watchdog@lfdr.de>; Fri, 18 Oct 2024 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B8318872C;
	Fri, 18 Oct 2024 13:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bL5KtE1+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902B941C6A
	for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 13:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729259912; cv=none; b=o6uFMk4zvy0y2mCnSKGdvJOvMUmMZ9rAq6Y0NXB5x/6AEZrmNYObFAnNA+p1IybmRbj/2Wc8MwoTFvnEf6uG4MwKCjfqbbzimnCzszy0s0nGuxkDNKpxK/RDI5a6+mslIlzE6CbYcw6I2dmBeIApaIlV1rimB2zJJCiaT/PJqhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729259912; c=relaxed/simple;
	bh=wBLpiz04Ca7AiprvaTVLIOO2ByK1wMfBF+jrOyeSimE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kpKvV7zDzdu5RpYBTBxYooqqRt/mRbIcU/bhi6GOlO9OugNwTZJrGUeim/U/IhHCoe8KSe7H5RrFJ/l12Z84fJgBcCdjnLyRO65U8OHgqWbieSALFgSpYfcskHo/9ynCuorM0rtw/ZOqa0ceqavdgU4knPPlmL1jvy9WRZNb+nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bL5KtE1+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e625b00bcso1624025b3a.3
        for <linux-watchdog@vger.kernel.org>; Fri, 18 Oct 2024 06:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729259910; x=1729864710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lvk4D67JdYF7234jET9PdYl3FpeiKeSOpTItXtjBTeM=;
        b=bL5KtE1+wHLJ4SsYRjztA8YIsu8TRNQbAXAQdcGug11sMGI0i8VP9uKPmBKj1KU86Y
         8mF2I+pxktIkZrbJZDtYEY3ZkNkk03BAYlfW4+2XVSSa8Z0QFmF67w/R4PmxpXN9cL1p
         UElsziBnb25Ry70W3Y3zyYgW8VxjbCw8s2S6t4J2KA1GO09H1gYtDoJdbnXQ/VQ3yLo7
         vbTjeZvCnnyAqZsyAd7zeGczlMahnZUXAYVs/tsssAu0cTOT0nmCAGuuVeUhWF51DMka
         1xLaCAfvoLlsW2z81Fcd1fNl54BQKanCPKF+iWQk1ZcUNi3bVSJDojhDIojS9raftlW9
         Ig2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729259910; x=1729864710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lvk4D67JdYF7234jET9PdYl3FpeiKeSOpTItXtjBTeM=;
        b=hjNwRWhvhEXINFy2TF8UyssCufHgWD3E5DcjI2KVSg5fPYUKlG23E99awlsaVQhWDQ
         Trom0nKdtgXsyY13cJnNzIPpbo4DODQlqiiMvOioDA+IwQlpzZpm9gwDoR3ywrLQ177C
         4SAj/OruLBkWvFNSvmGln6KZSrswVgViJ+G4KQwxOpHemFWlntJ4oF+L0KQx94nHMawP
         XiDwJsVebTyC+AM5PCxfqHCc1JbmwJ+9yYB2APLNRnvHU6+Y7rqD1XlAMWYKzMCJ6cjf
         gyMF+sHmAh92C9SS78Gt3c2SMmj7gc3Bo66gHMxrCHNvR4TAMV5ftrDWgrv3fRjkpDHs
         6yuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZSh+6XppA7G4/qxGf4ffhQ9bygy5QSherNG1HVqwBhzSQKhgamq1S+wP1Lt3hmdWyPAci6Ne3Z2ZiHyzXlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHoN8hTyOoywTrQnSxdnpt/sBxL0UdfjBRe2ikLj59cKj1pWY/
	e5hVZNK5rhvOpo0DMn3YxYdPzRl5OWFo29qA6uCnUwHwjp2XWeZcBpuj9A==
X-Google-Smtp-Source: AGHT+IEHY0yNud14gDjBKaoqvJwyIfEZ3KCqQodwI4PenjTGlvHeiridY3OlzBSCPQ52T+YwcYaD/g==
X-Received: by 2002:a05:6a00:1705:b0:71e:55e2:2c43 with SMTP id d2e1a72fcca58-71ea324c73fmr3163820b3a.14.1729259909618;
        Fri, 18 Oct 2024 06:58:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:ad3c:ece1:18ac:9bc9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f16sm1448482b3a.40.2024.10.18.06.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 06:58:29 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	support.opensource@diasemi.com,
	linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] watchdog: da9063: Do not use a global variable
Date: Fri, 18 Oct 2024 10:58:20 -0300
Message-Id: <20241018135821.274376-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Using the 'use_sw_pm' variable as global is not recommended
as it prevents multi instances of the driver to run.

Make it a member of the da9063 structure instead.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes since v1:
- None.

 drivers/watchdog/da9063_wdt.c   | 9 +++++----
 include/linux/mfd/da9063/core.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/da9063_wdt.c b/drivers/watchdog/da9063_wdt.c
index 684667469b10..69f884cf1a7b 100644
--- a/drivers/watchdog/da9063_wdt.c
+++ b/drivers/watchdog/da9063_wdt.c
@@ -27,7 +27,6 @@
  *   others: timeout = 2048 ms * 2^(TWDSCALE-1).
  */
 static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
-static bool use_sw_pm;
 
 #define DA9063_TWDSCALE_DISABLE		0
 #define DA9063_TWDSCALE_MIN		1
@@ -230,7 +229,7 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 	if (!wdd)
 		return -ENOMEM;
 
-	use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
+	da9063->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
 
 	wdd->info = &da9063_watchdog_info;
 	wdd->ops = &da9063_watchdog_ops;
@@ -267,8 +266,9 @@ static int da9063_wdt_probe(struct platform_device *pdev)
 static int __maybe_unused da9063_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
 
-	if (!use_sw_pm)
+	if (!da9063->use_sw_pm)
 		return 0;
 
 	if (watchdog_active(wdd))
@@ -280,8 +280,9 @@ static int __maybe_unused da9063_wdt_suspend(struct device *dev)
 static int __maybe_unused da9063_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdd = dev_get_drvdata(dev);
+	struct da9063 *da9063 = watchdog_get_drvdata(wdd);
 
-	if (!use_sw_pm)
+	if (!da9063->use_sw_pm)
 		return 0;
 
 	if (watchdog_active(wdd))
diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
index 8db52324f416..eae82f421414 100644
--- a/include/linux/mfd/da9063/core.h
+++ b/include/linux/mfd/da9063/core.h
@@ -78,6 +78,7 @@ struct da9063 {
 	enum da9063_type type;
 	unsigned char	variant_code;
 	unsigned int	flags;
+	bool use_sw_pm;
 
 	/* Control interface */
 	struct regmap	*regmap;
-- 
2.34.1


