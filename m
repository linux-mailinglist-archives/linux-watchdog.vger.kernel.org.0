Return-Path: <linux-watchdog+bounces-2591-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 786409F5B92
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 01:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 204151893DFB
	for <lists+linux-watchdog@lfdr.de>; Wed, 18 Dec 2024 00:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 705FB70817;
	Wed, 18 Dec 2024 00:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cr1WLu2q"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890343B796;
	Wed, 18 Dec 2024 00:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734482066; cv=none; b=ru+zrqdPgmLxVep3VXn1vDYUeyBMXCsuKIsSQLuQVbwNTosZigzkYk6uHx05n0vRmzm+x8VLVxAGsnSPovhvgx5ZTwkmdYgX6lCMtDueNvNkqYVcU/lpXQmVmjcV1imhkTwSGTVvMo4heHZghNBZqrAI36hc4idrsnhlBknZHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734482066; c=relaxed/simple;
	bh=+TAsgaCXqhRTBRT+M9sAzsyFCkKyCTeDMysq63bAd8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m95Qyhog6DJ0i4U4bzcpw7a8PADKwSNJFUD87vSnmV0El3GQdgyISx649YRBB/p5swvtyVLU99sNhl+I+c6usXgJ0jvlgtxo1IdD8gsjjq58xVf1CtCZI91abo5b3Gewv5jX4fyJSm4M4H4hvvg44EMQLk3SR8z3jRUWZvjZYC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cr1WLu2q; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-436281c8a38so39586295e9.3;
        Tue, 17 Dec 2024 16:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734482063; x=1735086863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZdBY+5tEZHYvyrKeEY1U4t16Na927H2DWzxpoBLBE8=;
        b=cr1WLu2qsmpwZV9aWgNh8QkkN0ZHC6bK+KyuJJ0ooV1b8AmfAlB41bjxvwPJKfXi6E
         mr8ak3faHJfdMQEvq1Ox8Ud3aFsh7RS1Cc55c3veI9R1LWVnBkrZSBRYx9aKEvzpN3vQ
         QRDwFzzhqoUtPJK/t+703GWjQwH5MW2Gvohej3sICyeH/XSr4nUsv7528tzM7LvLEYK6
         hfL8VfPoGPGIxbAtbDWaBOYa83c/DfVL8HHGGZRKp/UnG46KiOlv0XDfZqo4nicrJhPc
         ne3Cpy8Dvet6CvmrLt/bh3BupFo0Kn5iGMvAczEFX+Nt0LFvttC3wfUXPEdMGSqKNM94
         mv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734482063; x=1735086863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZdBY+5tEZHYvyrKeEY1U4t16Na927H2DWzxpoBLBE8=;
        b=lErO899ZNMVdQ/XW8aXbvc9qXR67O67nDLC6u1f1c+pL58e/us+iiDvwY+ReMSVS6d
         Z55vrHcqwT1I1oM5Cyk+EItWYPoflUnw5Q95FuyJBbbUuYJXE5kK9BctRWLphfPHCDM4
         3db+QAeKFOicEdqLGswdzTo8VSgBSQ43s18F/bZst+240NU+UawZQA984pYbvsaO0wmm
         tvtdhEW19RY8TW+d9kRGrnSY9NhEctB8Ko2FBf3NspvB+N1Ac4Htb3FhH6Vl2HgXVP/d
         4C+Kx0NsOiQ3Qm0VTDOGmWkk3YC9onMGk7qx5sOaOUmtKb4nXeHL9RAsEoOkHUWgxyTT
         fzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0nsS84wid6cl2iJXS5RQKEebKIkidRbSxBuAf8oN+XtFd8ZCPi4FWU1Oc/2MkjalFaTBkURviwrDq@vger.kernel.org, AJvYcCULin8V6SJ60DqB9zzDiotN3hV0rDqKp1smBMEOOe90gtrtpwYehVf4gHmqigMZshuZJa/Wm7lbXH2t@vger.kernel.org, AJvYcCUfhHjOlzLXNEbNSyXwjQgMEyx34jmsvJgB7HASLv/TXbc8+tWrwLLv2CEWrqtKanBnLGtGXCmtdpCrA1DS@vger.kernel.org, AJvYcCVu3/+0eMNTrZn29md62QQvFKE1V1RKH0PIqrUqE9u3fxUEzoDMVx+qAUhKZIpmTIYhfUfChugFrPG7+8vnz3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtltNUiG0qq0h/aWBT+FPsTLwKtBN8zIvCp1zcWasnUBp0Zibu
	P336aACeogeAxxKSeJF8SSZwYU2QuNmwRGQLrQPdnhOIanD8H28R
X-Gm-Gg: ASbGncvpBxy3KjYu/UDpMr/Xk5vj+vSwCfM0U/03wEnHu8RIeA397k4WGUYglPLsImE
	suZZB+RqQ4xyS207AHEUPCwPGDOh08H0YeWhFxnvy4g0a7dM/SWKqhpsrhOOmOkPB135IGgRQA2
	pUtqd5hHlsYazNJ/o68180O/mavU2fONgA78eRwZc2YKjWeWaeQSjRIUECnr6FZiCVvyucZnsAQ
	7M22fQl12Q29382uNs62fdK3gy/bwPHNMOmhhfUlj42GYDmGWUWB6uBp4Od3dCrH3E9ASFsyofh
	wTcgcWe20Q==
X-Google-Smtp-Source: AGHT+IH5hnUkLxv3MXBhU4b24Px4KyjQ6LcW15b7f/ZP3qkHz2abn98UwIIf8ihiSeht1mQRTKuh3Q==
X-Received: by 2002:a05:600c:3b02:b0:436:aaf:7eb9 with SMTP id 5b1f17b1804b1-436553f4d1dmr4385295e9.20.1734482062512;
        Tue, 17 Dec 2024 16:34:22 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:ca61:1d3a:8af0:1c5a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b3b287sm2365625e9.29.2024.12.17.16.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 16:34:21 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/6] dt-bindings: watchdog: renesas: Document `renesas,r9a09g057-syscon-wdt-errorrst` property
Date: Wed, 18 Dec 2024 00:34:12 +0000
Message-ID: <20241218003414.490498-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218003414.490498-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/V2H(P) CPG block includes Error Reset Registers (CPG_ERROR_RSTm).
A system reset is triggered in response to error interrupt factors, and
the corresponding bit is set in the CPG_ERROR_RSTm register. These
registers can be utilized by various IP blocks as needed.

In the event of a watchdog overflow or underflow, a system reset is issued,
and the CPG_ERROR_RST2[0/1/2/3] bits are set depending on the watchdog in
use: CM33 = 0, CA55 = 1, CR8_0 = 2, CR8_1 = 3. For the watchdog driver to
determine and report the current boot status, it needs to read the
CPG_ERROR_RST2[0/1/2/3]bits and provide this information to the user upon
request.

To facilitate this operation, add `renesas,r9a09g057-syscon-wdt-errorrst`
property to the WDT node, which maps to the `syscon` CPG node, enabling
retrieval of the necessary information. For example:

    wdt1: watchdog@14400000 {
        compatible = "renesas,r9a09g057-wdt";
        renesas,r9a09g057-syscon-wdt-errorrst = <&cpg 0xb40 1>;
        ...
    };

The `renesas,r9a09g057-syscon-wdt-errorrst` property consists of three
cells:
1. The first cell is a phandle to the CPG node.
2. The second cell specifies the offset of the CPG_ERROR_RSTm register
   within the SYSCON.
3. The third cell indicates the specific bit within the CPG_ERROR_RSTm
   register.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/watchdog/renesas,wdt.yaml          | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 29ada89fdcdc..8d29f5f1be7e 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -112,6 +112,19 @@ properties:
 
   timeout-sec: true
 
+  renesas,r9a09g057-syscon-wdt-errorrst:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      The first cell is a phandle to the SYSCON entry required to obtain
+      the current boot status. The second cell specifies the CPG_ERROR_RSTm
+      register offset within the SYSCON, and the third cell indicates the
+      bit within the CPG_ERROR_RSTm register.
+    items:
+      - items:
+          - description: Phandle to the CPG node
+          - description: The CPG_ERROR_RSTm register offset
+          - description: The bit within CPG_ERROR_RSTm register of interest
+
 required:
   - compatible
   - reg
@@ -182,7 +195,11 @@ allOf:
       properties:
         interrupts: false
         interrupt-names: false
+      required:
+        - renesas,r9a09g057-syscon-wdt-errorrst
     else:
+      properties:
+        renesas,r9a09g057-syscon-wdt-errorrst: false
       required:
         - interrupts
 
-- 
2.43.0


