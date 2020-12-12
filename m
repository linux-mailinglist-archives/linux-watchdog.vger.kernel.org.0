Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C818F2D8499
	for <lists+linux-watchdog@lfdr.de>; Sat, 12 Dec 2020 06:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgLLFJb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 12 Dec 2020 00:09:31 -0500
Received: from relay-us1.mymailcheap.com ([51.81.35.219]:42950 "EHLO
        relay-us1.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgLLFJB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 12 Dec 2020 00:09:01 -0500
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
        by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 8FB7D20CD0
        for <linux-watchdog@vger.kernel.org>; Sat, 12 Dec 2020 05:08:16 +0000 (UTC)
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.66.161])
        by relay5.mymailcheap.com (Postfix) with ESMTPS id 95287260EB
        for <linux-watchdog@vger.kernel.org>; Sat, 12 Dec 2020 05:07:24 +0000 (UTC)
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 9E7ED3F15F;
        Sat, 12 Dec 2020 06:05:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id C7C012A368;
        Sat, 12 Dec 2020 00:05:39 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1607749539;
        bh=Ssf11oEwwM9nMlUz4m0LH/yq8lL7ITtIP7gq4UsqQRw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BkPoF5VnoPPmlFPbNPSsskQMiYPHSoi/5G2M8L6lIB6yvS+1L0Tuvu9Apd3JQsu1p
         ywntm68pdYR+gX/BIqsvwIkUov51HkhwvfLGsn8k7J4rp3XelxvnOF42dGm6/aCCeh
         CPUsbPbcGEuuELCE+6wO8Z4azOztJpH/lyb7qY/I=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dERH21EBDmYY; Sat, 12 Dec 2020 00:05:39 -0500 (EST)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Sat, 12 Dec 2020 00:05:38 -0500 (EST)
Received: from [148.251.23.173] (ml.mymailcheap.com [148.251.23.173])
        by mail20.mymailcheap.com (Postfix) with ESMTP id E9B9442D9B;
        Sat, 12 Dec 2020 05:05:37 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=aosc.io header.i=@aosc.io header.b="QaPg7JZ8";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from ice-e5v2.lan (unknown [59.41.161.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 8978A42D9B;
        Sat, 12 Dec 2020 05:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
        t=1607749531; bh=Ssf11oEwwM9nMlUz4m0LH/yq8lL7ITtIP7gq4UsqQRw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QaPg7JZ8/F9J1RfO+LtqXJoPwUlOd4oXr6SSX0oUjoiuauBZgb0KFBCP9fSikmiZu
         KRPCZLUMbEy+1R+NL8wskhq3WRdQ299woSfo0u7zXHgYaJ7EwQ9cKZMe44y0gfr0pR
         5Sk6VrYfJ1CTGpNSrnGk5be4z3BlQQiNNO+YFBLo=
From:   Icenowy Zheng <icenowy@aosc.io>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
Subject: [RFC PATCH 09/12] dt-bindings: watchdog: sunxi: add compatible string for V831/V833 WDT
Date:   Sat, 12 Dec 2020 13:05:16 +0800
Message-Id: <20201212050519.3644837-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201212040157.3639864-1-icenowy@aosc.io>
References: <20201212040157.3639864-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mail20.mymailcheap.com
X-Spamd-Result: default: False [6.40 / 20.00];
         ARC_NA(0.00)[];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         R_DKIM_ALLOW(0.00)[aosc.io:s=default];
         RECEIVED_SPAMHAUS_PBL(0.00)[59.41.161.2:received];
         FROM_HAS_DN(0.00)[];
         TO_DN_SOME(0.00)[];
         R_MISSING_CHARSET(2.50)[];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         TAGGED_RCPT(0.00)[dt];
         MIME_GOOD(-0.10)[text/plain];
         BROKEN_CONTENT_TYPE(1.50)[];
         R_SPF_SOFTFAIL(0.00)[~all:c];
         DMARC_NA(0.00)[aosc.io];
         ML_SERVERS(-3.10)[148.251.23.173];
         DKIM_TRACE(0.00)[aosc.io:+];
         RCPT_COUNT_SEVEN(0.00)[11];
         MID_CONTAINS_FROM(1.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:148.251.0.0/16, country:DE];
         RCVD_COUNT_TWO(0.00)[2];
         SUSPICIOUS_RECIPS(1.50)[];
         HFILTER_HELO_BAREIP(3.00)[148.251.23.173,1]
X-Rspamd-Queue-Id: E9B9442D9B
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

V831/V833 has a watchdog similar to the ones on previous Allwinner SoCs
after sun6i.

Add a compatible string for it.

Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
index e8f226376108..2f3c350b0057 100644
--- a/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/allwinner,sun4i-a10-wdt.yaml
@@ -18,6 +18,9 @@ properties:
     oneOf:
       - const: allwinner,sun4i-a10-wdt
       - const: allwinner,sun6i-a31-wdt
+      - items:
+          - const: allwinner,sun8i-v831-wdt
+          - const: allwinner,sun6i-a31-wdt
       - items:
           - const: allwinner,sun50i-a64-wdt
           - const: allwinner,sun6i-a31-wdt
-- 
2.28.0
