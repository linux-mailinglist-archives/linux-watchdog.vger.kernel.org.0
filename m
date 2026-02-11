Return-Path: <linux-watchdog+bounces-4929-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKpfLJjTjGm+tgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4929-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:08:08 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 543DD1270B0
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 20:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74E123038F7D
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 Feb 2026 19:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA2FE352C3B;
	Wed, 11 Feb 2026 19:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mfy192Hk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A89F34C124
	for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 19:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770836789; cv=none; b=TpzwaeOFkScQZHWJcOnEBQSXZXQwQ2HgWU9PkSraxbFajNGiFSmL0Kjo8Rfl+MsxTRbV8ZaqyM7nvi6cNSxEzMBtMriiV4pkMtKbkmCrj6SPQIn1C27GywtFWNQ4Wht1P+8CXks//Fzq3euUK7YxMcbG/LjBIjp2BSf4RviAZqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770836789; c=relaxed/simple;
	bh=NjORale0EQrlT0CTmh6nN6JQRc2R61yP8fM+Dx3b0J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7jfDhGj5Myia7X5hLGnZigaAUOFUo79AX/sEGHgzY4gs++Ql1yl/l96wBlNAUzogXHf8blbxUKsNzcbnixo9FGM+JZ0xaRF3ktSgK8ldvMbt8Ef6NwSCoQ+cG45+HhNHh8ZLnk1quAJDAZorLsNRMfADYC05mSkXyOnA7Yh93I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mfy192Hk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436263e31abso5129995f8f.1
        for <linux-watchdog@vger.kernel.org>; Wed, 11 Feb 2026 11:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836787; x=1771441587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=mfy192HktQ/KVxTuTK9UmKcmyqgDfBlqHKksyq05gFSpWI7Z5U3RXdzNjoQ9CJyNPq
         01IHprOIDBIgJd9wGP0MW5wvQPcCOG8V0cyveE0dEpU2I1Nbnr3x8olpk+b/S1uEif1N
         H3r+ajHuvNmiigHDBh7/z1LSDue12cg9fUGc/np/dgL1aWjIL0WMILWkZLI3w6Its+Pn
         mkrk2qbIrXRmtY+JC3Y9r2etCC2htRLDaohlqaLcw7WJbEAezp9v5yA6r/kdtChLrP+N
         xqBpfImXcoES0K7vQwaRjjcMZmzvOP3R/tSJM7npEhsqrnmAz1w2N2+RaxNsuGXwiX/m
         s9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836787; x=1771441587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L887ASoGk+SRq/zl6CDIjyzwXxgUSRpV2EZ36HcCxec=;
        b=OE2FYw6rwjbLyNMYD7ylBnNTHiXtYNDL1GmZhXs4DHj+zPYKi5unMp9WUSAowW2Hd2
         5DAOOkLuEUQ6DGbKbY01yfsXjYrqGRza56xhw5xZx1E2D/L2B5NvOxs2wxUrESH/6IIU
         I4V/WPbKAGtk1REh6ojrjPIasXn1aJMX1KA81jAKPZ1utLubEyWGDkGwbDjf9Itb7NjA
         8kTK1IeUXrhyyGMfZkokJbnFNt8kwUwpF3fk6lnxuOrFoTEEum2zHCorhLgNgg/gjdD/
         JNmPBOCOKr3Q4+fqKt2TGQXxRqtPUyQ8mKLLkHz00V7Ea5hJyyHhpEPMw4aX0pSdbtat
         8IJg==
X-Forwarded-Encrypted: i=1; AJvYcCU2JQxtO0fxskYUdwW5sJ+Vs5HsWzXjZvVcGQe16WOjz/IYXPFThQ7VL7L+B6jLFb6P8zBozDwE77d/kPSxQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEeFY8g0jeYkIr08hCHTpCvCimCsr8d45nBEacFSQOE5UgF0HH
	EKRlXztXtR0bEanGM04EOIUFwnEtxrwvwoWf7D+evofYWiwuGtiqxj89
X-Gm-Gg: AZuq6aIiJZlvfAqytup9FCtmXDRiSCwyXOUoumIiBBbDROTcTs4II1rgsz7im0HgglL
	N9yJGruwexzj3zg55MXGIJlcyXQ7mkANurq9ODMO3ctHqIjH3xUBUNtxKGE/ISC5OWfzMsJ7lNJ
	r+FvK9CoryLGyi2zNzSbvMv28Q9F1mHXdH0SOUYuOaRvwYcEFtkbHD0gVlyQ8wiVFeT+LtpSSHP
	3zpxjgwbhHS2B9RAey76Vv0c09yaEB2t16MumKxl3TO8Y1Vd9ENSoD9rCVObImhoZfa0ZcOHh1c
	swomb2NZXlSzCutCGSY1BmAmGyipW8BxMMIsAI5338fD4QKenwzy0jSQWWRhtLz7K/J+J5M1z1b
	jevUAbUImDAGoz3uyHHJlQlRgjk5LG022c7QjlEfgwC1Nk6/fsMW+NtQgrUTlrYvsWi93d+98+Z
	YVXPjg7N+1EsRvVHwXehg=
X-Received: by 2002:a05:6000:2888:b0:436:3267:3edd with SMTP id ffacd0b85a97d-4378acf76ddmr638334f8f.22.1770836786611;
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:26 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Wed, 11 Feb 2026 19:03:24 +0000
Message-ID: <77434edba7ab5050f5c0fd03302bf9eb4b1c60ca.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-4929-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux-watchdog.org,roeck-us.net,kernel.org,collabora.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 543DD1270B0
X-Rspamd-Action: no action

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..ded16173105b 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
 #include <dt-bindings/reset/mt8188-resets.h>
@@ -105,6 +106,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -498,6 +503,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


