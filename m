Return-Path: <linux-watchdog+bounces-4970-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eL4KNydBnGk7CgQAu9opvQ
	(envelope-from <linux-watchdog+bounces-4970-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 12:59:35 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 452AF175C98
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 12:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 16A3F3007AFA
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 11:59:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41116362137;
	Mon, 23 Feb 2026 11:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpiJRUCb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF7835B64E
	for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771847966; cv=none; b=EHdrt0IVo3dSyvnv/5Gzi3uowJgpy0sNMKMU7Jro6tKK0YP4WKPMy96y7K8N9j3Bi4MJ3ltM8D7WWu9O13rLZ0P6DuDxcxkM72dsKJoCYSe1o7qsC/Q+jusj3BYX3UfBLc2ym7xVW1TdnRpwFyONnA2CXtoDkrHpqSxQVCeKNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771847966; c=relaxed/simple;
	bh=SzD9Iaa5T3Eo/a0uF31MTvQLnlT9Ly7wKbfUGpbTGO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BriXGffy22QtHuFTfIhbL0fPu5FYiZ3+WuOU/GwBJr/fwr2zLkE8mfiP3q5oprErNIkSN0BbzgavDNPgQIFvmLD7NS2r52t2gMUgzBtkiYYMjUxCNQK0KWLB29fFdbBcwIMCkda2IQkK84DyJF52Ir8GyEwfwSk8onEEjCXTyN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpiJRUCb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8230c2d3128so1719587b3a.0
        for <linux-watchdog@vger.kernel.org>; Mon, 23 Feb 2026 03:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771847964; x=1772452764; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZ3Uv4dBfKrGypQF2iUd8rVEcAKA1IuNWDJE7r42I1Q=;
        b=kpiJRUCbVB42l2FHchQ/A9DfNI0BsNBNR5RHiNjouJfI4iz7iMX33grFzKwmb7BDcH
         wgYmTJi6ETuWLo0KWIdAKqT6P1CaCZP/UrS6G/f/CH8t65JDI8tH8SnTlM2suePIPMqL
         R+8tSQB6x5qAUuY8Wf0hXdqx4AIhsb1952X94GLl2qh9yWrIzgB3B8emHlMXSHsBVLX8
         +6guMxqyy5ViHdCIs7eNCIdwvu+etS1CFXZCEJjVay/BI3UmhC+pu/goYfYllvCLz9da
         RdgIrlAJMGlac4t0oeNqreOoT9+mt10QDk/zqIg0r0qYjRpRn1sV+nzcNcPS90i7XUCM
         tKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771847964; x=1772452764;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bZ3Uv4dBfKrGypQF2iUd8rVEcAKA1IuNWDJE7r42I1Q=;
        b=a4y0e7+GywM3gG01HPaS2FwZJMBaopFvkx0rGiSXBCFCh9eTajvRzmqmrFYynbvbfS
         tP0wmAE1q8qSpZb+tB6iRs/UaFy2gU44Sywj6+96PXejnQXZ2WkgzHozWjF10x4Q7mRS
         /UrwjMwnCdtWWKpmIFIp9oopH39CGmYqc5KtURg0qYOF0uz6izrHe6w6oVTpt5rHnLKY
         dq7OdsBG9dwQiHLousyJcmhuvCQFRINj3ZRRFSSEelQNODHLSOqh5nh2x8fLiknLUW4P
         PrrzK/Hl5hLO2bJ8nKC+uYyJ8ZhYmryVrMEUrqYLjmL0HZaWns9zyGPzR/A7gbdWABQ0
         OmEw==
X-Gm-Message-State: AOJu0YxlPrskPccuBAhIzQHVS/yHf0d+bzOn0BZK6HQTwlpJixpDwR2e
	368Y8vQxnXlQHhcvOtN6b+LvdUqOC7gi9OtIDwT0MG/MpSCsd5PxVZwY
X-Gm-Gg: AZuq6aI6Uqncadk2wvnE7LZHLit7Ob/mbr9sTIlD+0QwTIeN16hMhNE1LtrvzgtTsqq
	Gwy5Nq1k1HdRxq3eyAr5NDRvUWYM6avgOySbKvOX/OY+mrH9hj7SToxnG23U0Mp/2R/unStmP2A
	m/2FKGiN1Vb3v/u0YlVZyR8M6Re6dHbLMO8jz9nJBtfWXJw21nFMhybpB3ytwBvco7dUeiKrskb
	QmOHdtYs8gSvRfym2/hOXqbeV82PD9pYIkR9T+I6wISYUsM9zVt4LN5p4Yb4gZuiZHyYia22gzI
	UgKLiNhAhGTdFRAhIOrxv11S2jhS0tg0SX0GShFHYOr8+Pe23TGIu6oonkoy6USLQDwqHtLANQ1
	FbQVa1R0yRExLGSoXRGQqjj0DZQWi7CTPB9W5Q2xvlPwlLedgK0geQ2Asjw0sn89xesjrPkGVRn
	0ctqheILPaUbueFcxPNSdySLSqF5XkEodUnOkMAQ==
X-Received: by 2002:a05:6a00:ab03:b0:824:9451:c1e1 with SMTP id d2e1a72fcca58-826daa82eeemr6723768b3a.58.1771847964413;
        Mon, 23 Feb 2026 03:59:24 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:1cfe:ae34:fdd6:6b97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd641040sm7261616b3a.10.2026.02.23.03.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:59:24 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Mon, 23 Feb 2026 19:59:20 +0800
Subject: [PATCH] watchdog: sprd_wdt: Remove redundant sprd_wdt_disable() on
 register failure
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-sprd_wdt-v1-1-2e71f9a76ecb@gmail.com>
X-B4-Tracking: v=1; b=H4sIABdBnGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNj3eKCopT48pQSXeNU89Rkc0ML8zRjAyWg8oKi1LTMCrBR0bG1tQB
 ZYgweWgAAAA==
X-Change-ID: 20260223-sprd_wdt-3e7ec7187f30
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771847961; l=1230;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=SzD9Iaa5T3Eo/a0uF31MTvQLnlT9Ly7wKbfUGpbTGO4=;
 b=xEJkwp9hPUX9493/u6Pu+C/xw3zAGIisitj4cjWmQ/EMJRg/UjPNFnetNPrndVm3+lI70/lsC
 BTD6AifmAkaAth+pFDAhOb1t0dLmvlSUF9GdGla1sT/nbDyQW8/itei
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-4970-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,gmail.com,linux.alibaba.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 452AF175C98
X-Rspamd-Action: no action

The driver uses devm_add_action_or_reset() to register sprd_wdt_disable()
as a managed cleanup action.

When devm_watchdog_register_device() fails, the devm core will invoke
the cleanup action automatically.

The explicit sprd_wdt_disable() call in the error path is therefore
redundant and results in adouble cleanup.

Fixes: 78d9bfad2e89 ("watchdog: sprd_wdt: Convert to use device managed functions and other improvements")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/watchdog/sprd_wdt.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
index 4e689b6ff141..aacf04616fef 100644
--- a/drivers/watchdog/sprd_wdt.c
+++ b/drivers/watchdog/sprd_wdt.c
@@ -320,10 +320,9 @@ static int sprd_wdt_probe(struct platform_device *pdev)
 	watchdog_init_timeout(&wdt->wdd, 0, dev);
 
 	ret = devm_watchdog_register_device(dev, &wdt->wdd);
-	if (ret) {
-		sprd_wdt_disable(wdt);
+	if (ret)
 		return ret;
-	}
+
 	platform_set_drvdata(pdev, wdt);
 
 	return 0;

---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260223-sprd_wdt-3e7ec7187f30

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


