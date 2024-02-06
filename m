Return-Path: <linux-watchdog+bounces-595-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215AB84AF46
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 08:52:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 447501C22978
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 07:52:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2D712B160;
	Tue,  6 Feb 2024 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cw0/9nYB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF79612A157
	for <linux-watchdog@vger.kernel.org>; Tue,  6 Feb 2024 07:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205934; cv=none; b=ONDfl3RD2cLFBSzfHSHAGIqqec+l2gbbD8CVTuLGBxol7K8SJzewzgcgnaIPoJeAQWFNgZijhgmrwqai7mdoNQN+FBgFJktoJM8fGMo+1UB749Y9QBeHN1JuWF9TWDdSviuWA5qpWuwo+YMNHaBB9IxCorUk0WQnyjwTeDopNtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205934; c=relaxed/simple;
	bh=iY4Nq0gmeNoMpaiXAPg8UyiEeagDbHOfI4LQk9pKbUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kWcT/Chl3efsb9TnzTCQ+Tm1b4wNZcdBrfSco5fAOze/Bd4We7+1JwxTok6o3wiZKdnEwqlpWQwxTcHjKQ09OUnWU7Rwhio8cpthbsElB6dcHqx6bHvtKq3wwjiC87Z/3UdE2scmCzrStd82jtNHLXGztj3DYnCkJ45O9XPyTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cw0/9nYB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40fc22f372cso41241685e9.1
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Feb 2024 23:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205931; x=1707810731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Re6g7QbwuG7CNxQRWc79B5kKgna8Uj7zWIgOl3cniuA=;
        b=cw0/9nYB6Rfto3zX2hu8hJXLdICVs2i/t5e6PmwC7rJJX4kyZMOenC/u3NTw3TXmzd
         2Fo9coEi9cQtnsdW7dY13PVyjJ8ldEdkAK+JKVZECBJ4nm4TA8AykNe9nuFnu2JPKzDh
         KCJgMTAPfM1Bps+fWP5li08CY3EJhlxNYMLMf34254PWo2DqY4NmKkAHGyfNVONLIY/b
         hblMY6LMwN+smpMuHNySVMpxEUz/PWAZ2j6WU0SsdeqXz+W/bWTVIlMQz9cNRtA1NHOQ
         fL9MXWZumfzMyz8nx3qyEYPlArgQ/aVt0wUHfXnYOLn3xH6if5uFyM/iTb5G5dK46/+K
         ExMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205931; x=1707810731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Re6g7QbwuG7CNxQRWc79B5kKgna8Uj7zWIgOl3cniuA=;
        b=VmjNgWDzZ1afdCU9WHCEvbmKgjOCzeU0Ws2c0jp9rTweonY3KeP8HP4mffNUaiiBBa
         tqhiQMHXdq9WO1kHjCEwnGMz0oMEDP5UI380xy0NzLWFy6EU94zB+PRy7HPwuOUZG1I7
         5gb7xzveYl+fmvVbcU68UAJkUKw/9iLqHGOQQbhhxBFRg9snuMEzyOB/ixnvgy5Fbnrx
         BOnue697OWtZyT0oCQk3zdL1ko0U2QmjlkcTEIoQ4BqyrEDT3SHYHz/p3QQbUg4PG7QA
         j6etrIcJ6Wvh3n+rPKRggTreGEebJGxYwv0e/f5M2oSliEx2B88dy8rWBa+uYxn6itWd
         Vjtw==
X-Gm-Message-State: AOJu0YzcE6OleVacxR3vJKxtWg0NOuuZgM5uvCUMctLSKdzNeSbsU4PV
	ptYQhE/v31EF5OeVPvSfdfhTiFuok9GmomMaVhlQNDvwva14Jb/2NZRraEAXW4A=
X-Google-Smtp-Source: AGHT+IFUwO5jVJRIRFN3OtH6ZcdLi45uIOaSjs6QmpuzZuPbtPalHg0jI02tYrQQJSgPijB7h9Exng==
X-Received: by 2002:a05:600c:3c97:b0:40f:cb0d:a44e with SMTP id bg23-20020a05600c3c9700b0040fcb0da44emr1034104wmb.9.1707205931238;
        Mon, 05 Feb 2024 23:52:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWoSIcqKjoanSWxwphMlxu7ln46eqk3ZHWmxw5kPc0ytMMrDj+G1cvjlpMW2WUZIONlpZR/K/et1+AFj2qjFc/eQgpImL6b+QnuA5cEKWB3RctoRIxxIOx3UrwqWVuwS26Q727uwOtVH4iYXd7VLVpcBuOp+z+nN00Veb74MnqJr7BybLLxb3vloETJMbb6R/lkqxQnMD6fqFsyCDNGMi0TmIHCAeW7G66sXigDahSIEaDE5zLLA1/LxpQs6s5sQL2+5Vjx+Kb1yLmUCSOgLBBwUldO7EgcCA8/qBXoQtuqlIqTnqpr9VT+yPNkKRhoXZrfMKpSa85WMZ0gx8crtbT4ZazCl91bh+MN3ofHl4xpc4ZCA3ndyHBEsHy9bKHpWgV36hoKI6kRukQmDmZSBCadvVFaI0rG4ZPJq1J6ckY++80T1RSlPC9XT5FDL0mLMOh4O5IKyr6MnvvdWHtvLM/O0d/gkLslCzdMizm8osF9ApW3CYmJ1GpBzGMtIUoZm/zGjpPLLicpYQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:10 -0800 (PST)
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
Subject: [PATCH v4 3/9] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Tue,  6 Feb 2024 09:51:43 +0200
Message-Id: <20240206075149.864996-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240206075149.864996-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

pm_runtime_get_sync() may return with error. In case it returns with error
dev->power.usage_count needs to be decremented. pm_runtime_resume_and_get()
takes care of this. Thus use it.

Along with it the rzg2l_wdt_set_timeout() function was updated to
propagate the result of rzg2l_wdt_start() to its caller.

Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for RZ/G2L")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- propagate the return code of rzg2l_wdt_start() to it's callers


 drivers/watchdog/rzg2l_wdt.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 1741f98ca67c..d87d4f50180c 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -123,8 +123,11 @@ static void rzg2l_wdt_init_timeout(struct watchdog_device *wdev)
 static int rzg2l_wdt_start(struct watchdog_device *wdev)
 {
 	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
+	int ret;
 
-	pm_runtime_get_sync(wdev->parent);
+	ret = pm_runtime_resume_and_get(wdev->parent);
+	if (ret)
+		return ret;
 
 	/* Initialize time out */
 	rzg2l_wdt_init_timeout(wdev);
@@ -150,6 +153,8 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
 
 static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
 {
+	int ret = 0;
+
 	wdev->timeout = timeout;
 
 	/*
@@ -159,10 +164,10 @@ static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int time
 	 */
 	if (watchdog_active(wdev)) {
 		rzg2l_wdt_stop(wdev);
-		rzg2l_wdt_start(wdev);
+		ret = rzg2l_wdt_start(wdev);
 	}
 
-	return 0;
+	return ret;
 }
 
 static int rzg2l_wdt_restart(struct watchdog_device *wdev,
-- 
2.39.2


