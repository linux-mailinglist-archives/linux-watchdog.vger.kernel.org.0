Return-Path: <linux-watchdog+bounces-4499-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EEBC28EFF
	for <lists+linux-watchdog@lfdr.de>; Sun, 02 Nov 2025 13:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CED424E1C47
	for <lists+linux-watchdog@lfdr.de>; Sun,  2 Nov 2025 12:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A232528FD;
	Sun,  2 Nov 2025 12:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESaAA0rg"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607844A3C
	for <linux-watchdog@vger.kernel.org>; Sun,  2 Nov 2025 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762085691; cv=none; b=cvWHw4W7GEe6JPTTq8FG8+uv65neNV3fJPv66DiLEy8NtcjCsOD+QqIeKNwAfylPPlDyDEMjTICx88ev0+VKzWgIMccOmjpvnfPyNf90bukw/mguO1Bgf1cUkBaeY5nkc52jWpW7ZFQFuNEVPTrSBYVuZr2mrgtmzG+S4IGy8mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762085691; c=relaxed/simple;
	bh=ol78MnOzYqCpj4xHNIm6pzXtOiTHuOLRRI/WA36G40k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YQDZn0vd1wYH/cSFitmPDY0HJoE+ax2uySIFg+5mK2xAtOBX0rV2t7Ff3NHH8e2rKRniqh+OTGVLFGv8YM+doOaVgWzzrFNRZRo+GQeQlEvRJqVRQSjYlyfxg4PGIDV9xHuzRzCWeumdmgpZkUXDU+8ckg2D5PMO+41iGAP4c04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESaAA0rg; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-591c74fd958so3784370e87.3
        for <linux-watchdog@vger.kernel.org>; Sun, 02 Nov 2025 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762085687; x=1762690487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HiQTcCjrBICpDprDtneCouSMSht13r31Nvj19QRNpDY=;
        b=ESaAA0rg2txD7YNOQtfZNOC1z79clHb6OcZQFsDj25T9+SC0Kb4Rtdap1QEg1OOkCj
         bljHYnCs4c3Z1RFmOW3ForuYbADs+n9MfnUhc24cOUNTA3q1o7xwaiobSawX+/AamruR
         OaCA2ItRbDLq4MfvLFMdCvBu2Z9DPLAxFWJphunv97+7bxjxaoSomKaNssaM84wE/qpj
         rSy9P+ytvFIos5jrYEB0bDc2V+NwXSFb1W0VwA4wcOZQYPhtPOmtjknS1sbPsxNHPGog
         xTaWRX8W84bYqJXfV+u3MUvvcASb8enCzwyD+Quey+fX1PJqTZZ6+eE37n/wfHFRVmXr
         BWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762085687; x=1762690487;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HiQTcCjrBICpDprDtneCouSMSht13r31Nvj19QRNpDY=;
        b=qnSZeXci9gyl9uZQ0K5VxaeMyPu1oFv+/NCNEkXZLeZ2XbFvNaiNrQ2UwQQZQLcRqL
         MuvetMA1zCDw9uSqXnkj5hqK8Ho3DiI8zgdfMpc8ggXLUrab1nfDBDoR171M7vaVLwbq
         ZU2S0TfORdERTinH3wbHpwNqgk5AdKDkr63E2Ljp3HD66CggPQnmZW6NkqeA8NuOh/Oc
         6iCq410GXxh1w0J4KbY/ccpR9dFXb0ODVfkOzTFNJ71xQvzYFcFjaZ1XzjL1yUzlLRam
         JapVHRDvKOzMqvcEiPiHLDVP3bO2ukEfvyBgC25asK0sU4cIYKKws4rfnh1vjGcYPS10
         PYxA==
X-Forwarded-Encrypted: i=1; AJvYcCUuNVVurUMzPZ9p6Ofl5Itarje6KkKqILtL/mAfZkDvYouQ/NYwnrSDNoQ3Ic2fX94cZCU6JRKvqn2RpUnkRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3eIaHDaCT+WVheyZqi6j1e+6r4UsZvN3QnDvM4smGTMp8JIGx
	V2vlFzVfmheXXE6u9hgWRGfdMW1yxhoMw27Ur35DzndNSpmRlRmW2dFH
X-Gm-Gg: ASbGncvmVLPclWnAAls1etCagRO/9fYPr8sNlHbwz7XalYXY5efxzyE+sS1rTBy4m0n
	Spg7wseO1t6APhnkjBb+tH9HnRAz9hV7+N0Ec7x1DhIIZIXnlPthnztQqAd+JYsE5W5z4lSUXjA
	wG9x7Tyqyau6UccjZuwuNkD8QrgbmicDJvLXneEhlr3xspveq5PgRqI1e5F2f5l6Y/CBHED60bW
	JcqjjMJK0aEZcVEEZzfN5NBdq6DIz5qWkuetZ2wLU2m59/Mv6ef8KPKHcF+zSJRkrDY3YFfKjBI
	cHwc3xDvdMlKSEURKfgfr+ge3Qh0KRidELw78+9B5Be44YCgkDaNgZo8k30CRBnBDuryFabRkzz
	6GexoKRDLKKQ7zrOAWdwFwhO/ftk1+RupTJ1uQhXCsiZ/eAuDw+OM46E/doi5dP8xBATbdx4Z6V
	Xg+Ho=
X-Google-Smtp-Source: AGHT+IGMRGm4/WR/4L3aIyPW8LTQyvRM6kEmpyechdTB0XJmITzbv8KecSzkU0+tptyfsFCmAXHoPA==
X-Received: by 2002:a05:6512:3b0a:b0:594:2cfe:36a7 with SMTP id 2adb3069b0e04-5942cfe3b1emr98655e87.4.1762085687115;
        Sun, 02 Nov 2025 04:14:47 -0800 (PST)
Received: from archlinux ([109.234.28.204])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5942d2e60a4sm36937e87.80.2025.11.02.04.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 04:14:45 -0800 (PST)
From: zntsproj <vacacax16@gmail.com>
X-Google-Original-From: zntsproj <vseokaktusah7@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: wim@linux-watchdog.org,
	linux@roeck-us.net,
	linux-watchdog@vger.kernel.org,
	zntsproj <vseokaktusah7@gmail.com>
Subject: [PATCH] watchdog: fix typo 'paramter' -> 'parameter'
Date: Sun,  2 Nov 2025 15:14:31 +0300
Message-ID: <20251102121431.5546-1-vseokaktusah7@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
---
 drivers/watchdog/diag288_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/diag288_wdt.c b/drivers/watchdog/diag288_wdt.c
index 887d5a6c1..b6b487910 100644
--- a/drivers/watchdog/diag288_wdt.c
+++ b/drivers/watchdog/diag288_wdt.c
@@ -9,7 +9,7 @@
  * not recommended because it's only supported on z/VM but not whith LPAR.
  *
  * On LPAR, the watchdog will always trigger a system restart. the module
- * paramter cmd is meaningless here.
+ * parameter cmd is meaningless here.
  *
  *
  * Copyright IBM Corp. 2004, 2013
-- 
2.51.2


