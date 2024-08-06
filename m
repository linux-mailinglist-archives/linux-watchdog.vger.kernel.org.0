Return-Path: <linux-watchdog+bounces-1454-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD657948CF0
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 12:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7E12871AC
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 10:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8C31BE854;
	Tue,  6 Aug 2024 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnMqk+fp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4651BDAA7;
	Tue,  6 Aug 2024 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722940720; cv=none; b=bJQXEL/sxKwLbfBMl/6oJIC5ipLVTQTXkWA0qZU4mIesbcuPEwGe/G7QVnjldbk9UnWEmL5t9QHZBurpNkHnH5oxLJtRRTYFSYQLoPWAccnrW+ljcIi1grUumNj9rs7EDeO45/XX3BMBeWuoYqOZN/RqL5W/C2LGs4ZrfPGthHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722940720; c=relaxed/simple;
	bh=05YUjKWcS8QjfXQkGcpwUyF2jmITRUMRuJ8V9/VtX4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PReEnwBJ4NkuA3uj6LSTvnwiaQmUVkx0bVSX8Jehp8v6YC8SocehkYf4M5E4oMTXv0ZuuzNfhd+FBVl6I7UAT0XVtGh9v5R4YXmv1EnBI8X6OLvbrKONhas44LYTyGc9idmCf9PiMvz/jsxqzvaAcgM2mFiKnGmtpRn6uxQJRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnMqk+fp; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7b594936e9bso420259a12.1;
        Tue, 06 Aug 2024 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722940719; x=1723545519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBE9cbqqy9E10rFhHW0Wgihe2/UchPViyrmjttfLQ6E=;
        b=hnMqk+fpb40Pk0Z9UPUseTZ7wmGFrkVkg6TncvPmT81FFdJlvZiDMqUpWihOLL3j4L
         t6NZ1Mi+pYKm7X1FMDE86muzWHkzlsT5KKzNZF/55xePBdAPkxCQK05E+HF5MsgB98xP
         8/BB0FNbIfAIxn6EXJFCynBpI57giA6eASuz0OdCGcuPQ26acIdsX+LQ6XoQyx/1fNKQ
         5f23jjuxf7YXheG5ZNoUEdNC4qYnSvZ9tAK1rsPPuTSk7KVfhIPDNMAH5AtMcGtXVTvG
         sLKOVmpFjTPj6QuSxq+g6jOLhHmyOJfQpIz2mzXLtLIZQ7MlR20wc7+y8IUc+wm+N2wG
         zlfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940719; x=1723545519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBE9cbqqy9E10rFhHW0Wgihe2/UchPViyrmjttfLQ6E=;
        b=FSy+flqEVKZpL7SlfyjbBFgrpqUHoePjEz78JjukSBHsICgoVJU/RgkC8is/1DQKyH
         qy5hF1HSff9i0H76bG9DoCyYSWO8NaeWlrUo+zoqvTCnyfQ/kyJm8XQ5wj8Yl94Yyw+H
         dnXrOE0+aPSMf9EUlAjc+LlDmVadsAgvdmQkjZmvlvJZU8m+Y/wY5RGmKrPCdA4m5NJp
         wk8lwSmPV/aVXECUVyDy/3uVnpNdyOq9OKK6z6je4LtBgquU73EZVOc/K2wQZlEXhSgE
         nRR6jiTQm+Rc510SEta2nkuZYD3jlBfnemYgygO6+TERpRRbsWrFZNOdh24u66VAua/g
         nwgA==
X-Forwarded-Encrypted: i=1; AJvYcCU/ldo/YQdWW9bXc6gMqLecZoYSvOVAuq8rJ93SL2btpe9xhNM15bPc52B/O7fITHpwM2S/+fWMZxBQ15NEw2rQ6o85HlvHLYd0VmO1oUoJlfhJ/xo/2eJuFYBLJghpAHCtwc9npHIEU4n/bxBfKw60TB2jfMqVnVwxMKvcVf+PSyxVwnOVmrTv
X-Gm-Message-State: AOJu0YzRGiGajfuND8AQzGE5AcER427tT83l04QsKeBVbzmYW8zq4MC0
	uX5p+uFg0E0a2zopVDDKlWCDcVfVdbUDUHMoJPoSZVf5ceUKQ00n
X-Google-Smtp-Source: AGHT+IFeoNZTBJIcwXObcpVFY6Q7EaDDvgDY5rZpxHnHyuZgINHleuwM7ffl5V+qHwaBw6XGBqXTEw==
X-Received: by 2002:a05:6a21:6f87:b0:1c4:c7ac:9e5b with SMTP id adf61e73a8af0-1c6996605e3mr12075324637.45.1722940718410;
        Tue, 06 Aug 2024 03:38:38 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec4169csm6775561b3a.64.2024.08.06.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 03:38:38 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property
Date: Tue,  6 Aug 2024 16:08:16 +0530
Message-ID: <20240806103819.10890-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
This fixes dtbs_check errors.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
There are 12 similar errors related to this missing property from
different blobs.

./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
Unevaluated properties are not allowed ('big-endian' was unexpected)from
schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 36b836d0620c..24d47b1701a7 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -48,6 +48,8 @@ properties:
   clocks:
     maxItems: 1
 
+  big-endian: true
+
   fsl,ext-reset-output:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-- 
2.45.2


