Return-Path: <linux-watchdog+bounces-439-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC4836158
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 12:25:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E59F21F233BB
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jan 2024 11:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F784B5DA;
	Mon, 22 Jan 2024 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DZWsPIdB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A794B5AB
	for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921915; cv=none; b=j78KtzV1GauFp2mFZmUlcKEX642RpsdTmFCjGSzgR2A3R0AsGKZ5uK7mCJYWGIPrQtHtjjYJ9MSxNs+rBV0ZBtPNONjt6blryEfjrQiCqG5AysytqjAf2b1sXjEIml525kYDwpTvS/q4FE3cwsEFuSIbmQwj+DdIrXPWuPYMrq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921915; c=relaxed/simple;
	bh=zTlqsx7mKfKM3c1U7q3bgF1ozq6SPgRhMiKSXezx7ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WS4ag66ZaRc0AyUhqLXXTMV8jKRAAjIXbdVbVRXftFgHGok37VepM4MINDz0ngsM14Y6pI5LYA0I2iveiWqNHJU8xvo1rcCP5nKyjKtJtAVqA5kg1e5IAbN+3hsXejc63HSN8Ph9BZANeBhSmHo7IwJeartUfjolrwZM2zS1q3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DZWsPIdB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cd0f4797aaso27930601fa.0
        for <linux-watchdog@vger.kernel.org>; Mon, 22 Jan 2024 03:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921912; x=1706526712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQQ0M1y0R9w1O9khQHwqELj36c//l3qAUiggBNqlLWY=;
        b=DZWsPIdBczQp1mym0FAttc4bI0Z56jLIXLHrtPecYWzvG2wfd0BtJcAp67PShMYVWI
         c2y2xHrton0QpqHqni8zdwTYZxefJXYR8wWM0R2Jt12HGLRU5UCGbAjZ0iXykAEmePro
         7P67A4SMGw19iplQD+tvvYW0oanClsul6dgXEF76LqYOecRWuah6oQB8iCP9ypudOlSg
         1F8KrwGFS32CTScTkAuKEWOhZV39geFHSM0J0fQShf90DcJakZbeb2n8RjcVSuo/Ege+
         1fFkkPh0I2DNFWmFLLIMz5tsEHqZHDoubGDQyscQj6HfOzI2cXbGt26FDfLloTXTHTFI
         s/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921912; x=1706526712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQQ0M1y0R9w1O9khQHwqELj36c//l3qAUiggBNqlLWY=;
        b=i4Ym67hiBYnBae2x+we96d3+1C0FqYa6chm/ZIpoc0L1CAZ71fYxc2ilNYdu/wmyiV
         JmT+W6Vbdl2JqVnN1t++mA7s9CEeSAz6YzI2QFPBVqUC1ZBYIEYhWnsZGopJsXHIzWeQ
         fgkkCkjrJ6mZz7JRevlHsUqwJLaSaNAJJfWGpAt5E9DnRBACLegzLr9FukbzZkJYMbnp
         +V2w1NWgoiM+HpadF3gEAjISYT6k+K7iuNebMxpcaDrwqNtpMELVzhuQoZ73g2fNOe1f
         u2B0hrhAwuKs/5vD7RhlkqVS1M4RBVlro1NTwYeF2/52uVh4lf+f3C66RoqDHj9FKUWp
         o+8w==
X-Gm-Message-State: AOJu0YzFgG6d88ITCZ45AYSnrV3y7lKc7iHdZNIV1gAHASXsOI483XUj
	9g6JKJn/MWIgWexSZigscMtNeH+ltG1pWz7qTd2SxXe7rm9UpB50YZL2fa6rDyM=
X-Google-Smtp-Source: AGHT+IHSSE1awmKtlpENu0dlTIoJBksSl9M22BcDbrDCiSEauFdroEktdrK8UjU0sUX9a3qUPgS0DA==
X-Received: by 2002:a2e:a786:0:b0:2cc:a636:d5a0 with SMTP id c6-20020a2ea786000000b002cca636d5a0mr1683977ljf.100.1705921912027;
        Mon, 22 Jan 2024 03:11:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/10] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Mon, 22 Jan 2024 13:11:13 +0200
Message-Id: <20240122111115.2861835-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2UL SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a..220763838df0 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


