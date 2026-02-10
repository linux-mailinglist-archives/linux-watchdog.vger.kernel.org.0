Return-Path: <linux-watchdog+bounces-4921-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DpXOfw0i2myRgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-4921-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:39:08 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F211B4AB
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 14:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D9AD8300E5EC
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Feb 2026 13:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721E3329E6A;
	Tue, 10 Feb 2026 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTeUeDMX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD532A3C6
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770730740; cv=none; b=bXXDSZeOHdLiVaMDUr/phwV3stmOf0nvOl+dFLg81RdStcv02qvp5ncG7zkf819srLLosDoZCcWwx+PGAwbNksasagK5zpAh0VA2mVO17naoksw0SkAvC5Qgst4ezRtrQMTYaaJuhcBNNcc2Hn/SBErVhGmq1KTaW3Nh3NzzIvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770730740; c=relaxed/simple;
	bh=8F4cLTHuBDdfXE5ZM9txPWyNbSnh/bI2GKOgahn+3no=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kL1BsQL725ZisiiNEOGXvtVtfNJZ53HOdXmiGMuFEWdLf1m7HeyR/gLLHQHBTVUuOq0q77maKVD/lnnqx7L/L9icMmD1pPsFYIK70UB9L9V2mPWNlX55MZOu6EhdtugRhapo9B5+2FVT2XsVPmtTnFr7LzQhI4LIavVWeWNVTwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTeUeDMX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso53958615e9.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Feb 2026 05:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770730737; x=1771335537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iODKpq8SiTOJupDlKbF2WoG4lC9wFyKPKfQ6o0K08dg=;
        b=LTeUeDMX3owftF4X8dsgziFISZN7mgFCiO9pOm4dS1/l35jNIYTd8om/3GMBLzXQDl
         qLCF1jmfdcGXYJ4YlWvjncldvjPm+9x3B5ipmWcb08uQtvMB6h1yvrPloeIcQFYPrluF
         p0SZWxr4UjO/F9oyZ2ctFWQYXxYcr1TCT6S+BSxi4lFz7q3Rqjk04kqS570tgpKksOzY
         4lxEujOsdZgeJH/hW576inPElBlUssEWUildBxCaB7s5itLjyY7yFFFpRTNreBE4V6un
         C2Ox45rgAM3bBitIzxAdX/OXtMwRsVnAQiMowWAQQXLN6OOFjJOpBZBEkshjNaqmwZVy
         19aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730737; x=1771335537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iODKpq8SiTOJupDlKbF2WoG4lC9wFyKPKfQ6o0K08dg=;
        b=g395o+eqkJ+KYHYJJwGnY6LUGDPEUor3xnQoIzJPITzOO3WCkmQtSGhP1w5OepgDA3
         aT3OXjOpTJR1aZ+IrkLi06TtFHinf+hkLtP8I0iRKxZeNZoRAKEMqqlq1KIsQbCJ8/Rq
         fu9ZKdetOgu10CzYXKuUXwfK4+X9HdqsrG6m2BIPYeJLZJ0mqlavwr6uCKF+bq4zx9P7
         yE5R6UQ9zOw0oV+PSYBKQsp3C9Hhe9GiT7S4iCHLd2QymtvIzPj6lXk4EG5ot0woDH+b
         C+dX/cG2AHy0IXBbbq3lEFXU1FhfNAGWnESSPfdx90ORd8zFr0/HvZbFhQqH5x/5XwH/
         65ag==
X-Forwarded-Encrypted: i=1; AJvYcCULMZyEjLoALbJyCkg3lHEMK1thkD5OllCQui72UYVL/5VOdJicOwsvueOsF/vDwVdBcgNKVuF77uKdTlBdsg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaXfKRV02yEIIOqIKriflpau/HHtidlEfdcMNbStcg4zGmDrk
	yE0xiGYlaqvQFTVkbspLWrXVTGKAEaeJB8QbmtTRNakh8QuU5wd+NMZP
X-Gm-Gg: AZuq6aIT1MKVdppfILMWy5WJ6mJvY+SfGQqKQYFmcL8PEfZt5T9U416Oo+u6390R/+s
	lyhPh8I7h5Bp+FPuHcRllBg4FsahW+WL4e6rVEokCWIcKbeGEFs9a3HwsMKaY3sDf2xvxjkYzGn
	nSk4nqPxcvOidnCXVOJfV6TruAvt2Vb6lvZQBamqYud/UfCGuBcEzFYB2MPxNTrmXYy9xz2k5ZG
	lk9ukC3jxw4ChKw29I8UYu1bGAEwQHFFl1IcY/GWpu+z9ISrqqI4URsMRU8YZofAGxN1FEIOuEP
	CQ7VcNEDdYyxCf0ITjjLABO5VJ2pAGHIo2IyVugNSxwqrQFd7gjlGQdYkx5vMyiVIJRsc7fDwtj
	QJWGPQtw9TQMqIosWvQIJU4q/Wu9O1ZJ8thTTi5SQAOVSG1GLVZu4vpjVpx98iadra5qfyfPHyl
	BRKSIiOalaL9QidZdZLRBrKXN33nPVoQm56w==
X-Received: by 2002:a05:600c:3e1a:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483505116camr34660955e9.6.1770730737018;
        Tue, 10 Feb 2026 05:38:57 -0800 (PST)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8df8sm66773415e9.3.2026.02.10.05.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 05:38:56 -0800 (PST)
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
Subject: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status support
Date: Tue, 10 Feb 2026 15:38:42 +0200
Message-Id: <20260210133843.1078463-2-tmaimon77@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4921-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D3F211B4AB
X-Rspamd-Action: no action

Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
integration. Document syscon property and three configurable reset type
properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
nuvoton,ext2-reset-type)that map reset signal detection to specific
reset bit positions.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
index 7aa30f5b5c49..054cc0115af2 100644
--- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
@@ -12,7 +12,7 @@ maintainers:
 description:
   Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
   The watchdog supports a pre-timeout interrupt that fires 10ms before the
-  expiry.
+  expiry and reset status detection via syscon integration.
 
 allOf:
   - $ref: watchdog.yaml#
@@ -40,12 +40,55 @@ properties:
   clock-frequency:
     description: Frequency in Hz of the clock that drives the NPCM timer.
 
+  syscon:
+    description: phandle to the Global Control Register (GCR) syscon node.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  nuvoton,card-reset-type:
+    description: Reset type for external card reset signal detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
+  nuvoton,ext1-reset-type:
+    description: Reset type for external reset signal 1 detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
+  nuvoton,ext2-reset-type:
+    description: Reset type for external reset signal 2 detection.
+    enum:
+      - porst
+      - corst
+      - wd0
+      - wd1
+      - wd2
+      - sw1
+      - sw2
+      - sw3
+      - sw4
+
 required:
   - compatible
   - reg
   - interrupts
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
@@ -57,4 +100,8 @@ examples:
         interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
         reg = <0xf000801c 0x4>;
         clocks = <&clk NPCM7XX_CLK_TIMER>;
+        syscon = <&gcr>;
+        nuvoton,card-reset-type = "porst";
+        nuvoton,ext1-reset-type = "wd0";
+        nuvoton,ext2-reset-type = "wd2";
     };
-- 
2.34.1


