Return-Path: <linux-watchdog+bounces-1666-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4DB968FDA
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Sep 2024 00:45:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DD16285F76
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 22:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF084187328;
	Mon,  2 Sep 2024 22:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDeQuKzB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4055717966F
	for <linux-watchdog@vger.kernel.org>; Mon,  2 Sep 2024 22:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725317112; cv=none; b=O7TFdQk8B1khpqAemrNpfVXb2zVV2eHV1ziGC15HZXZLdzDlrNx/CIBs+StnsosO6IVkhtOSu2yqnuamUQ6rK0jHfYnnzrT8IJrauQMC083FS5HzN0kgDoetxHItvRJHzIs3iM54qf8j9XpTvRkWnO25R/cx+5Nncr45KXdSmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725317112; c=relaxed/simple;
	bh=LcV9XXNqHVtFYOFzgD9wLNzk+zeeN2LEPcCArJZjl6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZLdPlReZN0drXW+G19rv60KxyBZQQKAmKOjLVWhXgIeFQK4O2UVsr7nRcgWWokfHXUFZJgOSHkHyvKLWIogk6aRA7gSbDelYxd95DgNWGXZHGWodfPQgbpnXVBzKsfU1X6fc67kF86uSLG8bqlf8dN6GBn7d6xD20kmm0nKFMxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDeQuKzB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-205909afad3so8488215ad.2
        for <linux-watchdog@vger.kernel.org>; Mon, 02 Sep 2024 15:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725317110; x=1725921910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqZF9RU1oIHiSZm7/fyAIZg6NphkBtgm/ydqIIrW19Q=;
        b=UDeQuKzBWg5QYG2xNvsCCsx9w7HeqpKngeuUpWDmPvbRjDO+sWHv2fkg4yfyTaXYSV
         04av3p4zrIZui6q1Mrrd2Z5TCTnIN1/g9AKdsWb2W8V8qo042psk+WhIVRIJRv3Ewx2o
         Be2tt6Fi27jvNCzaI5SA4FLBhOxg7GbmBQFTCqWuJiCHTHCLKpM2Q2VQu1WHoHAI9rrg
         nqPMH+ubB/xLJwBVskm9GbvGn1XbjS1L66/1YhF+i8LOT3aKUDYcWFeNjx+I0hbBZnfr
         O4ByhQDy/Hse5CjHCHacqLiVNw75MGwT3cKLvifB2IiI+cXBMcaLQtxxArkewWYWj8cl
         AJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725317110; x=1725921910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqZF9RU1oIHiSZm7/fyAIZg6NphkBtgm/ydqIIrW19Q=;
        b=pzU7gm241ArVeR9+BoC9lpTPEgD9p9R0dT2u4pcRoFMHY/uqSR8Fj/dePiCpmn1zZY
         z3/AlkhSfkV7Fpek1aVWWeews5nXEEsVPD/JntPAzWnd/X02fByO5r5KafHVXZYJ+/Fd
         0sbTGmOrZGoW13OMfLVlkKmbT0M/kCRxN/3hiw6tUafbJ4jIQHE8+FxSkk8G1mKjjCEx
         A5O99EprbWEfmV0cb3mqVvGxmKTTM8+TBE64i9cl3Aos/kVEK920SZgkRGw2Vn7tYpw5
         Y5Z+5yl2OhVOR+qxr06Sivc92TAmArKCxuUAOWrxkkZED4r8andUSZtV6W13Dp1TkDqm
         TOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCW81MXLhYhbMUlLxVaxbtvLrLjTkeKijZpI/+ZaiyLjUAtmN8YTsM4fYNPMRhwxd8njWi+qlH872JAf2h8oWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzgaUo6Fh71ijSvuVOFfRvG/J9S7K0KD/RjJC7TnDqq4TMhLPSy
	iZTfcMURJEdyIJYy14+iTgHlgnI+qk8gvrpvCSzHZv/Rs8IB/Ubs
X-Google-Smtp-Source: AGHT+IEA0YcwuNUgzZdl0v2XdSUjWGu9mjPxrX2+RaUi5FgCFMtNaIGBSkEkZnZh8VJF81vaKpIqfA==
X-Received: by 2002:a17:902:ecc9:b0:205:3450:cdc9 with SMTP id d9443c01a7336-2053450d170mr116987975ad.36.1725317110366;
        Mon, 02 Sep 2024 15:45:10 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cf4e:c868:4347:e635])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2054b9f2063sm39634355ad.75.2024.09.02.15.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 15:45:09 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: support.opensource@diasemi.com,
	linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] watchdog: da9063: Do not use a global variable
Date: Mon,  2 Sep 2024 19:45:04 -0300
Message-Id: <20240902224504.1012750-1-festevam@gmail.com>
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
---
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


