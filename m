Return-Path: <linux-watchdog+bounces-737-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A547986AA04
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 09:33:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 358E4B24C46
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Feb 2024 08:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852972DF9C;
	Wed, 28 Feb 2024 08:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kBsH59A9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF052D60A
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 08:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109202; cv=none; b=AtVtDvC+zogqZ6gjChp42nsU8J8YuWQm84kZh7ZzTRXecmKGYKqacKqe/5hr9rJGbskrHtOXwYTu/Bvw7z5A46bLk9LF/Jqx65tlenQkaEfG4qO3oSUgbBYGhWWvaohwPOJsj2y9H9mbbfVGvZCx9XtoJHq1gjUFdoARklPh8mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109202; c=relaxed/simple;
	bh=2iaYjthGV+4YN90lhEWZi3Roao8D27ZIeW/fg1E7/vQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ju9uzuucqBSsjTornTpyyUC43+6AuPdtSKjqRw/cjehmo+DOC+GJ5vxHsTUygnERl5lnKnURss7G9Q+LGE41nYT8rt98t9Yq7ETa3KVSZtZI1UEaggwR7lkEVFoYvYlKzbhDqFTnw1cUFO4lKf8hcxhAsRPqn27yy8E2sRs2IuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kBsH59A9; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3566c0309fso592908466b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Feb 2024 00:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709109199; x=1709713999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=kBsH59A9Ha6haJTBlwWotfxsIq6Wta4aGKin1c8WvrKBgMxZxPI4MMY+fCDgM7gr5T
         F4wKqnwSSPNRmj98C7neZE8QnsnGscQrSG+9W1RjrHnDPdPPM7K5nDyhiWAybv5ND1hq
         PdGNKwj1xUCWePnknpnz1xzzVVag3AjkIpBp5qsMnZrt57ZaDyfZFnokiOhO70IHMbd0
         NxbLGpneRC2rQkewSpFAGPv4lZvslv5kRK0g36fikmrbx4r1BEbKiAUKPRTiysJS6tBO
         kiyZPMBLRkZNXSWiMPIEbLDB5yz/4L+fW3Z2bnb1N3BMekNSuyOqokpf/kxgGvQr6beC
         uEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109199; x=1709713999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJkLrfz+B+TwXIL3E5Ouq4pIOb3ww8iGVXCK/i9BddI=;
        b=uiR0wtb9MKqaxV+c1nj83PbBRQ/EwXKCHAWTSVlpNTOE/vHLcyGRLMLvWmc1jo0Fsa
         K5VKSfIR56kLc2i3Fjj6qPJWFvUjlHlFPdkkBKnLHdJ6k8cng/eBeukZQ/bcj0Xty8ku
         GvqQFq12eIqHxXSEFWzE3w4xrx817Tlt+2imhOkOnjhGj4sT6hJGrB45i9uEXBOLj4g6
         IbbZ27gDhTN6DHMQZtlyZi8HSiheQMYyMJ9Nha2YdhZqQ1fxAGZC1swrdtc0mkWqipOR
         AbLCfl5tjDVbHIKg6a1dRIhXN1MpqR79CXkklsVfSBbZbRE2Eu9w20R4kmYuSAphZIfN
         RBxQ==
X-Gm-Message-State: AOJu0YyT0WfG7Sz9Teq6JY1WxhK++gt8D0GPJhFgXqsBhFrC38vXme68
	olQBg8+U3FF5LUAfgqgjVq160ptjdqtCEbR+TSOQ0LBPZ7m60phxhVm0cFlhPiQ=
X-Google-Smtp-Source: AGHT+IFpb0i2tShX+1lqnqbrhgMgaFsffBFNqtKDB/+qR7KWz8oChxGcG62ueOZzHsIZ/A0OpQl47w==
X-Received: by 2002:a17:906:af8a:b0:a43:cebb:7245 with SMTP id mj10-20020a170906af8a00b00a43cebb7245mr2181635ejb.74.1709109198838;
        Wed, 28 Feb 2024 00:33:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.83])
        by smtp.gmail.com with ESMTPSA id qh16-20020a170906ecb000b00a432777eb77sm1593987ejb.60.2024.02.28.00.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 00:33:18 -0800 (PST)
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
Subject: [PATCH v8 03/10] watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
Date: Wed, 28 Feb 2024 10:32:46 +0200
Message-Id: <20240228083253.2640997-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240228083253.2640997-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

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


