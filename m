Return-Path: <linux-watchdog+bounces-3383-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF2A9A31D
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 09:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A911F194673B
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Apr 2025 07:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005E41E0E0C;
	Thu, 24 Apr 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVaRa8eR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C234CA52;
	Thu, 24 Apr 2025 07:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479023; cv=none; b=YS7s08/gHlMggh3AkldGnkIzFnTxNAdrZn1STM1oCQboPobygqLFLUfVloh529EI7qWqrFCpg00pHJ0YWlbFxsHbJwHFYB1H3H7fNCAYy1QTJM9k/m0aGL50byK3AW+LIjCTx7b99w8Nu9ddmVqo12AzR/Djq3AKraXD+8oAZVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479023; c=relaxed/simple;
	bh=S2oL+17kOxO5P7SuWbpRTWMYoGl5atskhrO15ABybnY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dIDbKP459/EH+nPTqAf99CKMNy+1e17enEedYp3zHU2e/J0vnTRKyfAMDXBm+ykyGcHHRl8YTCS+vbtNnAT2PDql6yWJE2SxyDZ3F6lupCzM4UfvlsKY9k1B58BUp3VrEbECsohGB4f6CkfMOejwd5gs8rUTlbgPGYce7/VMago=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVaRa8eR; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so606654b3a.1;
        Thu, 24 Apr 2025 00:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745479021; x=1746083821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbXoBTVxxUJ/qJokDFHPM4/DnBZBnvtGYXztkvYOKJ8=;
        b=SVaRa8eRxBGTepcvqkc6xJb9khe99xCq/pzdKeslzJAxQhQ7KVV4GL+Osf79gXez0Z
         kdyLPDzMZ8j017GYoG+Pr+LtzaOIOC2F39ofaGx5yfU65sGGw7Qj50GPkEeBInVfdy8G
         6wt8vOCQynQQKbJl1kZk/W0+skQ5TXf0dOqhggNnT20HvrkuyGirC7OVuVAhZ2o869uC
         5BbQx+P11cuNjXIaLmt/dZCsWF/BKwH3OL1SNERtZR4ArX1toifkhmc2jABSaT8GXXkI
         ZF2c177yfzK5Suo3VlBFY3IwCVAJqy+XEUYdg3WdZ+PLKgRc+hMekSWIn4dC3jPY3qMu
         nCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479022; x=1746083822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbXoBTVxxUJ/qJokDFHPM4/DnBZBnvtGYXztkvYOKJ8=;
        b=mlG9zZEmAN4SM9FNLX8kXu4iiFr9BdE+KSR3zDKFOtw9TWe2OJGekAhBgYUrcJANRA
         7CHklONFwo+1MNmCJluRCh27YYYVUJfdLvTfmn6k8Ck2XE6c22Ygj206r0OmnHWPb4Gj
         V+iuSrF10VLB1RWaRYlNKdFJW/e5Zaf2kjJIH3lOzKoHyy/JhGCMlx3HmCYdlkF6jirU
         2vf1ba9HM03an7fR9TtNPzt/SyY1z8rtA6f0jDVaNz8yX63H+2bTaW2IiskN8MOI7JY+
         5iSOFC3Clf2FwbOhl1ryVLNyYCQnqAno2VNCDsFIUkQaRyJtHN/fC9eqLzHNnSPkV8LP
         c5iA==
X-Forwarded-Encrypted: i=1; AJvYcCXbVh1yN/xMXEmmWRqU35ZEOYNpr8kbkAORjFbtah0MnJi6l4d/9zZdyRtQmcssEKZBU3jfsBuvsq+Fnp4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Y9Bk6lDihnwXOkw8libSXDBnVx9riSFTwflCtLxJPD9bQrMO
	su/gwwpARjkVSgH11lLBNmFPRx9B8pi81IRO8/Ujs7I+vcSm+g+yCCNsZ2fHpEy83Q==
X-Gm-Gg: ASbGncth5B+cZuOVRq9F0Mis+C69hUTfGz26miyC+iO/3i1SJosFg/usgBLhWWOOdgT
	5grT2ZKdu4NjNyf37Kc3hDmjMf29/gfjVp/CKmZz3s3cw+dZ2qF9HVXteaclDgrjcaRPyMy0lXU
	dPB+qm4SJJFjsg5usQMvnXnPGuibvbLD6h34h2wPISKl7kxBNx/waYIvKp3DJvqBM+llT9A+KJb
	QHW2+Wm++jrtXFx/h+nuL0iUBKifhk0zklkeB9dXVSXeaNomQ4zCyrnA7SMmTtWUYhB6mOQfcGS
	uS+BOH3yKCS+qAJaU4riTYAl9lpNueSsde5c4BmF8cYlso7fHwTE49yKCmOmg2xoCpg=
X-Google-Smtp-Source: AGHT+IE8Da/gkcfgc7D72TY2d0Y/YM7Og6C8tPdL/c0+hk+o/Q15F7XJg7rpZ0tz8VkRW+lp2zeR1w==
X-Received: by 2002:a05:6a00:1398:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-73e245e3e0dmr2459576b3a.7.1745479021523;
        Thu, 24 Apr 2025 00:17:01 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a171sm712935b3a.87.2025.04.24.00.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:17:00 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] watchdog: lenovo_se30_wdt: Fix null-ptr-deref in lenovo_se30_wdt_probe()
Date: Thu, 24 Apr 2025 15:16:48 +0800
Message-Id: <20250424071648.89016-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_ioremap() returns NULL on error. Currently, lenovo_se30_wdt_probe()
does not check for this case, which results in a NULL pointer
dereference.

Add NULL check after devm_ioremap() to prevent this issue.

Fixes: c284153a2c55 ("watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30 platform")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/watchdog/lenovo_se30_wdt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/watchdog/lenovo_se30_wdt.c b/drivers/watchdog/lenovo_se30_wdt.c
index 024b842499b3..1c73bb7eeeee 100644
--- a/drivers/watchdog/lenovo_se30_wdt.c
+++ b/drivers/watchdog/lenovo_se30_wdt.c
@@ -271,6 +271,8 @@ static int lenovo_se30_wdt_probe(struct platform_device *pdev)
 		return -EBUSY;
 
 	priv->shm_base_addr = devm_ioremap(dev, base_phys, SHM_WIN_SIZE);
+	if (!priv->shm_base_addr)
+		return -ENOMEM;
 
 	priv->wdt_cfg.mod = WDT_MODULE;
 	priv->wdt_cfg.idx = WDT_CFG_INDEX;
-- 
2.34.1


