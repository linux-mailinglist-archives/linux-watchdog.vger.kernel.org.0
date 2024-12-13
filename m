Return-Path: <linux-watchdog+bounces-2571-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1E19F15CD
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 20:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AD1A7A071C
	for <lists+linux-watchdog@lfdr.de>; Fri, 13 Dec 2024 19:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7018418CC1C;
	Fri, 13 Dec 2024 19:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZqosECr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9F31684AC;
	Fri, 13 Dec 2024 19:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734118146; cv=none; b=qNVq2mbYdzA63YqcX/vjzcg92cEcQsHJYAT4mX661wkrvUIZE2a4j4tAgtUm6h0I+DdiF23V9FJ4Jgl0HUML+W8cOi6yJZxNI/huMogd8SUX6Ghc/9y+cb0r1K42mJLW1SXi48A9Ssj3ZEz1Bxw3Nk+jh+GQ7K55YSenTNsqIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734118146; c=relaxed/simple;
	bh=C2sO2rvjSCbLIJIBa0W0gv105kvuevPoESRNPZ3IZLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0YNCQAhZ7GOPT2dj/FFaUpSnJYXHr/tGSmbr77dFTHz89muYQG66rUXSQbqqG+4UWBAQ8keMQhLvGXruo1khJQBDuISpp5cYNkrC8WGBE4jPsq5o/+Z7M9VRstGJEyFW+8lsgk8y5G4nmA1fveqCcMv7YKh5zT7T3AzxtLo+no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZqosECr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso14230645e9.3;
        Fri, 13 Dec 2024 11:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734118143; x=1734722943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aSAXPH3RM74MZOniHRzTnUh9xPj/wxsLjDKePkwJhVY=;
        b=AZqosECrl4DgimgMv71OTBOeSljaUZd76O2x91I+c1jA45JbFC056N8EMLcNXVbShP
         yGsGm71Bvn+0/no2EpzlQxJAMUetswUzicLnepduoAeXn4FvERTeMPlj8lIwp413gGXJ
         BqSUBS/2EM6da61sRvGsSG8IEY3H5c+lzM2+/b8930C1LsiRFRaxSc7dT8BgE5BwyBpt
         plm2LquxsXn+BA2PHEAAroHIwJ1+ooB26DIyJyGOjmhLr/oEYlHcF5SuvF+/ZUR/FAao
         rJ5U/Z5JNzTKTDU3wColBy0ipkQ/2ukOyUlbgqmP+DLbaKiBztBI9z4U+Is/fmDwehKV
         X8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734118143; x=1734722943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aSAXPH3RM74MZOniHRzTnUh9xPj/wxsLjDKePkwJhVY=;
        b=R1kAnYPhHxn6B8bKTWAYbxRorPvXCy2ezBZapGOR7M9ZW1jDGPN66GJyXqkETVw0ao
         tzclTef1lONZi7Pt7kZL2SpWLvmRYB58KJgEhA3QKox00ohLjAOb02YXe4SvMwAmonrm
         NcSyQQeG27WxniL8JJ7X2h1JBxrwJkN0yO3H6TtD/iJi6644sRoanx5iMz7D5DTpepeB
         1whiWI6cTuCZTX6aUYoCftAO5nS/6W87Tw01kmvakpbuPQ7aOOKDPfRUmoHqJSHtwJNr
         WqCcewXlhFWp1E3HntKv+2xWOv5FdiaQg6GzMGgLXFHxlu1wxVB0AMpKbNzD7jGnRXoI
         +uCw==
X-Forwarded-Encrypted: i=1; AJvYcCUnr1XMJVINX3wHYIGCxfdJG9spZqLR8zOo4RNIClIx7CST93drHrf4NEFVz0Gp1L3E7DGSPjl53n8VjltTHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3frKfdyTWJf2FUmPT1lBznFs0vYNMnEAmYsDhZ/S75HB+9vrQ
	Oi723GI6S9d1iMnt+9b1fWLQDm8fnWgJAB0EANd/2dor7mbIGXyS
X-Gm-Gg: ASbGncs5mVABZhcuObSXWGt4VdK7Lm4ABkVVvQIx80c5bqqha5LD9G+YS3TbLot/uKd
	SlbL1TnnHngJwVNajKIIkggSFh8LPjkyAVkZ99090w8raM4MpB0ZHDzmKncgEysHuayfyKt0PsF
	vO7LhhHzQEdEdTRCNogCNHnV8Uy7sjFSNIV1NL+DiiZZ9wkdT8WWaEqPa9sLqF28beDCeLzQ/+m
	WUWBlKElwcpbw1o5nmy50BqZDymNgZfVGiXsrHPYBBTIxj6RCnsoxn9BtpbAoPEbHcy
X-Google-Smtp-Source: AGHT+IFaHLDtoWS4WCM/yFAzUenZ4loXODVsbcvLaD+FL29Hes34Tx0tfk2DcH8naOnPEY5McRgCUQ==
X-Received: by 2002:a05:6000:4619:b0:385:e0ea:d4ef with SMTP id ffacd0b85a97d-3888e0c0661mr2546475f8f.58.1734118142703;
        Fri, 13 Dec 2024 11:29:02 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:761b:d1fd:bb77:d276])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c806055bsm310989f8f.92.2024.12.13.11.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 11:29:02 -0800 (PST)
From: Lad Prabhakar <prabhakar.csengg@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] watchdog: sp805_wdt: Drop documentation of non-existent `status` member
Date: Fri, 13 Dec 2024 19:28:58 +0000
Message-ID: <20241213192858.916377-1-prabhakar.csengg@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the documentation for the `status` field in the `sp805_wdt`
structure, as the field does not exist.

Signed-off-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
---
 drivers/watchdog/sp805_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
index 109e2e37e8f0..7a1c7b42f9ef 100644
--- a/drivers/watchdog/sp805_wdt.c
+++ b/drivers/watchdog/sp805_wdt.c
@@ -62,7 +62,6 @@
  * @clk: (optional) clock structure of wdt
  * @rate: (optional) clock rate when provided via properties
  * @adev: amba device structure of wdt
- * @status: current status of wdt
  * @load_val: load value to be set for current timeout
  */
 struct sp805_wdt {
-- 
2.43.0


