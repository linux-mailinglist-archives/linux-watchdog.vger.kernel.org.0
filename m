Return-Path: <linux-watchdog+bounces-598-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB7684AF52
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 08:53:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50FB9B22E5F
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Feb 2024 07:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADC012C532;
	Tue,  6 Feb 2024 07:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ftrDgpui"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21812BF02
	for <linux-watchdog@vger.kernel.org>; Tue,  6 Feb 2024 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707205940; cv=none; b=uAQSN2rFLDfIEgqmi4uHrRrx9lyRQ5rwbkdLBlQWSiK+xQfaUB4G2V3Pc25SzrYn0/3G1GLaGeTOWBMVH9KjGZRtnUVwUTNNOckNMLjGYvRGs0e1lgH2/8HQav91oHuKoedNyfzl16T7IxwCmN7JZrlvX0ASOp+TSYWYlhkdGrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707205940; c=relaxed/simple;
	bh=orreljjYFXCp/zt5Wm7smk5iCuPfvW/eAvi8Jm6wHkY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CUfTxVJrlkTEaKNH5f4lMNGlbMYpP94QjSfDyOmd8vh3VdbHuOzLxtTijZ6ea7TRa7+OmAR3VnhfSbzf6ODrTFvpbHlLcvZkI8zKzfDs9cLw/FSKngPzz0ChZcZvCWyrpbcfmTEQt4HfebZUEJmChSr20O8w7rv7yIhWIl1qr7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ftrDgpui; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40fe2d3d5cbso2461835e9.2
        for <linux-watchdog@vger.kernel.org>; Mon, 05 Feb 2024 23:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707205937; x=1707810737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jjkb+6k/ccop6hFf25bQpwkeqZygRT9Wmt/Bq+56nWc=;
        b=ftrDgpuihUOHTX5ec3XOeoUqpzH1jLc2Y9ltSX6F1dXXF+Cri5eq6FLgFQW1LKTECf
         h5dfAHWG+tjsy1fJVy3+ZNE5ZugADC5vbf1nogygIn7sRA0SccA2pQix2GpuJPPX/v1L
         +BiZue8oJi/bbmtK9pN6KWe/mpGRlCK4ky+pdLQyUSoMEXH7M9zf8C1fd4LsxZLl6HPx
         s6OMuvFEAF7hmk27730jcRWZGqPAKKwop79bxzyheE6zpHssFCl+TRkht0EuJSogbk+p
         IRvBBfd/yjWJ4eyqb3K+nrKBijdYDXLW0+Ugw1X5bznTgEGRQ0Ribr24JvPNOYFaGea4
         YkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707205937; x=1707810737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjkb+6k/ccop6hFf25bQpwkeqZygRT9Wmt/Bq+56nWc=;
        b=GLshJcRWgHemIzL159FlJ1+q8ll/p1gNvRXGpuEQgnUw/2Mfm44FwXXinh67vVIZ8V
         IBsDo7RR/hwVS8SuyHLrqqI2bTaCkjKs7Mh7CVyO6jx6Gw0kX9w2kqKfTrCEnlN3wraD
         wf7uZflOnN8xCVvKMJhCKuE1IkXSg9/EGA9QNXQyh9x2Srury3RzaTczAibKSO9m08wY
         bRVy6fDj070GGdCLd31k64+2A8X2N+NcOdWuLMD7U87LG0lh+K6dSNvCoS+kzb+TkTaJ
         fLhAoBLES9YQ+9RYyZGVdBYIf6RRcxvkK9ObJjG92OtBGMqzLYlg9ynyzHUfwrXyMB+B
         XC/Q==
X-Gm-Message-State: AOJu0YwkIA9hZDxYNJp1TTaG1lkCwLjWXPUBZJ8gzQoGbAmTLmOnBD5k
	DF9CTILgnHqreIXQIPrDMK4idtnNRU6+X1z2i/v3nURUwVVfpgMLtu7txWwmdcI=
X-Google-Smtp-Source: AGHT+IEImHicEgNUdgursvnPG9fIjWOBo8flZOXDoo4QYjXu2gIbRkopngA3AFN7/iqvGLW8KMPmoA==
X-Received: by 2002:a05:600c:3d08:b0:40f:e067:d700 with SMTP id bh8-20020a05600c3d0800b0040fe067d700mr1355266wmb.20.1707205937118;
        Mon, 05 Feb 2024 23:52:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXzRbe0Pc0MbbjL3PDwklHaadtArRtSlDpzHmu+hHAHrz8CqFGN25LHeqo+HL3atw17fQTvAWqhg3CqHqPkWkm8noC/TGDaC9RrzCvfbpCWgdrB67GgNws2WncgbNLnyXoCRevbBkNuR07pwrm7N97OIK4CVnh6qrbLn1iL0/68QiXtP9CH5DhYiT6SIJl84YBGIWBSfTwXg/dmthrSJQgilWqIryi6+1rIkFKjuSUHcUy55/1suQt4PX8llGUkfm8wZHhINykJk+hYLH3BQNCqDhms4Qi5Sk+3CT9HIx8PijNUBg0o30wYf9taCbRdP4h5t7qSciSKZsss7ji4tACGHnKt4N59ePjFtfNbVN/Cjj4SHGbrlI9NM8CSc11aryFvhdb0X83WM/fYPGkG4kX4ASPfOv9lKv9I7OL0Zd7dDwXOazzvkoo1E24UEBOYBZbuiuNsIKnuTz2GRGbCqXJL/IelgxQS211rvN+f6U+Frq0OL5hNG/7hF8uSwbtjgu4KTqYkFch7sQ==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.154])
        by smtp.gmail.com with ESMTPSA id j32-20020a05600c1c2000b0040fbad272f6sm1106843wms.46.2024.02.05.23.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 23:52:16 -0800 (PST)
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
Subject: [PATCH v4 6/9] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Tue,  6 Feb 2024 09:51:46 +0200
Message-Id: <20240206075149.864996-7-claudiu.beznea.uj@bp.renesas.com>
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

devm_add_action_or_reset() could return -ENOMEM or zero. Thus, remove
comparison with zero of the returning value to make code simpler.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- none


 drivers/watchdog/rzg2l_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
index 93a49fd0c7aa..29eb47bcf984 100644
--- a/drivers/watchdog/rzg2l_wdt.c
+++ b/drivers/watchdog/rzg2l_wdt.c
@@ -316,7 +316,7 @@ static int rzg2l_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&priv->wdev, priv);
 	ret = devm_add_action_or_reset(&pdev->dev, rzg2l_wdt_pm_disable, &priv->wdev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	watchdog_set_nowayout(&priv->wdev, nowayout);
-- 
2.39.2


