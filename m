Return-Path: <linux-watchdog+bounces-1469-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAE694C860
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 04:08:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30F50B2265E
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Aug 2024 02:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F4C10A1F;
	Fri,  9 Aug 2024 02:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AxgDpJst"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED67B17548
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Aug 2024 02:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723169324; cv=none; b=SnmLRjEfWH3YhzMCT6nKA7ULYXQwiMVd4dmc+KUl5hBD+7QRVre/HiRnXhPu5Th2Mw43GdsDJ3PbOiTb/PZtVkYg6yEaGukWn2lg9w9a9wQaMPlwT8lIAZpMXBy0h/0xU7JmD3l8hg+5VGYxdW/qZk3jMkSPo77XrauyIF2ldFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723169324; c=relaxed/simple;
	bh=d1ewU+9RiQ97z8YJQgUpybfUfW9iq0BqSlv6sf7cU70=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PeUxsLJjKPl+LHyU49zVlsD7SUPzPyPtVh1nF3C2cEJxjYGeO1+OTiNdewv6WMyEMOuEv42bcIXJme4/rgiJUfKTI3wbHEwZNNIALKhO+DsMCO0WlGIypPhbmKc8e4NdulxMHVo9b+9hjYfR9KE9qBFnXtU7JSWdtuobX2GKbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AxgDpJst; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2644c1b07b1so120699fac.1
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Aug 2024 19:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723169322; x=1723774122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1G2DT4D6f+0grCLFuu/WTOqygdTNqUcbm73whybAszQ=;
        b=AxgDpJstYl50TpL0mp8/Z9q2OR5TkF+LR6y3aAPAvxBR2ycuD9mZNyIfNEWWSgi7mV
         QPioW+9J14dBEsNuyPVJ9Krybik1fznWEzG+h0/olngdgOguILbrMbFW9itJxzlsHgM9
         cXFMCIuMu9JW4i83hBbbQRvpq5G1A3YOHoJawBuysFHNMLicfMHQYouuIvPwsvDrnb24
         07SkgImMt89xJzJPjncKdBG8vHYZetwlWCPceZSIu9XOBXEPIk4I+VggcKJFNPf0sN/x
         51dY0lYDXRsbUzfT0ak7Fd660D8JrfIdG2gHU6c+lPFjZgiPJJqBz3AdJhxsCjGE8JgC
         j2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723169322; x=1723774122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1G2DT4D6f+0grCLFuu/WTOqygdTNqUcbm73whybAszQ=;
        b=JVoq5tguhnq+jtPlobF7ReluIw+zWd/IlKafv3eYt7vlDTRz5yqTcpDd1vZ/2Ujluo
         gXIlN4C1xbpOt96MExW8sdaKHMEpgZjzj9QYqikbbQCXO9tIbMp1V3rNag71sPmICFaL
         ObY45+S4sprXzfdfY5/g8QUXKIsd2CSFCPqiEHrpqrg+YlMnzmFnvQp//226MXa0CEbe
         djQhjiXcM6dTD0tGQAok/kV6oe2dCk/sBfJVd8ZwKi0PR6uIZKSoPsVyH7wjjakOFpTj
         GdACfefDl3IfTICX1XU18Q5bbS7TNthUW8pGVHDiOcTgzipTVOXs6EfDFgZ0tayHOzV4
         3mwg==
X-Forwarded-Encrypted: i=1; AJvYcCW41qW8E1MX6IOeXesPF6H4wHVWtr7DQ5lOCu0bnXwX4w0ibYavElt+72BBTi0TZ0X8P/PPMimetrRUf6Fl7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjvzuNNG6NV/n6D5Kw8E3OKX8Y5XavqfWblP30Uaj4zX4SUZb
	rCgL1ulXoUXlL9WRHqnTrcE/qjzd9H7AOtAHvojH1zKygG9HKkV9ZdAADQ==
X-Google-Smtp-Source: AGHT+IEw/vkE8ghnhjtyL3fpNRtXvIkUByEmgT2v+M1R2Mk5zhXqv/1SqzTQXHTZvpNcfExzv5uQ1w==
X-Received: by 2002:a05:6358:70c9:b0:1ac:f069:c64e with SMTP id e5c5f4694b2df-1b17725f7a5mr5600855d.5.1723169321878;
        Thu, 08 Aug 2024 19:08:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:d689:1e02:dd79:b72c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b763562924sm10407746a12.33.2024.08.08.19.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 19:08:41 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: linux@roeck-us.net
Cc: wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] watchdog: imx2_wdt: Remove __maybe_unused notations
Date: Thu,  8 Aug 2024 23:08:21 -0300
Message-Id: <20240809020822.335682-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to
handle the .suspend/.resume callbacks.
    
These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use __maybe_unused notation.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/watchdog/imx2_wdt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index 42e8ffae18dd..4b3a192ee3e8 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -379,7 +379,7 @@ static void imx2_wdt_shutdown(struct platform_device *pdev)
 }
 
 /* Disable watchdog if it is active or non-active but still running */
-static int __maybe_unused imx2_wdt_suspend(struct device *dev)
+static int imx2_wdt_suspend(struct device *dev)
 {
 	struct watchdog_device *wdog = dev_get_drvdata(dev);
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
@@ -404,7 +404,7 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 }
 
 /* Enable watchdog and configure it if necessary */
-static int __maybe_unused imx2_wdt_resume(struct device *dev)
+static int imx2_wdt_resume(struct device *dev)
 {
 	struct watchdog_device *wdog = dev_get_drvdata(dev);
 	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
@@ -435,8 +435,8 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
-			 imx2_wdt_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(imx2_wdt_pm_ops, imx2_wdt_suspend,
+				imx2_wdt_resume);
 
 static struct imx2_wdt_data imx_wdt = {
 	.wdw_supported = true,
@@ -476,7 +476,7 @@ static struct platform_driver imx2_wdt_driver = {
 	.shutdown	= imx2_wdt_shutdown,
 	.driver		= {
 		.name	= DRIVER_NAME,
-		.pm     = &imx2_wdt_pm_ops,
+		.pm     = pm_sleep_ptr(&imx2_wdt_pm_ops),
 		.of_match_table = imx2_wdt_dt_ids,
 	},
 };
-- 
2.34.1


