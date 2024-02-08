Return-Path: <linux-watchdog+bounces-626-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1CB84DF3D
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 12:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC97FB272D6
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Feb 2024 11:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BF2A78B5D;
	Thu,  8 Feb 2024 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mVNV6n99"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66441768EF
	for <linux-watchdog@vger.kernel.org>; Thu,  8 Feb 2024 10:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389915; cv=none; b=AqDN5Si0YftOfi5eOrFgdUgVCNmYeUI73iz4/76D7yHtGRYUmMVbO5aCSH/lfk6FRq09MdOKPMDtXgTLGHL17g7auWyTZHxM7rn1ex191MYbAnhWnvwtfXyNa1rs3Az6Q8cePhe4G8hm8i2Nj+3YSCDZsAXqOcFk0A9TiRugzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389915; c=relaxed/simple;
	bh=yEoEKlhDEzMGeKJu+rGCdKapqxgMXcbg7MsWSgwM/fc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SocJk9tT82fGgvJjUTQO6WzPJ534Q2s9nW77NuWnNyIyeQ0Eb7su0sy7Dupeq0C8I8QmnSmz3gyD7X5dxXOi2A7bmTH4WxrUoFo+0FrMa2H/WKTgLyOmBEoaJJLnwFFHKPyRmiWtu6XKVL3mjYhMYEF747vTM5R/J4/H6k4jetc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mVNV6n99; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so403324f8f.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Feb 2024 02:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707389913; x=1707994713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpI6sRVyvnzeOO07/fKl+UDjUcwjCn7H+rGRCHf5Drg=;
        b=mVNV6n990N28HXmGjsY4KL2Pgt4G609tGTrK5sdAu95Eho8E4I9puT4dQiqz3mJDtg
         7g7MsaydTAYeTN4LfihfbF0EiuPTlsGZ/Ln3UMOHSZqrEXjydKrW5euHrhMlY4OL96vR
         qshP5ysqPfTnKaHvA76y1Xis0vP2cqXts4a/gxij4JM7yXmDI9tnUj7kaxzUbJG1BQGc
         m/jh19mFeITDBudJjCaiExcFRq0eMp7vRMpsw/MrRG8AaoHmH/L7flu2OYIX2TB8C3c3
         YrcSxTqfhn27I7DDd7T1rI106ZuCrqkDteIswWPS5QpHI/Nx1jGwJBg621tVpzTdzD/X
         g+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707389913; x=1707994713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NpI6sRVyvnzeOO07/fKl+UDjUcwjCn7H+rGRCHf5Drg=;
        b=U4XdWPRHh92lG4/XNKSfz8cDpBGkRd8N1CvK4t8l6hMxA7wQE4ChLvmZF6lsjdaZcV
         +98eokKdmlrDpCT6XuRjMiTB6RXSkVzeKBxzzjXnXwrGZHTz15/y3MxileJiEvPXvWnJ
         Cecic5e3599+ImIBF/tOo41Gv0Ityt0Bro+o6LVgoJBaGRj4U9L7ijKPAOCObUT2dj2Z
         ilzX4e4I/99PbkD5a+TxESzIL1/evO7mRifqWKZB+vvL2ZDKH7pIMp0v2NBpa9dge8oD
         4/J4sJkLdSE1hN10otZ7Wk40HfgP9rln8Zxu7/r0i8VzdjG2bA5ABy8943nU2ubnWrxr
         3ftQ==
X-Gm-Message-State: AOJu0Ywe4PqEHvW1Ucf1BVQIlmgUPCRASa++DmAKb476/k67npDnYOru
	W+SrrZRAtZS6u7TSxnVVWXup4HM938Ar05n+AW+A2KS+t5+c8akpJgVQEpqTg+g=
X-Google-Smtp-Source: AGHT+IEtulgGgkviFAI5/oXM5KvYcENkTmA9Z8VakdomDNNUKU/PoIhlI1b9uQmaj33GeguJWvas1A==
X-Received: by 2002:a5d:6407:0:b0:33b:4709:ebf with SMTP id z7-20020a5d6407000000b0033b47090ebfmr1526953wru.21.1707389912827;
        Thu, 08 Feb 2024 02:58:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEzKL4CgznD3UgpWolekoohhZWOLvJFALxx9rAx3dGF1SU0pzgQp+2LrTuFUZApDjZ3mvzpKjNr5isRsMlIM87G9saJZTcU2n65K/EBE8wmeSLRMu0EZnGVntY2JMEoBFavVUTHHiX7ZzhG5Ub7dYNMgdYzLIbrVymk2P/yyw2T+BDvX22vCtbviqGNQzNIMDhQ88cotM3AIPV6IrJIBfwlszO86fVDitMdoG2DRcX3I7eIEBLyQXVsBUzssgZFQj3dAEpGvxmUEszkgsBNFwnzCEMDIFPVT5xkINFbZgW1KcITlBPWNFrfVQXQiMkT8iIR9QDCXnrvigVfgyupk0yzp0Rz7efgYjcvtNc8pNqR+rZgcoIj2Fzw7gumx7kntSkWiBtVIKImetPmbaNKCqoL4lLv+eyly1I44VC9KVJAMQrJhDNKrpymT4yCxhxKA7wYt4XK/u+LUqf1wXMT+PbXhh+dXWx6BCLwGKnwuqoAxCSALazD6gIhbJQ3lQQIks9VMGN7Xm3eg==
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id a6-20020adffac6000000b0033b4a52bfbfsm3344153wrs.57.2024.02.08.02.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 02:58:32 -0800 (PST)
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
Subject: [PATCH v6 6/9] watchdog: rzg2l_wdt: Remove comparison with zero
Date: Thu,  8 Feb 2024 12:58:14 +0200
Message-Id: <20240208105817.2619703-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208105817.2619703-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v6:
- none

Changes in v5:
- none

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


