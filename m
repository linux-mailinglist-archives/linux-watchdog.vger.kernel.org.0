Return-Path: <linux-watchdog+bounces-4922-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABlRGNs1i2myRgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4922-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:42:51 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D5E11B54F
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7373930A62BA
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 13:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499B1329E43;
	Tue, 10 Feb 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i25XJUIn"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2B2329E6A
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730743; cv=none; b=Iqp1nki83WoPRGGsoN8AEYsKpda92L+n6V18v4ib83SWvUYhBH/c+4eLLTkZUnj+YLBwO9WhJF0/dbXr2CwTs49C0Ta8wc4PnUDpI+YER4QePnRDuh17i8Mq6YaUxeTb8B5mAWmAsKON9E/aLZmqFxBO8ESeo4VrxAhwtlj9PBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730743; c=relaxed/simple;
	bh=TbPJ3FjFrE2tq53WqqU4kRyhPkLnNnNnPD60wqZ0fxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XCQJA5oTNmaYVhQpw5npluA3kTa9BjlR0GSGtCmKhadD0+FECOWDLF6meSvoAEW3/j3e7H18dGM82BzhIrgSSLj0pCZAYCKxBXCNN5RpD2X4Bq+2f1BhMHCbf0IGm7rMZZNUQNlPvJBgpo7CNYJoJ3IP/mNREaoQtJmRGNYNrEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i25XJUIn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so43153195e9.3
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 05:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730740; x=1771335540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGNEecakAfXorcTTEznVuRkn8Ex5W+QcTjU+PIsrpQQ=;
        b=i25XJUIn7Go0M8QB8GqI5tVdaozJp33kFC0kLOCUO8MvT+ceZDrDw3Bg01UHAyD0k7
         hbVaUI22fctTVvgaLeko7ZSMqm4WnMYTqQ8sHsHqNHgSC3cbnkcWH8F0SW1Oi+qNDW2l
         xJpBSpvOcod3+IeF3TZEwz/0ggCBPQ8YS1IUmNxzDeMHcebx/lbbllbC9vHl4cPG3vNZ
         ayDEV7DAv+MB71Fo62hwtcwceh6bwWrbGb+xIBnw4uZDbqgqW8ctyajOB+kicljCQ1D4
         dh46YrWZtwqM0x2+eAxxE3S5nBQz7baFQMsbXUb9CbMYKQsfd3MOmq0WEAHcfEi3Se/E
         DrAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730740; x=1771335540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HGNEecakAfXorcTTEznVuRkn8Ex5W+QcTjU+PIsrpQQ=;
        b=u6fdKH+J7TryzTExQPff0dlGbBuRYCtg/yGqtwUm3AZElpxE99E8F5OV955Swn9QJq
         cPmRDEtkz9l0EpzMNDcQBpG6Uud1YbUVNzBV31a0tGc39G5oDETgDxciSp5bcJAGbhlW
         rSMOXxxPHR2bKlHDB15MGEDy1Qo7U3kAj2UJhlOsrcsR9xxKo87k938jencQohRWQ462
         3uGDZCoif443pkYUg1ZCMfvbW1fFO08mpTn3/TS4kdogj2i5aZyxg2okwtGA3jP33J+S
         3n7YSeAzaJUndlIupI+l39BaNUfKq/WMHfE34i3GBUvYmFEq6GSEjQlqH3XxOrc9bBNZ
         0LVw==
X-Forwarded-Encrypted: i=1; AJvYcCVtP3W50z7sBO2kX8NBBRP3ijdeAsc1Yx/29hXI7boc1w2v9N2i/ZyFykmjjykDgPQz5KtJsFWnILSMBfsCrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz26CgtDCvUib1W60z3enINVdHEl6DWSQ6FHjW/M8CfHdP7ly7L
	BYLovDF3pAsUBjoLXwYhTWWtJjkGSGV9hmLJ9JceFxQzPsJAfYzNKrMp
X-Gm-Gg: AZuq6aI63Ed0C/r/8nVXs+hlNOQgb++QWCYn2hJzL4cG1L5SO2WbAJ27SEXXKE2HEdn
	q9RP+cR8cysFMMAvFxBJ6FWpUiyaCUxrk8jd2SEpECIt/hHqimXdk/Iw/j79FnEarLYatbYrCFc
	ZbuivGD3IG+wiPzEgFRfKUa3nlemhtTnSDUbp1zEbD11gMk/zXUXmxWATJoZYRYbmxhkO9w4R3H
	PQ8CQyHY+6U60ItcJQBk/z6aaEmtKxzYSPXFWpFziZ0Ksn6hb2lrqQ5qX8HBKMPMGKc5TLHxwxv
	xMKZ0ZERTbYoMmz2so9t6JgXMJy1iaXa4+5f4WVWCJOUt6qAjK6/652QzqbAGXDN0vwqd0ozpJI
	FvqnAOoFzf9iatrRcBhUzlRxp9XunC/vKytQtHzk14MizJqfXbx6Zv+dWH5hDiJ114QBM/7UOth
	6TIzvmpu8Y1JVCudhYfUxZIPTWeudvywD49g==
X-Received: by 2002:a05:600c:3b1e:b0:482:eec4:772 with SMTP id 5b1f17b1804b1-48350833938mr27829925e9.32.1770730739808;
        Tue, 10 Feb 2026 05:38:59 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:59 -0800 (PST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	avifishman70@gmail.com,
	tali.perry1@gmail.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	joel@jms.id.au,
	openbmc@lists.ozlabs.org,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 2/2] watchdog: npcm: Add reset status support
Date: Tue, 10 Feb 2026 15:38:43 +0200
Message-Id: <20260210133843.1078463-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210133843.1078463-1-tmaimon77@gmail.com>
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4922-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[codeconstruct.com.au,gmail.com,linux-watchdog.org,roeck-us.net,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[google.com,jms.id.au,lists.ozlabs.org,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tmaimon77@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A4D5E11B54F
X-Rspamd-Action: no action

Add reset status detection for NPCM watchdog driver on both NPCM7XX and
NPCM8XX platforms. Implement GCR register integration via syscon for
reset status detection and configurable reset type mapping via device
tree properties.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/watchdog/npcm_wdt.c | 110 ++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
index e62ea054bc61..ebece5d6240a 100644
--- a/drivers/watchdog/npcm_wdt.c
+++ b/drivers/watchdog/npcm_wdt.c
@@ -12,9 +12,25 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/watchdog.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define NPCM7XX_RESSR_OFFSET	0x6C
+#define NPCM7XX_INTCR2_OFFSET	0x60
 
 #define NPCM_WTCR	0x1C
 
+#define NPCM7XX_PORST	BIT(31)
+#define NPCM7XX_CORST	BIT(30)
+#define NPCM7XX_WD0RST	BIT(29)
+#define NPCM7XX_WD1RST	BIT(24)
+#define NPCM7XX_WD2RST	BIT(23)
+#define NPCM7XX_SWR1RST	BIT(28)
+#define NPCM7XX_SWR2RST	BIT(27)
+#define NPCM7XX_SWR3RST	BIT(26)
+#define NPCM7XX_SWR4RST	BIT(25)
+#define NPCM8XX_RST	(GENMASK(31, 23) | GENMASK(15, 12))
+
 #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
 #define NPCM_WTE	BIT(7)			/* Enable */
 #define NPCM_WTIE	BIT(6)			/* Enable irq */
@@ -45,6 +61,9 @@ struct npcm_wdt {
 	struct watchdog_device  wdd;
 	void __iomem		*reg;
 	struct clk		*clk;
+	u32			card_reset;
+	u32			ext1_reset;
+	u32			ext2_reset;
 };
 
 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
@@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops = {
 	.restart = npcm_wdt_restart,
 };
 
+static u32 npcm_wdt_reset_type(const char *reset_type)
+{
+	if (!strcmp(reset_type, "porst"))
+		return NPCM7XX_PORST;
+	else if (!strcmp(reset_type, "corst"))
+		return NPCM7XX_CORST;
+	else if (!strcmp(reset_type, "wd0"))
+		return NPCM7XX_WD0RST;
+	else if (!strcmp(reset_type, "wd1"))
+		return NPCM7XX_WD1RST;
+	else if (!strcmp(reset_type, "wd2"))
+		return NPCM7XX_WD2RST;
+	else if (!strcmp(reset_type, "sw1"))
+		return NPCM7XX_SWR1RST;
+	else if (!strcmp(reset_type, "sw2"))
+		return NPCM7XX_SWR2RST;
+	else if (!strcmp(reset_type, "sw3"))
+		return NPCM7XX_SWR3RST;
+	else if (!strcmp(reset_type, "sw4"))
+		return NPCM7XX_SWR4RST;
+
+	return 0;
+}
+
+static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
+{
+	const char *card_reset_type;
+	const char *ext1_reset_type;
+	const char *ext2_reset_type;
+	struct regmap *gcr_regmap;
+	u32 rstval, ressrval;
+	int ret;
+
+	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
+	if (IS_ERR(gcr_regmap)) {
+		dev_warn(dev, "Failed to find gcr syscon, WD reset status not supported\n");
+		return;
+	}
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,card-reset-type",
+				      &card_reset_type);
+	if (ret)
+		wdt->card_reset = NPCM7XX_PORST;
+	else
+		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,ext1-reset-type",
+				      &ext1_reset_type);
+	if (ret)
+		wdt->ext1_reset = 0;
+	else
+		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
+
+	ret = of_property_read_string(dev->of_node,
+				      "nuvoton,ext2-reset-type",
+				      &ext2_reset_type);
+	if (ret)
+		wdt->ext2_reset = 0;
+	else
+		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
+
+	regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
+	/* prefer the most specific SoC first */
+	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
+		regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
+			     rstval & ~NPCM8XX_RST);
+	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
+		if ((rstval & NPCM7XX_PORST) == 0) {
+			rstval = NPCM7XX_PORST;
+			regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
+				     rstval | NPCM7XX_PORST);
+		} else {
+			rstval = 0;
+		}
+		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &ressrval);
+		rstval |= ressrval;
+		regmap_write(gcr_regmap, NPCM7XX_RESSR_OFFSET, ressrval);
+	}
+
+	if (rstval & wdt->card_reset)
+		wdt->wdd.bootstatus |= WDIOF_CARDRESET;
+	if (rstval & wdt->ext1_reset)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
+	if (rstval & wdt->ext2_reset)
+		wdt->wdd.bootstatus |= WDIOF_EXTERN2;
+}
+
 static int npcm_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	npcm_get_reset_status(wdt, dev);
+
 	wdt->wdd.info = &npcm_wdt_info;
 	wdt->wdd.ops = &npcm_wdt_ops;
 	wdt->wdd.min_timeout = 1;
-- 
2.34.1


