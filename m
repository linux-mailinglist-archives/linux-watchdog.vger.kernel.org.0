Return-Path: <linux-watchdog+bounces-2729-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF924A144B6
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 23:46:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5088C7A3C50
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2025 22:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB57D1DE2CC;
	Thu, 16 Jan 2025 22:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="btL1FThx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83711B4F0C
	for <linux-watchdog@vger.kernel.org>; Thu, 16 Jan 2025 22:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737067570; cv=none; b=C4QmvKd4IzBAw5LEHRlu40NH+59lNghNzGQvP++LVrHobTV1nx9WZOUD+Q0u5HokFfwdSwbsTS9D6+epJ2kcinthbxSuyEN2fQeNFzmb0Y7m7iEkH+ZNRmTCyg5U6VjI65+uWklzwYlkXHi/UlmxGuxc6BFJ2YItU5tLVtIymUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737067570; c=relaxed/simple;
	bh=c+HBWu687+WEKdvLXDm3514Q8jhP5/R+MI5dYLs7opk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcejmHJBHWkUe+GeKqaLmyylwETCdfeDBpCG0gf9ea/ARLM1cnc3c33rtCGQ0ihMsYpXg56/LZQVwnoT78L0lMSewDScH6xEdXjJYZ+u3swGtuz83zUQ3ViLZbYeVyI4y6XuJvfzFpijov7/GkhaPoLLGNuO9HSCymNUSSLfaxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=btL1FThx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2162c0f6a39so51036865ad.0
        for <linux-watchdog@vger.kernel.org>; Thu, 16 Jan 2025 14:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737067567; x=1737672367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vNXzWEgJPL/lLJ3+6ZDIxk33qGNZqwz3zDtaJT4T8wU=;
        b=btL1FThxM3NzSqueZVIGIwJL2VSqxbluFy/wQoFEqO0+HyAvO8q5SWNjkwerwN7Ipp
         W0ScVah36p08uzmzpjv0X/mo+OEydgQcOb4clJt08DGtgFQnQD8mQhXrlGMR4IIYZSCJ
         7Mfjf4vjH1sfST8CeS0+1zOkiV+rlawpIu/9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737067567; x=1737672367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vNXzWEgJPL/lLJ3+6ZDIxk33qGNZqwz3zDtaJT4T8wU=;
        b=NRPWt/9vWOX/V7ccOs2Iyj1WzY2QOTB45mJNyHFAd7Atgbh6g8nVfmhrxMCh9PaySw
         JEWE2cMgzLsRhRfs0iOEInEwAqgGDPh5geUkNSITC+dfiawXmF6RL6aIzW4BgEXTnTp9
         o0OlvcEqMYeN/1uFJCK5zP/uLOpXEvAEQr90ENuXHYW+tlDveYu+RqNU6d50LIpvx/cu
         vmAcif+3h3tU0JYam8YX4zHlt94CRmN7RHtEWta834nvq81cOSxVlHIqmqUD6AT+3Lqc
         exxYpHM+I/HiURuWa1vR9jPip+0y9oofF0B0wqC9bwD3jzVlSfZYD+OM/C/GlvTj1H9a
         aMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUqgSkqtobjfbJ4JTHSld0wXpc5xWfNmogPF3nToStw+kaB/Mnd+Av4Di/UI6W5Gi+xYivxSoAmLjo+zaBZfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEwKmql/iAfYFr/meveRqkeZ7E12/M6XZrmXMDSBwreS6VcX+q
	Pjb/cOjVV8VJmyOQdehOZ3MUsAvV+cYHhWa1HIFAp4gXN5+PwGtoR/RTKJ1T1w==
X-Gm-Gg: ASbGncuP9S99gk4C68cGINPJYEqA3WcesJzYv49Ro6oZs6UNZWxi1tnYXWtGuTYM4/A
	atkTno45Gf3/6GWid0EDHZkceauSQV3uhf+iIQtCXCtAUyDXAALNTSjGVaMS0hTXNH9uLnfg4gf
	slze2hKz+4YZgoOFQUc6q/CLe3bWL9cYbOoGZm8tc9SzdS3qG8J0d3hbJnKZ+hPf/xF7XlcKryi
	+AZaiPKwiB6Hr3cq+HbUptqfnXBKOtSJkBoTJYwATKo+p1aECqVGp9NunLRLKJp4VbPpEYwC2wQ
	D2W3hv+kQWBYxBGlT8uYXrekfIg1Kr4mig==
X-Google-Smtp-Source: AGHT+IEEcYdDNcwVDoUsZ04wTmaoY1a9RQqIAv+Dv/a9lgAS+MG7jy1BOJNtfWL+Yj7Uawd1h3v+9w==
X-Received: by 2002:a05:6a00:1d12:b0:728:15fd:dabb with SMTP id d2e1a72fcca58-72db1c5d820mr509975b3a.8.1737067567088;
        Thu, 16 Jan 2025 14:46:07 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72dab7f07b9sm536780b3a.3.2025.01.16.14.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 14:46:06 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	linux-watchdog@vger.kernel.org,
	Lukasz Majczak <lma@chromium.org>,
	Benson Leung <bleung@chromium.org>
Subject: [PATCH] watchdog: cros-ec: Add newlines to printks
Date: Thu, 16 Jan 2025 14:46:04 -0800
Message-ID: <20250116224605.110870-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add newlines to printk messages so that the next record is more easily
readable.

Cc: Lukasz Majczak <lma@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/watchdog/cros_ec_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/cros_ec_wdt.c b/drivers/watchdog/cros_ec_wdt.c
index ba045e29f9a5..716c23f4388c 100644
--- a/drivers/watchdog/cros_ec_wdt.c
+++ b/drivers/watchdog/cros_ec_wdt.c
@@ -58,7 +58,7 @@ static int cros_ec_wdt_ping(struct watchdog_device *wdd)
 	arg.req.command = EC_HANG_DETECT_CMD_RELOAD;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to ping watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -74,7 +74,7 @@ static int cros_ec_wdt_start(struct watchdog_device *wdd)
 	arg.req.reboot_timeout_sec = wdd->timeout;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to start watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to start watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -88,7 +88,7 @@ static int cros_ec_wdt_stop(struct watchdog_device *wdd)
 	arg.req.command = EC_HANG_DETECT_CMD_CANCEL;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)", ret);
+		dev_dbg(wdd->parent, "Failed to stop watchdog (%d)\n", ret);
 
 	return ret;
 }
@@ -136,7 +136,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
 	arg.req.command = EC_HANG_DETECT_CMD_GET_STATUS;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus");
+		return dev_err_probe(dev, ret, "Failed to get watchdog bootstatus\n");
 
 	wdd->parent = &pdev->dev;
 	wdd->info = &cros_ec_wdt_ident;
@@ -150,7 +150,7 @@ static int cros_ec_wdt_probe(struct platform_device *pdev)
 	arg.req.command = EC_HANG_DETECT_CMD_CLEAR_STATUS;
 	ret = cros_ec_wdt_send_cmd(cros_ec, &arg);
 	if (ret < 0)
-		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus");
+		return dev_err_probe(dev, ret, "Failed to clear watchdog bootstatus\n");
 
 	watchdog_stop_on_reboot(wdd);
 	watchdog_stop_on_unregister(wdd);

base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
-- 
https://chromeos.dev


