Return-Path: <linux-watchdog+bounces-746-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CA986B721
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 19:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8D791C23BF8
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 18:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB05340864;
	Wed, 28 Feb 2024 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b="xnM34M7c"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A2020DD5
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 18:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709144882; cv=none; b=Sc3jxJ9nFKKcYmt3XvEKLC7GP/+ZcPDurKMXxl94RwSStYDAisJXWb7DF4c74elRTvIO43qBl18POhIBLcZMr0C67M0TkcPnMp3kMZQEa6SHyoAeL97cxkCOs33aY0kV6FrxxeyqBmEpXo+AwxVMgfALshEGCVYoBadaPIJp0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709144882; c=relaxed/simple;
	bh=k4xyia0piuIcKuFqrg4Vvg1MChuit3EZ7ASf2pglsMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dvIf/6Nmr2z254PkjuI6BgS2EjNWEETDN/OBD/qXyTIHdM0aoH8J+jUKNu+mKNSZURQDQGoCOq7XJ7z2G5RtdJKFJhzvDM7YTRFnsCzzwhJslN+uFSwJbVVY84ccHvVYKVKtg24iUszxP0qeaKJlIC09agcS5latVSX7KySyL0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com; spf=none smtp.mailfrom=hefring.com; dkim=pass (2048-bit key) header.d=hefring-com.20230601.gappssmtp.com header.i=@hefring-com.20230601.gappssmtp.com header.b=xnM34M7c; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hefring.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hefring.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso122409276.0
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 10:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1709144878; x=1709749678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1KPzXNNkHhE7yYlv+hV5FrLPYFNCzXyE0ge4E72Xc=;
        b=xnM34M7cCjaHquzBGHYfE/gb6Zi719cfhzCqjktyCvCcdKHeQVQJdZXfRRaTSAXILF
         /SKByzv5s5E5/xhLiUNRqjceyUwGSaxsb0IlfxHCfPXkyqjP9dBTgvZs10XxLjvw4Kh1
         ljWVTGEZKJAGjOFYty7jscH7p9Dojk/SosUjD1owQ9qHlquXazMf1bWEMAn/PT6KciEP
         o0Skd2unAC7+05nVXyj3Dk44L5ti54dtGLTsOjxHH29FotSPb3rqznup0ZAFLpp2wrJR
         ECQn/65BeKjl1/3IsbUzxCyx9PTN1eD4BBzX5qqDTNYiIo/Wzt9hP56yK9BpNZ/JVovH
         Hidg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709144878; x=1709749678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF1KPzXNNkHhE7yYlv+hV5FrLPYFNCzXyE0ge4E72Xc=;
        b=Vn7nLLMY3TvRzkON0LstBc6f8VvmfPjIzGqMe6HGyQ1aIuhLwv1Loh2twUCczyvjWH
         zzVDVAjL+duoqGcNpW7oYkObBJRkBBnIKP4OgY5+k1Ih8IJN8afoj+/C0E0Fi1lY2Vk9
         O+c/gGREZs8FZI1mt/Q3khmDrRRGTZPqxZ8t1K+gNX8aiZW23fsxtrhbthxt0+iqVFm4
         xv+kPd/yBq/lO55QzmRNSJxxa25rrgCI5AHCMERHk8ncNHvYM4uqEePqSqKXZQSGXWy6
         wBH+9H9UKmhMKX5E4chCtS1TwcoR88S3ZeqoejYaHxTDqSSHejWgWB82fgnyrdAA/ysq
         OQrg==
X-Forwarded-Encrypted: i=1; AJvYcCUgOu21jXZ+DreyTltIkpeXruCAw3Ac08MKBjmTe3iVSkVT1keQlNGLGftwubCEg0nEigL9Xd0gveZNzioXOt5POGNArwaC7+RiJ+XoHsA=
X-Gm-Message-State: AOJu0Yw79OhroCGIXlC8V6bQziPiLhR6LOOOgKc29xogwBBjHf5AhT6+
	algaiXUJcPZQnKKglb8bAmFnKtQi8PZ6CydW5uxzWGRYwyn3sQm4HhlLnK9TKpVDbsrY2/GvkkX
	D
X-Google-Smtp-Source: AGHT+IGGIUcPNLaPDD97/JSUYoRXanewPna4Nbjsv7a0TEzYLDOhtOT2egjmszbqhcM+oGhhhvzNHQ==
X-Received: by 2002:a05:6902:136e:b0:dc5:f51e:6a60 with SMTP id bt14-20020a056902136e00b00dc5f51e6a60mr22948ybb.6.1709144878346;
        Wed, 28 Feb 2024 10:27:58 -0800 (PST)
Received: from localhost.localdomain ([50.212.55.90])
        by smtp.gmail.com with ESMTPSA id x4-20020ac87a84000000b0042e390c9804sm8355qtr.6.2024.02.28.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 10:27:57 -0800 (PST)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@st.com>,
	Ben Wolsieffer <ben.wolsieffer@hefring.com>
Subject: [PATCH] watchdog: stm32_iwdg: initialize default timeout
Date: Wed, 28 Feb 2024 13:27:23 -0500
Message-ID: <20240228182723.12855-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver never sets a default timeout value, therefore it is
initialized to zero. When CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is
enabled, the watchdog is started during probe. The kernel is supposed to
automatically ping the watchdog from this point until userspace takes
over, but this does not happen if the configured timeout is zero. A zero
timeout causes watchdog_need_worker() to return false, so the heartbeat
worker does not run and the system therefore resets soon after the
driver is probed.

This patch fixes this by setting an arbitrary non-zero default timeout.
The default could be read from the hardware instead, but I didn't see
any reason to add this complexity.

This has been tested on an STM32F746.

Fixes: 85fdc63fe256 ("drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe")
Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
 drivers/watchdog/stm32_iwdg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index d9fd50df9802..5404e0387620 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -20,6 +20,8 @@
 #include <linux/platform_device.h>
 #include <linux/watchdog.h>
 
+#define DEFAULT_TIMEOUT 10
+
 /* IWDG registers */
 #define IWDG_KR		0x00 /* Key register */
 #define IWDG_PR		0x04 /* Prescaler Register */
@@ -248,6 +250,7 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
 	wdd->parent = dev;
 	wdd->info = &stm32_iwdg_info;
 	wdd->ops = &stm32_iwdg_ops;
+	wdd->timeout = DEFAULT_TIMEOUT;
 	wdd->min_timeout = DIV_ROUND_UP((RLR_MIN + 1) * PR_MIN, wdt->rate);
 	wdd->max_hw_heartbeat_ms = ((RLR_MAX + 1) * wdt->data->max_prescaler *
 				    1000) / wdt->rate;
-- 
2.43.0


