Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E71B463CC2
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Jul 2019 22:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729012AbfGIUe1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 9 Jul 2019 16:34:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39840 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbfGIUe1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 9 Jul 2019 16:34:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id z23so100444wma.4;
        Tue, 09 Jul 2019 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JW4pZp5yWurq7Q7UhzYQACCrJGsw4TFiXM6qLjGCVg0=;
        b=YhX+81CrwKeI4FkvJGZ7vRLxnT5K52Y7j9LDT8/gNvuZhntHatNVDvWJhoHhxnL6rH
         ozXRa67t/azRgYw5Coifbnix/RYsEl/MupQWiuC/SksvX2hsvJ50njJChymcmpcOIyoL
         hclNNROQ/0OrZf1eqz1Jb3R6uClPsL+mozaRa9xjMj52rIyPJymTz0hpMPKjQSaxFtUS
         fBP9XyouGZQ3QwQJesUz1+Hec8UP/AWfCZY8ZLU+Xqmr4b65CIfEoryWLl+G3plSjbmT
         XxZr8UadZe1N4+T/r/HNnKJme2DwhPln8pPWyHA/VVnmIKW+CFYVISV/Jt/0qZKqDRNm
         igqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JW4pZp5yWurq7Q7UhzYQACCrJGsw4TFiXM6qLjGCVg0=;
        b=V52kxOGLBrSVaz7awIM2uq2oBG/wkyR5FXFsF3E9aKiZpqmr/cP4WPxdgEkIkKwSWq
         yah3NLmPgdWzgpkUGpsTZg+Jawz57AgDztHayOOHGYlCFSmFF/pleNGiHLNdUtXjPgcG
         Ig3Ee3fZEv9gPv5v5W1LlwOsbOpObC7IhpITJxV/WJMpNAanZ/sejUpyYcv6KqNEBGZN
         ZH/tFR6fJH/YkfGmNjp9+K2+ompPl0Yh39fOilFgUodgFn6I2FvV0hV4a7ZfVIGD4u4Z
         PhZx/9PNTTOHidE7tB4RvSoiglpgNh8+avdBCWpqCu9ODAGk7DCOLMe+LiOvYYuPq1no
         5yeQ==
X-Gm-Message-State: APjAAAWMJI6wW64ihIahiHd86Jcv0vAhDznDXiZTxyPzXRaYdsL262mf
        wuzkRhK4w7DmpbRKlVp7nXsSqCSq1DMVsg==
X-Google-Smtp-Source: APXvYqycXYrc4+rUtZW7EGPXG00XXUE7raSCtwgSfAnQ782kPpj5ut4EnHEoACqwEJDyPJL3SHoZqQ==
X-Received: by 2002:a1c:228b:: with SMTP id i133mr1348861wmi.140.1562704464486;
        Tue, 09 Jul 2019 13:34:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id t24sm60492wmj.14.2019.07.09.13.34.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 13:34:23 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        "kernelci . org bot" <bot@kernelci.org>
Subject: [PATCH] watchdog: digicolor_wdt: Remove unused variable in dc_wdt_probe
Date:   Tue,  9 Jul 2019 13:34:09 -0700
Message-Id: <20190709203409.117123-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

clang warns:

drivers/watchdog/digicolor_wdt.c:121:6: warning: unused variable 'ret'
[-Wunused-variable]
        int ret;
            ^
1 warning generated.

It's unused now, remove it.

Fixes: cdad26977e3f ("watchdog: digicolor_wdt: drop warning after registering device")
Link: https://github.com/ClangBuiltLinux/linux/issues/591
Reported-by: kernelci.org bot <bot@kernelci.org>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/watchdog/digicolor_wdt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
index 33cda95bd238..073d37867f47 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -118,7 +118,6 @@ static int dc_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct dc_wdt *wdt;
-	int ret;
 
 	wdt = devm_kzalloc(dev, sizeof(struct dc_wdt), GFP_KERNEL);
 	if (!wdt)
-- 
2.22.0

